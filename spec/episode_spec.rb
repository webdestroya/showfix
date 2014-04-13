require 'spec_helper.rb'


describe Showfix::Episode do

  describe '#skip?' do
    it { expect(Showfix::Episode.new("Something.avi").skip?).to be(true) }
    it { expect(Showfix::Episode.new("Something.txt").skip?).to be(true) }
    it { expect(Showfix::Episode.new("S01E01.txt").skip?).to be(true) }

    it { expect(Showfix::Episode.new("S01E01.avi").skip?).to be(false) }
  end

  describe "#acceptable_file?" do
    it 'allows correct filetypes' do
      %w(avi mkv mp4 mpg mpeg mov m4v srt).each do |ext|
        expect(Showfix::Episode.new("something.#{ext}").acceptable_file?).to be(true)
      end
    end

    it 'blocks incorrect filetypes' do
      %w(nfo sfx rar txt url).each do |ext|
        expect(Showfix::Episode.new("something.#{ext}").acceptable_file?).to be(false)
      end
    end
  end

  describe '#has_episode_info?' do
    let(:valid) { Showfix::Episode.new("Series.S01E01.Title.mkv") }
    let(:invalid) { Showfix::Episode.new("Series.Title.mkv") }
    it { expect(valid.has_episode_info?).to be(true) }
    it { expect(invalid.has_episode_info?).to be(false) }
  end
  

  describe '#to_formatted_s' do
    
  end

  it '#rename'

end