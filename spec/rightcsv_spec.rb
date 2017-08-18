require "spec_helper"

RSpec.describe RightCSV do
  describe '.parse' do
    it 'do not return nil' do
      expect(RightCSV.parse('a,,"","1,2"')).to eq [['a', '', '', '1,2']]
    end
  end

  describe '.generage' do
    it 'do not return "" for nil' do
      expect(RightCSV.generate_line(['a', nil, '', '1,2'])).to eq "a,,,\"1,2\"\n"
    end
  end
end
