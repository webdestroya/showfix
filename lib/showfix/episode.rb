require 'showfix'

module Showfix
  class Episode

    # Video files, and some subtitles
    VALID_EXTENSIONS = %w(avi mkv mp4 mpg mpeg mov m4v srt)

    attr_accessor :season, :series, :episode, :title
    attr_reader :filename, :options, :extension, :file_no_ext

    def initialize(filename, options={})

      raise ArgumentError, 'no filename' unless filename

      @filename = filename
      @options = {
        season: nil,
        series: nil
        }.merge(options)

      @cleaner = Cleaner.new(@options)
      @parser = Parser.new(@options)

      @season ||= options[:season] # if they passed in a default season
      @series ||= options[:series]

      @file_no_ext = @filename.chomp(File.extname(@filename))
      @extension = File.extname(@filename).gsub(/\./, '').downcase

      self.update_episode_info
    end

    def skip?
      !acceptable_file? || !has_episode_info?
    end

    def has_episode_info?
      !@season.nil? && !@episode.nil? && @season.is_a?(Fixnum) && @episode.is_a?(Fixnum)
    end

    # Determines if this is a file we should work with
    def acceptable_file?
      VALID_EXTENSIONS.include?(self.extension)
    end

    # Parse season/episode info inputted by the user from the commandline
    def update_season_episode(input)
      # 1.1 => S1, E1
      # 1.1-2 => S1, E1 & E2
      # 1 => E1 (expect season to be from command line)
    end

    def to_formatted_s

      f_series = ""
      if @series && @series.strip.size > 0
        f_series = "#{@series.strip}."
      end

      f_title = ""
      if @title && @title.strip.size > 0
        f_title = ".#{@title.strip}"
      end

      "%sS%.2dE%.2d%s.%s" % [f_series, @season, @episode, f_title, @extension]
    end

    # Extract info from the filename, and update fields as necessary
    def update_episode_info
      info = @parser.parse(@file_no_ext)

      if info
        keys = info.names
        @series ||= @cleaner.clean(info[:series]) if keys.include?('series')
        @season ||= info[:season].to_i if keys.include?('season')
        @episode ||= info[:episode].to_i if keys.include?('episode')
        @title ||= @cleaner.clean(info[:title]) if keys.include?('title')
      end
    end
  end
end