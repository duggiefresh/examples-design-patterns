class Grill
  attr_accessor :food

  def initialize food
    @food = food
  end

  def fired_up?
    true
  end

  def grill
    "Grilling the #{food.type}!"
  end

  def grill_proc
    "Grilling the #{food}!"
  end
end

class Food
  def type
    raise NotImplementedError, 'Ask the subclass'
  end
end

class HotDog < Food
  def type
    'hotdog'
  end
end

CUSTOMPATTY = lambda { |type| "#{type}" }
