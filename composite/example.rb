class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super 'Add dry ingredients'
  end

  def get_time_required
    1.0                # one minute to add sugar and flour
  end
end

class MixTask < Task
  def initialize
    super 'Mix that batter up!'
  end

  def get_time_required
    3.0                # Mix for three minutes
  end
end

class AddLiquidTask < Task
  def initialize
    super 'Add liquid'
  end

  def get_time_required
    2.0                # Add the liquids
  end
end

class CompositeTask < Task
  def initialize(name)
    super name
    @sub_task = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def remote_sub_task(task)
    @sub_tasks.delete task
  end

  def get_time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.get_time_required }
    time
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super 'Make batter'
    @sub_tasks = []
    add_sub_task AddDryIngredientsTask.new
    add_sub_task AddLiquidTask.new
    add_sub_task MixTask.new
  end
end
