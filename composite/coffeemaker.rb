class CoffeeMaker
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_required_time
    0.0
  end
end

class GrindCoffee
  def initialize
    super('Grinding some coffee!')
  end

  def get_required_time
    0.5
  end
end

class BoilWater
  def initialize
    super('Boiling some water!')
  end

  def get_required_time
    4.0
  end
end

class CompositeTask < MorningRoutine
  attr_reader :tasks

  def initialize(name)
    super(name)
    @tasks = []
  end

  def add_sub_task(task)
    tasks << task
  end

  def remove_sub_task(task)
    tasks.delete(task)
  end

  def time_required
    time = 0.0
    tasks.each { |task| time += task.time_required }
    time
  end
end

class FrenchPress < CompositeTask
  def initialize
    super('Making some coffee with the French press')
    add_sub_task(GrindCoffee.new)
    add_sub_task(BoilWater.new)
  end
end
