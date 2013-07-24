class Grill
  attr_accessor :food

  def initialize food
    @food = food
  end

  def fired_up?
    true
  end

  def grill
    "Grilling the #{print_food}!"
  end

  private

  def print_food
    food_is_string? ? food : food.type
  end

  def food_is_string?
    food.is_a? String
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
