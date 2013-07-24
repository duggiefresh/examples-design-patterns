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

class Hamburger < Food
  def type
    'hamburgers'
  end
end

class Veggie < Food
  def type
    'veggie patties'
  end
end
