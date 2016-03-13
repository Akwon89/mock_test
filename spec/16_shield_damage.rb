require_relative'spec_helper'
require'pry'

describe Robot do

  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
  end

  describe "#wound" do
    it "robots shield should be drained before health if shield > 0" do
      @robot1.wound(5)
      expect(@robot1.shield).to eq(45)
    end

    it "if robots shield drained, it should damage the health" do
      @robot2.wound(80)
      expect(@robot2.shield).to eq(0)
      expect(@robot2.health).to eq(70)
    end

    it "if robot shield is zero, it should attak health" do
      @robot1.shield = 0
      @robot1.wound(20)
      expect(@robot1.health).to eq(80)
    end

  end

end