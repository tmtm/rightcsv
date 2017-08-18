# RightCSV

The CSV library that returns empty string instead of nil.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rightcsv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rightcsv

## Usage

```ruby
require 'rightcsv'

CSV.parse('a,,"","1,2"')       #=> [["a", nil, "", "1,2"]]
RightCSV.parse('a,,"","1,2"')  #=> [["a", "", "", "1,2"]]

CSV.generate_line(['a', nil, '', '1,2'])       #=> "a,,\"\",\"1,2\"\n"
RightCSV.generate_line(['a', nil, '', '1,2'])  #=> "a,,,\"1,2\"\n"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/tmtm/rightcsv>.
