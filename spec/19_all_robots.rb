require_relative"spec_helper"

describe Robot do
  
  describe "#all" do
    
    it "should return all robots created" do
      robot1 = Robot.new
      robot2 = Robot.new
      robot3 = Robot.new
      expect(Robot.all).to include(robot1, robot2, robot3)
    end

    it 'should add new robot to the all list' do
      expect{ Robot.new }.to change{ Robot.all.size }.by(1)
    end

  end

  describe "#in_position" do
    
    before :each do
      @robot1 = Robot.new
      @robot2 = Robot.new
      @robot3 = Robot.new
    end

    it "should return the position of all robots created" do
      @robot1.position = [1,3]
      @robot2.position = [2,5]
      @robot3.position = [5,3]
      expect(Robot.in_position).to include(@robot1.position, @robot2.position, @robot3.position)  
    end

  end

end