require_relative './robot'

class Board
  COMMAND_MAPPING = {
    'MOVE' => 'move',
    'LEFT' => 'turn_left',
    'RIGHT' => 'turn_right',
    'REPORT' => 'report'
  }.freeze

  def initialize(width: 6, length: 6)
    @width = width
    @length = length
    @robots = {}
  end

  def process_command(name, command, args)
    return place_robot(name, args) if command == 'PLACE'

    robot = @robots[name]
    unless robot
      puts "could not locate robot #{name}"
      return
    end
    robot.send(COMMAND_MAPPING[command])
  end

  def is_valid?(position)
    valid_x?(position[0]) && valid_y?(position[1]) && is_empty?(position)
  end

  private

  def place_robot(name, args)
    position = args.take(2).map(&:to_i)
    direction = args[-1]

    robot = Robot.build(position: position, direction: direction, board: self, name: name)
    return unless robot

    @robots[name] = robot
  end

  def valid_x?(x_coord)
    x_coord.between?(0, @width)
  end

  def valid_y?(y_coord)
    y_coord.between?(0, @length)
  end

  def is_empty?(coord)
    @robots.values.select { |robot| coord[0] == robot.position[0] && coord[1] == robot.position[1] }.empty?
  end
end
