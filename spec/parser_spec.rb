require 'spec_helper.rb'

describe Showfix::Parser do
  let(:parser) { Showfix::Parser.new }

  describe '#parse' do

    it 'matches season and episode' do
      [
        "The Adventures of Brisco County Jr - 1x03 - No Man's Land (DVDRip)",
        "1x03 Redux-1",
        "Friends.s01.e03.1994.BDRip.1080p.Ukr.Eng.AC3.Hurtom.TNU.Tenax555",
        "ER.S01E03.Going.Home.720p.WEB-DL.AAC.2.0.h.264-TjHD",
        "1966-09-22 - TOS S01 E03 - Mudds Women",
        "Dexter.S01E03.2006.Bluray.1080p.DTS.x264.dxva-FraMeSToR",
        "Doctor.Who.2005.S01E03.The.Unquiet.Dead",
        "Columbo.S01E03.1971.Death.Lends.a.Hand.720p.BluRay",
        "Law.&.Order 1x03 The Reapers Helper",
        "Law & Order - 1x03 - Reapers Helper [PDTV-drngr]",
        "Law & Order - s01e03 - Refuge 2",
        "LawandOrder.CI.2001.1x03.DVDRip.MP3-MrD",
        "Law.and.Order.LA.S01E03.HDTV.XviD-LOL",
        "law.and.order.svu.103.dvdrip",
        "law.and.order.svu.103-caph",
        "The Universe S01E03 The End of the Earth.1080p.BluRay.x264-CtrlHD",
        "Stargate SG-1 [1x03] Emancipation",
        "The.Office.US.S01.E03.Title.720p.WEB-DL",
        "S01E03",
        "103",
        "1x03",
        "0103",
      ].each do |file|
        match = parser.parse(file)
        expect(match).to_not be_nil

        expect(match[:season]).to match(/^0?1$/)
        expect(match[:episode]).to match(/^0?3$/)
      end
    end
  
    it 'matches series name'

    it 'matches title'

    it 'matches series and title'

    it 'matches all info'



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

  end
end