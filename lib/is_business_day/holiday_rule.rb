# lib/is_business_day/holiday_rule.rb
# on supports: :first, :second, :third, :fourth, :fifth, :last, :every
# :every_thursday
# :first_thursday
# :last_thursday
#

module IsBusinessDay
  class HolidayRule
    def initialize(name, options = {})
      @name   = name
      @month  = options.fetch(:month)
      @day    = options.fetch(:day, nil)
      @rule     = options.fetch(:rule, nil)
    end
    attr_reader :name, :month, :day

    def test?(date_or_time)
      if fixed?
        date_or_time.month == month && date_or_time.mday == day
      elsif moving?
        position, day_name = parse_rule
        days = fetch_specific_days(day_name, date_or_time)
        days.send(position) == date_or_time
      else
        false
      end
    end

    # match exact day of the month (christmas)
    # match a specific day based on position (thanksgiving)
    def fixed?
      !moving? && day.present?
    end

    def moving?
      @rule.present?
    end

    private # ---------------------------------------------

    def parse_rule
      (@rule.to_s || '').split('_', 2).map(&:to_sym)
    end

    # Takes the current date and fetches all of the specified day for that month.
    # for example all of the :mondays
    # @param [Symbol] day: monday, tuesday, etc..
    # @return [Array]
    ##
    def fetch_specific_days(day, date_or_time)
      days = date_or_time.beginning_of_month
                         .to_date
                         .step(date_or_time.end_of_month.to_date, 1)

      days.send(:select) { |current_day| current_day.send("#{day}?".to_sym) }
          .map(&:to_time)
    end
  end
end
