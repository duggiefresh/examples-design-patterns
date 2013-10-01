class CoffeeRoutine
  attr_reader :task

  def initialize(task)
    @task = task
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
  attr_reader :task, :steps

  def initialize(task)
    @task = task
    @steps = []
  end

  def add_step(step)
    steps << step
  end

  def remove_step(task)
    steps.delete step
  end

  def time_required
    total_time = 0.0
    steps.each { |step| total_time += step.time }
    total_time
  end
end

class FrenchPress < CompositeTasks
  def initialize
    super 'Using the FrenchPress to make coffee!!!'
    add_step GrindCoffee.new
    add_step BoilWater.new
    add_step AddCoffee.new
    # ... Omitted actual steps to make coffee from a French press ...
    # ... Imagine PressPlunger class has been defined already ...
    #add_sub_task PressPlunger.new
  end
end

class DripMaker < CompositeTasks
  def initialize
    super 'Using the DripMaker to make coffee!!!'
    add_step GrindCoffee.new
    add_step BoilWater
    add_step AddCoffee.new
    # ... Imagine PressStartButton class has been defined already ...
    add_step PressStartButton.new
  end
end
