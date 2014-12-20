describe ToyRobotSimulator::Robot do
  let(:robot) { ToyRobotSimulator::Robot.new(0, 0) }

  before { robot.place(1, 1, 'north') }

  describe '#place' do
    it { expect(robot.position).to eq({x: 1, y: 1}) }
    it { expect(robot.facing).to eq('north') }
  end

  describe '#move' do
    context 'when new coordinates are valid' do
      before { robot.move }

      it { expect(robot.position).to eq({x: 1, y: 2}) }
    end

    context 'when new coordinates are not valid' do
      before do
        robot.place(4, 4, 'north')
        robot.move
      end

      it { expect(robot.position).to eq({x: 4, y: 4}) }
    end
  end

  describe '#left' do
    before { robot.left }

    it { expect(robot.facing).to eq('west') }
  end

  describe '#right' do
    before { robot.right }

    it { expect(robot.facing).to eq('east') }
  end
end
