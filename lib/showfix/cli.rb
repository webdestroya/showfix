require 'thor'
require 'showfix'

module Showfix
  class CLI < Thor
    include Thor::Actions

    desc "rename", "Rename TV show files in a directory"
    method_option "directory", type: :string, banner: 'PATH', aliases: "-d",
      default: ".", 
      desc: "Specify the directory to work in. If not specified, use the current directory."
    method_option "season", type: :numeric, aliases: "-s",
      banner: '1', desc: "The season/series number"
    method_option "pretend", type: :boolean, lazy_default: true, default: false,
      aliases: "-p", desc: "Do not rename files, only show outcome"
    method_option 'strip-year', type: :boolean, lazy_default: true,  default: false,
      desc: 'Strip years from file names', aliases: '-y'
    method_option 'clean', type: :boolean, lazy_default: true, default: true,
      desc: "Strip encoding and resolution flags from filenames", aliases: '-c'
    def rename

      path = File.absolute_path(options['directory'])

      if options['directory'] != "."
        say "Scanning directory #{path}:"
        say ""
      end

      episode_opts = {
        season: options['season'],
        year: options['strip-year'],
        flags: options['clean']
      }

      Dir["#{path}/*"].each do |file|
        basename = File.basename(file)
        episode = Showfix::Episode.new(basename, episode_opts)

        if episode.acceptable_file?
          say "#{basename} => "

          # unless episode.has_episode_info?
          #   input = ask "Enter the Season.Episode (1.1): "
          #   episode.update_season_episode(input)
          # end

          # If they fixed it
          if episode.has_episode_info?
            say "#{episode.to_formatted_s}"

            unless options['pretend']
              rename_file(file, episode.to_formatted_s)
            end

          else
            say "SKIPPED"
          end

        end
      end
    end

    private

    def rename_file(source_path, dest_file)
      raise IOError, 'source file not found' unless File.file?(source_path)

      dest_path = File.join(File.dirname(source_path), dest_file)

      raise IOError, 'destination already exists' if File.file?(dest_path)

      begin
        File.rename(source_path, dest_path)
      rescue SystemCallError
        puts "Unable to rename file #{File.basename(source_path)}"
      end
    end

  end
end