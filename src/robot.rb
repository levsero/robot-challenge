# frozen_string_literal: true

class Robot
  attr_reader :position

  DELTAS = {
    'NORTH' => [0, 1],
    'SOUTH' => [0, -1],
    'WEST' => [-1, 0],
    'EAST' => [1, 0]
  }.freeze
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(position, direction, board, name)
    @board = board
    @position = position
    @direction = direction
    @name = name
  end

  def self.build(position:, direction:, board:, name:)
    return false unless board.is_valid?(position)

    new(position, direction, board, name)
  end

  def turn_left
    old_idx = DIRECTIONS.index(@direction)
    new_idx = old_idx == 0 ? 3 : old_idx - 1
    @direction = DIRECTIONS[new_idx]
  end

  def turn_right
    old_idx = DIRECTIONS.index(@direction)
    new_idx = old_idx == 3 ? 0 : old_idx + 1
    @direction = DIRECTIONS[new_idx]
  end

  def move
    new_coords = next_pos
    return @position unless @board.is_valid?(new_coords)

    @position = new_coords
  end

  def report
    "#{@name}: #{@position.join(',')},#{@direction}"
  end

  private

  def next_pos
    x_coord = @position[0] + DELTAS[@direction][0]
    y_coord = @position[1] + DELTAS[@direction][1]
    [x_coord, y_coord]
  end
end
