# rubocop:disable Metrics/MethodLength
require "commander"
require "cryptex/options"
require "fastlane_core"

HighLine.track_eof = false

module Cryptex
  class CommandsGenerator
    include Commander::Methods

    FastlaneCore::CommanderGenerator.new.generate(Cryptex::Options.available_options)

    def self.start
      FastlaneCore::UpdateChecker.start_looking_for_update("cryptex")
      new.run
    ensure
      FastlaneCore::UpdateChecker.show_update_status("cryptex", Cryptex::VERSION)
    end

    def convert_options(options)
      o = options.__hash__.dup
      o.delete(:verbose)
      o
    end

    
    def run
      program :version, Cryptex::VERSION
      program :description, Cryptex::DESCRIPTION
      program :help, "Author", "<helmut@januschka.com>"
      program :help, "Website", "https://github.com/hjanuschka"
      program :help, "GitHub", "https://github.com/hjanuschka/cryptex"
      program :help_formatter, :compact

      global_option("--verbose") { $verbose = true }

      command :init do |c|
        c.syntax = "cryptex init"
        c.description = "Creates a new Cryptex Repo"
        c.action do |args, options|
          config = FastlaneCore::Configuration.create(Cryptex::Options.available_options, convert_options(options))
          #Pilot::BuildManager.new.upload(config)
          puts "AAAA"
        end
      end

      default_command :help

      run!
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize