# toy_robot_simulator

Command line utility for toy robot simulation.

## Features

1. Online control
2. The robot is prevented from falling
3. Case insensitive commands
4. This tool is made with love :heart:

## Installation

Add this line to your application's `Gemfile`:

    gem 'toy_robot_simulator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toy_robot_simulator

## Usage

From root of your project

    $ toy_robot_simulator -h
    $ Toy robot simulation
    $ Usage: toy_robot_simulator [options]
    $   -v, --version                    Display the version
    $   -h, --help                       You are looking at it

When the program is launched

    $ PLACE 1,1,NORTH => Initial command to setup the coordinates and facing
    $ LEFT => Turn 90 degrees to the left
    $ RIGHT => Turn 90 degrees to the right
    $ REPORT => Output the coordinates and orientation of the robot
    $ MOVE => Move one unit to the direction of the facing
    $ EXIT => Exit from application

##Valid commands:

1. PLACE X,Y,F
2. MOVE
3. LEFT
4. RIGHT
5. REPORT
6. EXIT

## Contributing

1. Fork it ( https://github.com/aelphy/toy_robot_simulator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
