!SLIDE

# Slicing

    @@@ruby
    t.in_time_zone(tz).to_date

But you should store datetimes, not just dates.

Also it's better to retain full resolution in Ruby:

    @@@ruby
    t.in_time_zone(tz).end_of_day
    t.in_time_zone(tz).beginning_of_day   # aka midnight


