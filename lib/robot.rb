class Robot

attr_reader :position, :items
attr_accessor :equipped_weapon, :health


  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    # @equipped_weapon = nil
  end
#first pass################
  # def wound(damage)
  #    @health -= damage
  # end
#second pass###############
def wound(damage)
     (@health - damage) > 0 ? @health -= damage : @health = 0
  end
#first pass#################
  # def heal(amount)
  #   @health += amount
  # end
#second pass
  def heal(amount)
    heal!(amount)
    (@health + amount) <= 100 ? @health += amount : @health = 100
  end
###########################
  def heal!(amount)
  #   #if robot health == 0
  #   #it cannot be revivied
  #   #raise exception
   raise StandardError.new("YOU CANNOT HEAL YOU ARE DEAD!") if @health <= 0
  end
##########################
  def attack(enemy)
    attack!(enemy)
    if grenade_range?(enemy)
      if equipped_weapon.is_a?(Grenade)
        equipped_weapon.hit(enemy)
        self.equipped_weapon = nil
      end
    elsif with_in_reach?(enemy)
      if equipped_weapon == nil
        enemy.wound(5)
      else
        equipped_weapon.hit(enemy)
      end
    end
  end
########################
  def attack!(enemy)
    raise StandardError.new("THATS NOT A ROBOT!") if enemy.is_a?(Item)
  end

  def with_in_reach?(enemy)
    #enemy position is +2 more in anydirection, then attak wont register
    #enemy [0]>=2 than robot
    #enemy [1]>=2 than robot
    x_coord = (@position[0] - enemy.position[0]).abs
    y_coord = (@position[1] - enemy.position[1]).abs
    (x_coord < 2) && (y_coord < 2)
  end

  def grenade_range?(enemy)
    x_coord = (@position[0] - enemy.position[0]).abs
    y_coord = (@position[1] - enemy.position[1]).abs
    (x_coord < 3) && (y_coord < 3)
  end
  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def items
    @items
  end
##########
  def pick_up(item)
    if item.is_a?(BoxOfBolts)
      if health <= 80
        item.feed(self)
      elsif items_weight + item.weight <= 250
        items << item 
      end
    elsif item.is_a?(Weapon)
      equipped_weapon = item
    elsif items_weight + item.weight <= 250
        items << item 
    end
  end
##########
  def items_weight
    weight = 0
    if @items == nil
      weight
    else
      @items.each do |item|
      weight += item.weight
      end
    end
    weight
    ##harder way
    #@items.inject(0) {|sum,item| sum += item.weight}
  end

end


