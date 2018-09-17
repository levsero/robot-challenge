require_relative '../src/board'

describe Board do
  cases = [
    {
      case: 'moving',
      input: [
        ['ALICE', 'PLACE', %w[0 0 NORTH]],
        %w[ALICE MOVE],
        %w[ALICE REPORT]
      ],
      output: ['ALICE: 0,1,NORTH']
    },
    {
      case: 'turning',
      input: [
        ['BOB', 'PLACE', %w[0 0 NORTH]],
        %w[BOB LEFT],
        %w[BOB REPORT]
      ],
      output: ['BOB: 0,0,WEST']
    },

    {
      case: 'with two robots',
      input: [
        ['ALICE', 'PLACE', %w[1 2 EAST]],
        %w[ALICE MOVE],
        %w[ALICE MOVE],
        %w[ALICE LEFT],
        ['BOB', 'PLACE', %w[3 3 EAST]],
        %w[BOB MOVE],
        %w[ALICE MOVE],
        %w[ALICE REPORT],
        %w[BOB RIGHT],
        %w[BOB MOVE],
        %w[BOB REPORT]
      ],
      output: ['ALICE: 3,3,NORTH', 'BOB: 4,2,SOUTH']
    },
    {
      case: 'with second robot obstructing',
      input: [
        ['BOB', 'PLACE', %w[1 3 SOUTH]],
        ['ALICE', 'PLACE', %w[0 1 EAST]],
        %w[ALICE MOVE],
        %w[BOB MOVE],
        %w[BOB MOVE],
        %w[ALICE MOVE],
        %w[BOB MOVE],
        %w[BOB LEFT],
        %w[ALICE REPORT],
        %w[BOB REPORT]
      ],
      output: ['ALICE: 2,1,EAST', 'BOB: 1,1,EAST']
    }
  ]

  cases.each do |test_case|
    let(:board) { Board.new }
    it "case #{test_case[:case]}" do
      results = []
      test_case[:input].each do |command|
        response = board.process_command(command[0], command[1], command[2])
        results << response if command[1] == 'REPORT'
      end
      expect(test_case[:output]).to eq(results.compact)
    end
  end
end
