require 'rails_helper'

describe User do

  let(:me)  { User.new username: "me",  time_zone: "America/Los_Angeles" }
  let(:you) { User.new username: "you", time_zone: "America/New_York" }

  context "#tz" do
    it "should find a time zone" do
      expect(me.tz).to  eq ActiveSupport::TimeZone['America/Los_Angeles']
      expect(you.tz).to eq ActiveSupport::TimeZone['America/New_York']
    end
  end

end
