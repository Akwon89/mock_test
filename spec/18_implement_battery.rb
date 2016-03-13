require_relative'spec_helper'

describe Battery do
  
  before :each do
    @battery = Battery.new
    @robot = Robot.new
  end

  it "should be an item" do
    expect(@battery).to be_an(Item)
  end

  it "should have the name Battery" do
    expect(@battery.name).to eq('Battery')
  end

  it "should weight 25" do
    expect(@battery.weight).to eq(25)
  end

  describe "#use"do

  it "should charge robot shield by 10" do
    @robot.wound(20)
    @battery.use(@robot)
    expect(@robot.shield).to eq(40)
    end
  end

end

describe Robot do

  before :each do
    @robot = Robot.new
    @battery = Battery.new
  end

  it "should automatically use battery if at or below 40 shield" do
    allow(@robot).to receive(:shield).and_return(40)
    expect(@battery).to receive(:use).and_call_original
    @robot.pick_up(@battery)
  end

  it "should not auto use battery if above 40 shield" do
    allow(@robot).to receive(:sheild).and_return(41)
    expect(@battery).not_to receive(:use)
    @robot.pick_up(@battery)
  end

  describe "#charge" do

    it "increases shield" do
      @robot.wound(20)
      @robot.charge(10)
      expect(@robot.shield).to eq(40)
    end

  end

end