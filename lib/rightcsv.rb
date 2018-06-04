# This is a CSV library that returns an empty string instead of nil.
#
# @example
#   require 'rightcsv'
#   CSV.parse('a,,"","1,2"')       #=> [["a", nil, "", "1,2"]]
#   RightCSV.parse('a,,"","1,2"')  #=> [["a", "", "", "1,2"]]
#
#   CSV.generate_line(['a', nil, '', '1,2'])       #=> "a,,\"\",\"1,2\"\n"
#   RightCSV.generate_line(['a', nil, '', '1,2'])  #=> "a,,,\"1,2\"\n"

require 'csv'

class RightCSV < CSV
  def initialize(data, **options)
    super(data, options.merge(nil_value: ''))
  end

  def init_separators(*)
    super
    unless @force_quotes
      quote_orig = @quote
      @quote = lambda do |field|
        field.to_s.empty? ? '' : quote_orig.call(field)
      end
    end
  end
end

class Array
  def to_csv(options = Hash.new)
    RightCSV.generate_line(self, options)
  end
end

class String
  def parse_csv(options = Hash.new)
    RightCSV.parse_line(self, options)
  end
end
