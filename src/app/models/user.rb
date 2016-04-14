class User < ActiveRecord::Base

  has_many :sales

  def tz
    ActiveSupport::TimeZone[time_zone || 'UTC']
  end

end
