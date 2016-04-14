require 'rails_helper'

describe Sale do

  let(:me)  { User.create! username: "me",  time_zone: "America/Los_Angeles" }
  let(:you) { User.create! username: "you", time_zone: "Europe/Berlin" }

  before :each do
    me.sales.create!(sold_at: '2016-02-10 22:27:00', price_cents: 2000)
    me.sales.create!(sold_at: '2016-02-11 02:27:00', price_cents: 2000)
    me.sales.create!(sold_at: '2016-02-11 16:27:00', price_cents: 2000)
  end

  it "should group by UTC days by default" do
    result = Sale.connection.select_rows(<<-EOQ)
      SELECT  date_trunc('day', sold_at) d,
              SUM(price_cents)
      FROM    sales
      GROUP BY d
      ORDER BY d
    EOQ

    expect(result[0]).to eq ['2016-02-10 00:00:00', '2000']
    expect(result[1]).to eq ['2016-02-11 00:00:00', '4000']
  end

  it "should group by Pacific days if told" do
    result = Sale.connection.select_rows(<<-EOQ)
      SELECT  date_trunc('day',
                sold_at AT TIME ZONE 'UTC'
                        AT TIME ZONE 'America/Los_Angeles') d,
              SUM(price_cents)
      FROM    sales
      GROUP BY d
      ORDER BY d
    EOQ

    expect(result[0]).to eq ['2016-02-10 00:00:00', '4000']
    expect(result[1]).to eq ['2016-02-11 00:00:00', '2000']
  end


  it "should group by seller time zone" do
    you.sales.create!(sold_at: '2016-02-10 22:27:00', price_cents: 2000)
    you.sales.create!(sold_at: '2016-02-11 02:27:00', price_cents: 2000)
    you.sales.create!(sold_at: '2016-02-11 16:27:00', price_cents: 2000)

    result = Sale.connection.select_rows(<<-EOQ)
      SELECT  date_trunc('day',
                sold_at AT TIME ZONE 'UTC'
                        AT TIME ZONE u.time_zone) d,
              SUM(price_cents)
      FROM    sales s
      INNER JOIN users u
      ON      s.user_id = u.id
      GROUP BY user_id, d
      ORDER BY user_id, d
    EOQ

    expect(result[0]).to eq ['2016-02-10 00:00:00', '4000']
    expect(result[1]).to eq ['2016-02-11 00:00:00', '2000']
    expect(result[2]).to eq ['2016-02-10 00:00:00', '2000']
    expect(result[3]).to eq ['2016-02-11 00:00:00', '4000']
  end

end
