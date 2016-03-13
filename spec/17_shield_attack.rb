require_relative'spec_helper'
require'pry'

describe Robot do

  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
  end

  describe "#attack" do

    it "robots shield should be drained before health if shield > 0" do
      @robot1.position = [1,1]
      @robot2.position = [1,2]
      @robot1.attack(@robot2)
      expect(@robot2.shield).to eq(45)
    end

    it "robots health should be damaged if shield < 0" do
      @robot1.position = [1,1]
      @robot2.position = [1,2]
      @robot1.equipped_weapon = PlasmaCannon.new
      @robot1.attack(@robot2)
      expect(@robot2.shield).to eq(0)
      expect(@robot2.health).to eq(95)
    end

  end
end