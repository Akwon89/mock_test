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
    if @equipped_weapon == nil
      enemy.wound(5)
    else
      @equipped_weapon.hit(enemy)
    end
  end
########################
  def attack!(enemy)
    raise StandardError.new("THATS NOT A ROBOT!") if enemy.is_a?(Item)
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
    @items << item if items_weight + item.weight <= 250
    @equipped_weapon = item if item.is_a?(Weapon)
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


