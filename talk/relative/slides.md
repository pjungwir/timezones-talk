!SLIDE

# Everything is Relative

Good advice?

    @@@ruby
    Time.now                 # system time zone: AVOID!  (?)
    Time.zone.now            # Rails time zone:  BETTER! (?)

    current_user.time_zone   # User time zone: BEST!
    current_user.company.time_zone
    sales_office.time_zone


