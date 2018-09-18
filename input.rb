require_relative 'src/board'

class InputCommands
  VALID_COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT)

  def self.process_files(filepath = nil)
    board = Board.new

    File.open(filepath, "r") do |f|
      f.each_line do |line|
        command = line.chomp

        name, command = command.split(':')
        command, args = command.split(' ')
        next unless VALID_COMMANDS.include?(command)
        output = board.process_command(name, command, args&.split(','))
        puts output if command == 'REPORT'
      end
    end
  end
end

puts "\nexample 1"
InputCommands.process_files('./examples/commands1.txt')
puts "\nexample 2"
InputCommands.process_files('./examples/commands2.txt')
puts "\nexample 3"
InputCommands.process_files('./examples/commands3.txt')
puts "\nexample 4"
InputCommands.process_files('./examples/commands4.txt')
