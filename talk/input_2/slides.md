!SLIDE

# Parsing

In any Rails:

    @@@ruby
    tz.parse("01:18:14")    # watch out for 12/25/2016 vs 25/12/2016

Or in Rails 5:

    @@@ruby
    tz.strptime("01:18:14", "%H:%M:%S")   # By me! :-)

or in Rails < 5:

    @@@ruby
    t = Time.strptime("2014-04-08 03:15", "%Y-%m-%d %H:%M")
    tz.local(t.year, t.month, t.mday, t.hour, t.min)

