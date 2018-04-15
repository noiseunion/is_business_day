# lib/is_business_day/holiday_rule.rb
module IsBusinessDay
  class HolidayRule
    def initialize(name, options = {})
      @name   = name
      @month  = options.fetch(:month)
      @day    = options.fetch(:day, nil)
      @rule     = options.fetch(:rule, nil)
    end
    attr_reader :name, :month, :day

    # Test a date to determine if it matches the rule or not.
    # @param [Date, Time] date_or_time
    # @return [Boolean]
    ##
    def test?(date_or_time)
      if fixed?
        resolve(date_or_time) == date_or_time
      elsif moving?
        resolve(date_or_time) == date_or_time
      else
        false
      end
    end

    def resolve(date_or_time)
      if fixed?
        Time.zone.parse("#{day}/#{month}/#{date_or_time.year}")
      elsif moving?
        start_of_month = Time.zone.parse("01/#{month}/#{date_or_time.year}")
        position, day_name = parse_rule
        days = fetch_specific_days(day_name, start_of_month)
        days.send(position)
      end
    end

    private # ---------------------------------------------

    # match exact day of the month (christmas)
    # match a specific day based on position (thanksgiving)
    def fixed?
      !moving? && day.present?
    end

    def moving?
      @rule.present?
    end

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
