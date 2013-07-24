class Grill
  attr_accessor :food

  def initialize food
    @food = food
  end

  def fired_up?
    true
  end

  def grill
    "Grilling the #{food.type || food}!"
  end

  def grill_proc
    "Grilling the #{food}!"
  end
end

CUSTOMPATTY = lambda { |type| "#{type}" }
