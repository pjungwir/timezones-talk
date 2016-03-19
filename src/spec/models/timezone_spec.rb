require 'rails_helper'

describe "timezone common sense" do

  let(:timezones) { ActiveSupport::TimeZone }
  let(:pacific) { timezones['America/Los_Angeles'] }
  let(:eastern) { timezones['America/New_York'] }
  let(:nine_am) { '2016-03-04 09:00:00' }
  let(:noon)    { '2016-03-04 12:00:00' }

  context "noon Eastern" do

    let(:noon_eastern) { eastern.parse noon }
    let(:noon_pacific) { pacific.parse noon }
    let(:nine_eastern) { eastern.parse nine_am }
    let(:nine_pacific) { pacific.parse nine_am }

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

end
