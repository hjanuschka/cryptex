require 'fastlane_core'
require 'credentials_manager'

module Cryptex
  class Options
    def self.available_options
      [
        FastlaneCore::ConfigItem.new(key: :repo_url,
                                     env_name: "CRYPTEX_REPO",
                                     description: "URL to the git repo containing all the files",
                                     optional: false,
                                     short_option: "-r"),
        FastlaneCore::ConfigItem.new(key: :source,
                                     env_name: "CRYPTEX_SOURCE_FILE",
                                     description: "Source File/Folder",
                                     optional: true,
                                     short_option: "-s"),
        FastlaneCore::ConfigItem.new(key: :source,
                                     env_name: "CRYPTEX_DESTINATION_FILE",
                                     description: "Destionation File/Folder",
                                     optional: true,
                                     short_option: "-d"),
       FastlaneCore::ConfigItem.new(key: :force,
                                     short_option: "-f",
                                     description: "Skip the HTML file verification",
                                     is_string: false,
                                     default_value: false),
      ]
    end
  end
end