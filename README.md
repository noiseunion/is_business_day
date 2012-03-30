## is_business_day

*is_business_day* extends the Date and Time objects in Ruby to include some simple helpers for determining if a specific date is a business day, or not.  It also includes helpers for getting the next or previous business days as well as testing for major holidays.

# Installation

Add it to your Gemfile

`gem "is_business_day"`

And then run `bundle install` to install it.

# Usage

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

Valid business days are currently Monday thru Friday.  A few major holidays are also currently recognized as not being valid business days.

- New Year's Day
- Memorial Day
- Fourth of July
- Labor Day
- Thanksgiving Day
- Christmas Eve
- Christmas Day

A future release will allow customization of these "holidays" using either a YAML or initializer file.

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

##### Other boolean checks

You can also test the following specific holidays:

- is_labor_day?
- is_not_labor_day?
- is_memorial_day?
- is_not_memorial_day?
- is_thanksgiving_day?
- is_not_thanksgiving_day?
- is_christmas_eve?
- is_not_christmas_eve?
- is_christmas_day?
- is_not_christmas_day?
- is_new_years_day?
- is_not_new_years_day?
- is_fourth_of_july?
- is_not_fourth_of_july?

*is_business_day* also introduces the following helper methods:

- next_business_day
- previous_business_day
- memorial_day_this_year
- labor_day_this_year
- thanksgiving_day_this_year

# Bug Reports

If you run into any issues feel free to create an issue on GitHub.  The more information you can provide about the issue and your environment the better.  We'll do the best we can to resolve issues quickly.

# License

MIT License.  Copyright &copy; 2012 Digital Opera, LLC.  [www.digitalopera.com](http://www.digitalopera.com/ "Digital Opera, LLC")