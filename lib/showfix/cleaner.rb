module Showfix
  class Cleaner

    # http://en.wikipedia.org/wiki/Pirated_movie_release_types

    AUDIO_FLAGS   = %w(DD51 AC3 Dubbed DD20 Synced AAC DTS MP3).freeze
    VIDEO_FLAGS   = %w(1080p 720p XviD x264 h264 HDTV euHD PDTV HD Divx5).freeze
    
    SOURCE_FLAGS  = %w(
      DVDRip HDTVRip HDRip SATRip BDRip iTunesHD WEBRiP BLURAYRiP BluRay 
      iTunesHDRip RiP WEB DL PublicHD CAMRip WP TC Telecine CAM TS PDVD
      Telesync PPV PPVRip SCR SCREENER DVDSCR DDC R5 HDDVD
    ).freeze
    
    AUTHOR_FLAGS  = %w(
      inspired AMBiTiOUS SiGHT RiP iNTERNAL CRoW c0nFuSed UTOPiA scum EXPiRED
      CRiSP ZZGtv ARCHiV Prim3time Nfo Repack SiMPTY DELiCiOUS UNDELiCiOUS
      fBi CiD RedSeven OiNK dxva FraMeSToR CtrlHD LOL drngr PARADOX RELOADED
      DIMENSION anoXmous YIFY KILLERS HiDt Z3R0K BiTT ViSiON KiNGDOM SPARKS
      MVGroup JIVE RKSTR ESiR
    ).freeze

    FLAGS = [AUDIO_FLAGS, VIDEO_FLAGS, SOURCE_FLAGS, AUTHOR_FLAGS].flatten.freeze

    def initialize(options={})
      @options = {
        flags: true,
        year: true
        }.merge(options)
    end
    
    # Perform some cleanup on the filename
    def clean(string)

      string = self.unix_friendly(string)

      if @options[:flags]
        string = self.remove_flags(string)
      end

      if @options[:year]
        string = self.strip_year(string)
      end

      # Clean trailing/leading periods
      string = self.trim(string)

      string
    end

    def trim(string)
      string.strip.gsub(/\A\.+|\.+\Z/, '')
    end

    # Make unix friendly
    def unix_friendly(string)
      string.gsub(/\s+-\s+/, '.')
        .gsub(/[- \(\)]+/, '.')
        .gsub(/'/,'')
        .gsub(/[\[\]]+/,'')
        .gsub(/&/,'.and.')
        .gsub(/\.{2,}/,'.')
    end

    def remove_flags(string)
      flags = FLAGS.join('|')
      
      string.gsub(/(\W(#{flags})){2,}/i, '')
        .gsub(/((#{flags})\W){2,}/i, '')
        .gsub(/^((#{flags})\W?){2,}$/i, '')

      string = string.gsub(/(\W(#{flags})){1,}$/i, '')
      string
    end

    def strip_year(string)
      string.gsub(/^(?:19|20)\d{2}\D/, '\1')
      string.gsub(/(?:19|20)\d{2}$/, '\1')
    end

  end
end