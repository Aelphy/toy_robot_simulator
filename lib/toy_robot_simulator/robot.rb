module ToyRobotSimulator
  class Robot
    ORIENTATIONS = %w(north east south west)
    DIRECTIONS = {
        north: {x: 0, y: 1},
        south: {x: 0, y: -1},
        west: {x: -1, y: 0},
        east: {x: 1, y: 0},
    }

    attr_accessor :facing, :position

    def initialize(x, y)
      @position = {x: x, y: y}
    end

    def place(x, y, orientation)
      @position[:x] = x
      @position[:y] = y

      @facing = orientation
    end

    def move
      x = @position[:x] + DIRECTIONS[@facing.to_sym][:x]
      y = @position[:y] + DIRECTIONS[@facing.to_sym][:y]

      if valid?(x, y)
        @position[:x] = x
        @position[:y] = y
      end
    end

    def left
      index = ORIENTATIONS.index(@facing)

      if index == 0
        left_index = ORIENTATIONS.size - 1
      else
        left_index = index - 1
      end

      @facing = ORIENTATIONS[left_index]
    end

    def right
      index = ORIENTATIONS.index(@facing)

      if index == ORIENTATIONS.size - 1
        right_index = 0
      else
        right_index = index + 1
      end

      @facing = ORIENTATIONS[right_index]
    end

    private

    def valid?(x, y)
      x >= 0 && x < 5 && y >= 0 && y < 5
    end
  end # class Robot
end # module ToyRobotSimulator
