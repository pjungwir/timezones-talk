!SLIDE

# Whose perspective?

    @@@ruby
    tz = ActiveSupport::TimeZone['America/Los_Angeles']
    tz.parse("08:34")
    t.in_time_zone(tz).strftime("%H:%M:%S")

    tz = Time.zone     # Should be UTC!

