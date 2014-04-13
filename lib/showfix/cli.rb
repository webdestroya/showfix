require 'thor'
require 'showfix'

module Showfix
  class CLI < Thor
    include Thor::Actions

    desc "rename", "Rename TV show files in a directory"
    method_option "season", type: :string, banner: "The season/series number"
    method_option "dryrun", type: :boolean, default: false, banner: "Do not rename files, only show outcome"
    def rename
    end

  end
end