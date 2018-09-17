require_relative 'src/board'

VALID_COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT)

def process_files(filepath = nil)
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

puts "\nexample 1"
process_files('./commands1.txt')
puts "\nexample 2"
process_files('./commands2.txt')
puts "\nexample 3"
process_files('./commands3.txt')
puts "\nexample 4"
process_files('./commands4.txt')
