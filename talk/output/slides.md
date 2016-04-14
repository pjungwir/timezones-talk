!SLIDE

# Outputting/Formatting

Easy!

    @@@ruby
    t = Time.now    # just to be bad
    t.in_time_zone("America/Los_Angeles").strftime("%H:%m")
    t.in_time_zone("America/New_York").strftime("%H:%m")
    t.in_time_zone(current_user.time_zone).strftime("%H:%m")

