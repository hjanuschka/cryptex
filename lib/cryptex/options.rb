require 'fastlane_core'
require 'credentials_manager'

module Cryptex
  class Options
    def self.available_options
      [
        FastlaneCore::ConfigItem.new(key: :git_url,
                                     env_name: "MATCH_GIT_URL",
                                     description: "URL to the git repo containing all the certificates",
                                     optional: false,
                                     short_option: "-r"),
        
      ]
    end
  end
end