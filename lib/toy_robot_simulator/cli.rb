require 'optparse'

module ToyRobotSimulator
  class Cli
    def initialize(argv)
      @argv = argv
    end

    def run
      option_parser = create_option_parser
      option_parser.parse!(@argv)

      Runner.new.run

      exit
    rescue OptionParser::ParseError
      puts 'Error: wrong usage. See help.'
      puts option_parser.help
      
      exit
    end

    private

    # Internal: create and initialize option parser
    #
    # Returns OptionParser
    def create_option_parser
      OptionParser.new do |parser|
        parser.banner = "Toy Robot Simulation\nUsage: toy_robot_simulator [options]"
        parser.version = VERSION

        parser.on_tail('-v', '--version', 'Display the version') do
          puts parser.version
          exit
        end

        parser.on_tail('-h', '--help', 'You are looking at it') do
          puts parser.help
          exit
        end
      end
    end
  end  # class Cli
end # module ToyRobotSimulator
