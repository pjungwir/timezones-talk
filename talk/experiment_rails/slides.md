!SLIDE

# Experiment: Rails

What day is it?
  
    @@@asciidoc
    2.2.3 :001 > t = Time.zone.now
     => Wed, 30 Mar 2016 03:34:45 UTC +00:00 

    2.2.3 :002 > t.in_time_zone("America/Los_Angeles")
     => Tue, 29 Mar 2016 20:34:45 PDT -07:00 

    2.2.3 :003 > t.to_date
     => Wed, 30 Mar 2016 

    2.2.3 :004 > t.in_time_zone("America/Los_Angeles").to_date
     => Tue, 29 Mar 2016 


