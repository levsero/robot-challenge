require_relative 'src/board'

VALID_COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT)

def accept_inputs(filepath = nil)
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

accept_inputs('./commands.txt')