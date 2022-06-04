# HappyFriday

This gem is capable of obtaining and determining HappyFriday.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add HappyFriday

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install HappyFriday

## Usage

### HappyFriday decision
```rb
date = Date.new(2022, 5, 3)
HappyFriday.happy_friday?(date)
=> false

date = Date.new(2022, 5, 27)
HappyFriday.happy_friday?(date)
=> true
```

### Get the next HappyFriday
You can get a HappyFriday for that month.
```rb
date = Date.new(2022, 5)
HappyFriday.get_next_happy_friday(date)
=> Fri, 27 May 2022

# If the last Friday of the month is a holiday, the day before becomes HappyFriday.
date = Date.new(2022, 4)
HappyFriday.get_next_happy_friday(date)
=> Thu, 28 Apr 2022
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake ` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/HappyFriday. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/HappyFriday/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HappyFriday project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/HappyFriday/blob/master/CODE_OF_CONDUCT.md).
