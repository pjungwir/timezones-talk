!SLIDE

# Experiment: Rails 2

What have we got?
  
    @@@asciidoc
    2.2.3 :017 > Time.now
     => 2016-03-29 21:19:11 -0700 

    2.2.3 :018 > Time.zone.now
     => Wed, 30 Mar 2016 04:19:13 UTC +00:00 

    2.2.3 :019 > Time.now.class
     => Time 

    2.2.3 :020 > Time.zone.now.class
     => ActiveSupport::TimeWithZone 

    2.2.3 :021 > Time.zone.now.public_methods.sort
     => [:!, :!=, :!~, :+, :-, :<, :<=, :<=>, :==, :===, :=~, :>, :>=, ...

