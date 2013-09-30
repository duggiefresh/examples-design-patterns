class CoffeeRoutine
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def time
    0.0
  end
end

class GrindCoffee < CoffeeRoutine
  def initialize
    super 'Grinding some coffee!'
  end

  def time
    0.5
  end
end

class BoilWater < CoffeeRoutine
  def initialize
    super 'Boiling some water!'
  end

  def time
    4.0
  end
end

class AddCoffee < CoffeeRoutine
  def initialize
    super 'Adding in the coffee!'
  end

  def time
    1.0
  end
end

class CompositeTasks < CoffeeRoutine
  attr_reader :tasks

  def initialize(name)
    @tasks = []
  end

  def add_sub_task(task)
    tasks << task
  end

  def remove_sub_task(task)
    tasks.delete(task)
  end

  def time_required
    total_time = 0.0
    tasks.each { |task| total_time += task.time }
    total_time
  end
end

class FrenchPress < CompositeTasks
  def initialize
    super 'Using the FrenchPress to make coffee!!!'
    add_sub_task GrindCoffee.new
    add_sub_task BoilWater.new
    add_sub_task AddCoffee.new
    # ... Omitted actual steps to make coffee from a French press ...
    # ... Imagine PressPlunger class has been defined already ...
    #add_sub_task PressPlunger.new
  end
end

class DripMaker < CompositeTasks
  def initialize
    super 'Using the DripMaker to make coffee!!!'
    add_sub_task GrindCoffee.new
    add_sub_task BoilWater
    add_sub_task AddCoffee.new
    # ... Imagine PressStartButton class has been defined already ...
    add_sub_task PressStartButton.new
  end
end
