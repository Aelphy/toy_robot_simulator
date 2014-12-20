module ToyRobotSimulator
  class Runner
    PLACE_REGEXP = /place (\d),(\d),(\w*)/
    include Ascii

    def initialize
      @robot = Robot.new(0, 0)
    end

    def run
      puts 'Input the command'

      look_for_initial_command

      while true do
        command = gets.chomp.downcase

        case command
          when 'move'
            @robot.move
          when 'left'
            @robot.left
          when 'right'
            @robot.right
          when 'report'
            puts green("X: #{@robot.position[:x]}, Y: #{@robot.position[:y]}, Facing: #{@robot.facing.upcase}")
          when PLACE_REGEXP
            x, y, f = command.scan(PLACE_REGEXP).first

            x = x.to_i
            y = y.to_i

            if valid?(x, y, f)
              @robot.place(x, y, f)
            else
              puts red('Wrong command attributes')
            end
          when 'exit'
            break
          else
            puts red('The command is invalid')
        end
      end
    end

    private

    def look_for_initial_command
      while true do
        command = gets.chomp.downcase

        if command =~ PLACE_REGEXP
          x, y, f = command.scan(PLACE_REGEXP).first

          x = x.to_i
          y = y.to_i

          if valid?(x, y, f)
            @robot.place(x, y, f)
          else
            puts red('Wrong command attributes')
          end

          break
        elsif command == 'exit'
          break
        else
          puts red('The first valid command is PLACE X,Y,F')
        end
      end
    end

    # Internal: check if the coordinates and facing valid
    #
    # Returns Boolean
    def valid?(x, y, f)
      Robot::ORIENTATIONS.include?(f) && (x >= 0 && x < 5 && y >= 0 && y < 5)
    end
  end # class Runner
end # module ToyRobotSimulator
