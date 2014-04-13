require 'spec_helper.rb'


describe Showfix::Episode do

  it "#acceptable_file?" do
    %w(avi mkv mp4 mpg mpeg mov m4v srt).each do |ext|
      expect(Showfix::Episode.new("something.#{ext}").acceptable_file?).to be(true)
    end
  end
  
  # Law.and.Order.S20E21-E22.HDTV.XviD-NoTV.avi
  # Stargate SG-1 [8x01-02] New Order Part 1 and Part 2.avi
  # Stargate SG-1 [7x21-22] Lost City Part 1 and Part 2.avi

  # law.and.order.1702.hdtv-lol.avi
  # law.and.order.svu.901-caph.avi
  # law.and.order.svu.906-caph.[VTV].avi
  # law.and.order.svu.0910-yestv.avi
  # law.and.order.svu.813.Loophole.avi
  # 615.Hooked.avi
  # s06e01.mkv

  it 'season and episode parsing' do
    [
      "The Adventures of Brisco County Jr - 1x03 - No Man's Land (DVDRip).avi",
      "1x03 Redux-1.mkv",
      "Friends.s01.e03.1994.BDRip.1080p.Ukr.Eng.AC3.Hurtom.TNU.Tenax555.mkv",
      "ER.S01E03.Going.Home.720p.WEB-DL.AAC.2.0.h.264-TjHD.mkv",
      "1966-09-22 - TOS S01 E03 - Mudds Women.avi",
      "Dexter.S01E03.2006.Bluray.1080p.DTS.x264.dxva-FraMeSToR.mkv",
      "Doctor.Who.2005.S01E03.The.Unquiet.Dead.mkv",
      "Columbo.S01E03.1971.Death.Lends.a.Hand.720p.BluRay.mkv",
      "Law.&.Order 1x03 The Reapers Helper.avi",
      "Law & Order - 1x03 - Reapers Helper [PDTV-drngr].avi",
      "Law & Order - s01e03 - Refuge 2.avi",
      "LawandOrder.CI.2001.1x03.DVDRip.MP3-MrD.avi",
      "Law.and.Order.LA.S01E03.HDTV.XviD-LOL.avi",
      "law.and.order.svu.103.dvdrip.avi",
      "law.and.order.svu.103-caph.avi",
      "The Universe S01E03 The End of the Earth.1080p.BluRay.x264-CtrlHD.mkv",
      "Stargate SG-1 [1x03] Emancipation.avi",
      "The.Office.US.S01.E03.Title.720p.WEB-DL.mkv",
      "S01E03.mkv",
      "103.mkv",
      "1x03.mkv",
      "0103.mkv",
      ].each do |file|
      ep = Showfix::Episode.new(file)
      ep.update_episode_info
      expect(ep.to_formatted_s).to match(/S01E03/)
    end
  end

end