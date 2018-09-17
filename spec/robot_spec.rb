require_relative '../src/robot'

describe Robot do
  let(:board) { double(:board, is_valid?: is_valid)}
  let(:is_valid) { true }
  let(:direction) { 'NORTH' }
  let(:robot) { Robot.new([2,2], direction, board, 'Bob') }

  describe '.build' do
    context 'with a valid position' do
      it 'successfully creates a new robot' do
        expect(Robot.build(position: [2,2], direction: 'NORTH', board: board, name: 'Bob')).to be
      end
    end

    context 'with an invalid position' do
      let(:is_valid) { false }
      it 'successfully creates a new robot' do
        expect(Robot.build(position: [2,2], direction: 'NORTH', board: board, name: 'Bob')).to be false
      end
    end
  end

  describe '#turn_left' do
    let(:robot) { Robot.new([2,2], 'NORTH', board, 'Bob') }
    it 'correctly changes the direction' do
      robot.turn_left
      expect(robot.instance_variable_get('@direction')).to eq('WEST')
      robot.turn_left
      expect(robot.instance_variable_get('@direction')).to eq('SOUTH')
      robot.turn_left
      expect(robot.instance_variable_get('@direction')).to eq('EAST')
      robot.turn_left
      expect(robot.instance_variable_get('@direction')).to eq('NORTH')
    end
  end

  describe '#turn_right' do
    it 'correctly changes direction' do
      robot.turn_right
      expect(robot.instance_variable_get('@direction')).to eq('EAST')
      robot.turn_right
      expect(robot.instance_variable_get('@direction')).to eq('SOUTH')
      robot.turn_right
      expect(robot.instance_variable_get('@direction')).to eq('WEST')
      robot.turn_right
      expect(robot.instance_variable_get('@direction')).to eq('NORTH')
    end
  end

  describe '#move' do
    context 'with a valid position' do
      context 'NORTH' do
        it 'moves in the correct direction' do
          expect(robot.move).to eq([2,3])
        end
      end
      context 'EAST' do
        let(:direction) { 'EAST' }
        it 'moves in the correct direction' do
          expect(robot.move).to eq([3,2])
        end
      end
      context 'WEST' do
        let(:direction) { 'WEST' }
        it 'moves in the correct direction' do
          expect(robot.move).to eq([1,2])
        end
      end
      context 'SOUTH' do
        let(:direction) { 'SOUTH' }
        it 'moves in the correct direction' do
          expect(robot.move).to eq([2,1])
        end
      end
    end

    context 'with an invalid position' do
      let(:is_valid) { false }
      it 'does not move' do
        expect(robot.move).to eq([2,2])
      end
    end
  end

  describe '#report' do
    it 'prints out the report' do
      expect(robot.report).to eq('Bob: 2,2,NORTH')
    end
  end
end
