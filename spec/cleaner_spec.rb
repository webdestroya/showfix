require 'spec_helper.rb'

describe Showfix::Cleaner do

  let(:cleaner) { Showfix::Cleaner.new }

  describe '#clean' do
    it 'when'
  end

  describe '#unix_friendly' do

  end

  describe '#remove_flags' do

  end

  describe '#strip_year' do
    it { expect(cleaner.strip_year("Castle.2009")).to eq("Castle.") }
    it { expect(cleaner.strip_year("Castle.2009.Blah")).to eq("Castle.2009.Blah") }
  end

  describe '#trim' do
    it { expect(cleaner.trim(".Something.")).to eq("Something") }
    it { expect(cleaner.trim("..Something..")).to eq("Something") }
    it { expect(cleaner.trim("Something")).to eq("Something") }
    it { expect(cleaner.trim(" Something")).to eq("Something") }
    it { expect(cleaner.trim(" Something ")).to eq("Something") }
    it { expect(cleaner.trim("Something ")).to eq("Something") }
    it { expect(cleaner.trim(".Something ")).to eq("Something") }
  end
end