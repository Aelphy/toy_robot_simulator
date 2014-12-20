describe ToyRobotSimulator::Runner do
  include ToyRobotSimulator::Ascii

  describe '#run' do
    after { ToyRobotSimulator::Runner.new.run }

    context 'when the initial command was not yet inputed' do
      let(:robot) { double('Robot') }

      before { allow(ToyRobotSimulator::Robot).to receive(:new).with(0, 0).and_return robot }

      context 'when the command is PLACE' do
        context 'when the command is valid' do
          before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 4,4,SOUTH', 'EXIT') }

          it do
            expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with('Input the command')
            expect(robot).to receive(:place).with(4, 4, 'south')
          end
        end

        context 'when the command is not valid' do
          before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 5,5,down', 'EXIT') }

          it do
            expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with('Input the command')
            expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with(red('Wrong command attributes'))
          end
        end
      end

      context 'when the command is not PLACE' do
        before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('MOVE', 'EXIT') }

        it do
          expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with('Input the command')
          expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with(red('The first valid command is PLACE X,Y,F'))
        end
      end
    end

    context 'when the initial command was inputed' do
      context 'when the command is REPORT' do
        before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 4,4,north', 'REPORT', 'EXIT') }

        it do
          expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with('Input the command')
          expect_any_instance_of(ToyRobotSimulator::Runner).to receive(:puts).with(green('X: 4, Y: 4, Facing: NORTH'))
        end
      end

      context 'when the command is LEFT' do
        before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 4,4,north', 'LEFT', 'EXIT') }

        it { expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:left) }
      end

      context 'when the command is RIGHT' do
        before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 4,4,NORTH', 'RIGHT', 'EXIT') }

        it { expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:right) }
      end

      context 'when the command is MOVE' do
        before { allow_any_instance_of(ToyRobotSimulator::Runner).to receive(:gets).and_return('PLACE 2,2,NORTH', 'MOVE', 'EXIT') }

        it { expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:move) }
      end
    end
  end
end
