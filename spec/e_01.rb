require_relative 'spec_helper'
require 'pry'
require_relative'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @item = Item.new("rock",10)
  end

  describe "#heal!" do
    it "should raise error when heal! on a robot with zero health" do
      @robot.health = 0
      # allow(@robot).to receive(:health).and_return(0)

      expect{@robot.heal!(10)}.to raise_error(StandardError)
    end
  end

  describe "#atack!" do
    it "should raise an error when attacking a item" do
      expect{@robot.attack!(@item)}.to raise_error(StandardError)
    end
  end
end


