require 'rails_helper'

describe "timezone" do

  let(:timezones) { ActiveSupport::TimeZone }
  let(:pacific) { timezones['America/Los_Angeles'] }
  let(:eastern) { timezones['America/New_York'] }
  let(:nine_am) { '2016-03-04 09:00:00' }
  let(:noon)    { '2016-03-04 12:00:00' }
  let(:five_pm) { '2016-03-04 17:00:00' }

  let(:noon_eastern) { eastern.parse noon }
  let(:noon_pacific) { pacific.parse noon }
  let(:nine_eastern) { eastern.parse nine_am }
  let(:nine_pacific) { pacific.parse nine_am }

  let(:five_pacific) { pacific.parse five_pm }
  let(:five_pacific_in_utc) { five_pacific.in_time_zone('UTC') }

  context "noon Eastern" do
    it "is later than nine Eastern" do
      expect(noon_eastern).to be > nine_eastern
    end

    it "is the same instant as nine Pacific" do
      expect(noon_eastern).to eq nine_pacific
    end

    it "comes sooner than noon Pacific" do
      expect(noon_eastern).to be < noon_pacific
    end
  end

  context "#in_time_zone" do
    it "should format correctly" do
      expect(noon_eastern.strftime("%H:%M")).to eq "12:00"
      expect(noon_eastern.in_time_zone(pacific).strftime("%H:%M")).to eq "09:00"
      expect(noon_eastern.in_time_zone("America/Los_Angeles").strftime("%H:%M")).to eq "09:00"
    end

    it "should change the date" do
      expect(five_pacific.to_date).to        eq Date.new(2016, 3, 4)
      expect(five_pacific_in_utc.to_date).to eq Date.new(2016, 3, 5)
    end
  end

  context ".use_zone" do
    it "should not affect Time.strptime" do
      t1 = Time.use_zone(pacific) { Time.strptime(five_pm, '%Y-%m-%d %H:%M:%S') }
      t2 = Time.use_zone(eastern) { Time.strptime(five_pm, '%Y-%m-%d %H:%M:%S') }
      expect(t1).to eq t2
    end
  end

  context ".parse" do
    it "should use the timezone when parsing" do
      t1 = pacific.parse five_pm
      t2 = eastern.parse five_pm
      expect(t1 - t2).to eq 3.hours
    end
  end

  context '#end_of_day' do
    it "should respect the time zone" do
      expect(five_pacific.end_of_day.strftime("%m %d")).to        eq "03 04"
      expect(five_pacific_in_utc.end_of_day.strftime("%m %d")).to eq "03 05"
    end
  end

  context '#beginning_of_day' do
    it "should respect the time zone" do
      expect(five_pacific.beginning_of_day.strftime("%m %d")).to        eq "03 04"
      expect(five_pacific_in_utc.beginning_of_day.strftime("%m %d")).to eq "03 05"
    end
  end

end

