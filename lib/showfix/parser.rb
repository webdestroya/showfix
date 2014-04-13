module Showfix
  class Parser

    # matchData pre_match / post_match for getting data after the matched part
    PATTERNS = [
        # Show.Season.01.Episode.01.Title
        /^(?<series>.*)(?:\.)?Season(?:\.)?(?<season>\d+)(?:\.)?Episode(?<episode>\d+)(?:\.)?(?<title>.*)$/i,
        # Show.S01E01.Title ; Show.S01.E01.Title ; Show S01 E01 Title
        /^(?<series>.*)(?:\.|\s+)?S(?<season>\d+)(?:\.|\s+)?E(?<episode>\d+)(?:\.|\s+)?(?<title>.*)$/i,
        # 1x1; 12x12
        /^(?<series>.*)(?:\.)?(?<season>\d+)x(?<episode>\d+)(?:\.)?(?<title>.*)$/,
        # Show 01 - Title
        /^(?<series>.*)\s+(?<episode>\d{1,2})\s+-\s+(?<title>.+)$/,
        # [Show] 01 Episode
        /(?<series>.*)\s*(?<episode>\d{1,2})\s+(?<title>.+)$/,
        # 101; 1212
        /^(?<series>.*\D)(?<season>\d+)(?<episode>\d{2})(?<title>\W*.*)$/,

        # TERRIBLE ONES ------------------------------------------------

        # ^101$
        /^(?<season>\d+)(?<episode>\d{2})$/
        
    ].freeze

    def initialize(options={})
      @options = {}.merge(options)
    end
    
    # Parse a given string and look for matches
    def parse(string)

      matches = PATTERNS.map do |pattern|
        pattern.match(string)
      end.compact

      if matches.size > 0
        matches.first
      else
        nil
      end
    end
  end
end