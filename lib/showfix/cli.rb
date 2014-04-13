require 'thor'
require 'showfix'

module Showfix
  class CLI < Thor
    include Thor::Actions

    desc "rename", "Rename TV show files in a directory"
    method_option "season", type: :numeric, 
      banner: '1', desc: "The season/series number", aliases: %w(-s) 
    method_option "pretend", type: :boolean, lazy_default: true, default: false,
      aliases: "-p", desc: "Do not rename files, only show outcome"
    method_option 'strip-year', type: :boolean, lazy_default: true,  default: false,
      desc: 'Strip years from file names', aliases: '-y'
    method_option 'clean', type: :boolean, lazy_default: true, default: true,
      desc: "Strip encoding and resolution flags from filenames", aliases: '-c'
    def rename
      say "TODO"
    end

  end
end