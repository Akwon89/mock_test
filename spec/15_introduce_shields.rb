require_relative'spec_helper'

describe Robot do
  
  before :each do
    @robot = Robot.new
  end

  describe "#shield" do
    it "robots start with 50 shield" do
      expect(@robot.shield).to eq(50)
    end
  end

end