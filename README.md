# is_business_day
[![Build Status](https://secure.travis-ci.org/noiseunion/is_business_day.png)](http://travis-ci.org/noiseunion/is_business_day)
*is_business_day* extends the Date and Time objects in Ruby to include some simple helpers for determining if a specific date is a business day, or not.  It also includes helpers for getting the next or previous business days as well as testing for major holidays.

## Installation

Add it to your Gemfile

`gem "is_business_day"`

And then run `bundle install` to install it.

## Usage

After installing the gem you can now take advantage of the additional instance methods made available to the standard Ruby Date & Time objects.

### Boolean Test Helpers

##### is_a_business_day?

```rb
# Test that today is a valid business day
Date.today.is_a_business_day? 
 => true

# Test that today is NOT a valid business day
Date.today.is_not_a_business_day?
 => false
```

Valid business days are currently Monday thru Friday.  In addition, the following major holidays are also recognized as not being valid business days:

- New Year's Day
- Memorial Day
- Fourth of July
- Labor Day
- Thanksgiving Day
- Christmas Eve
- Christmas Day

NOTE: A future release will allow customization of these "holidays" using either a YAML or initializer file.

##### is_a_holiday?

```rb
# Test that today is a holiday
Date.today.is_a_holiday?
 => true

# Test that today is not a holiday
Date.today.is_not_a_holiday?
 => false
```

This method currently only checks for the previously mentioned holidays.

You can also test the following specific holidays using the format `is_[holiday_name]_day?` and `is_not_[holiday_name]_day?` respectively.

```rb
# Test for labor day
Date.today.is_labor_day?
 => false

Date.today.is_not_labor_day?
 => true
```

### Additional Helpers

```rb
# next_business_day
# Returns the next valid business day accounting for weekends and/or holidays.
Date.today.next_business_day
 => #<Date ...> 
	
# previous_business_day
# Returns the previous valid business day account for weekends and/or holidays.
Date.today.previous_business_day
 => #<Date ...>
	
# memorial_day_this_year
# Returns the date memorial day falls on for the year identified by the date instance
Date.today.memorial_day_this_year
 => #<Date ...>
	
# labor_day_this_year
# Returns the date labor day falls on for the year identified by the date instance
Date.today.labor_day_this_year
 => #<Date ...>
	
# thanksgiving_day_this_year
# Returns the date thanksgiving falls on for the year identified by the date instance
Date.today.thanksgiving_day_this_year
 => #<Date ...>
```

## Bug Reports

If you run into any issues feel free to create an issue on GitHub.  The more information you can provide about the issue and your environment the better.  We'll do the best we can to resolve issues quickly.

## License

MIT License.  Copyright &copy; 2012 Digital Opera, LLC.  [www.digitalopera.com](http://www.digitalopera.com/ "Digital Opera, LLC")