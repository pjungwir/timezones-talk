!SLIDE

# Wrap everything?

You've probably seen this advice:

    @@@ruby
    class ApplicationController < ActionController::Base

      around_filter :with_time_zone, if: :current_user

      def with_time_zone(&block)
        Time.use_zone(current_user.time_zone, &block)
      end

    end

Works?:

    @@@ruby
    Time.use_time(tz) {
      Time.strptime("2016-03-29 03:15", "%Y-%m-%d %H:%M:%S")
    }


