require_relative"spec_helper"

describe Robot do

  describe '#scan' do
    
    before :each do
      @robot1 = Robot.new
      @robot2 = Robot.new
    end

    it "scan tiles beside to see if robots there" do
      @robot1.position = [1,1]
      @robot2.position = [1,2]
      expect(@robot1.scan).to include(@robot2)
    end


  end

end