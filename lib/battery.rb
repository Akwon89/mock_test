
class Battery < Item

  def initialize
    super("Battery", 25)
  end

  def use(robot)
    robot.charge(10)
  end

end