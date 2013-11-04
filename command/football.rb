# Football example

class FootballPosition
  attr_reader :action

  def initialize(action)
    @action = action
  end

  def name
    self.class
  end

end

class CompositeCommand < FootballPosition
  attr_accessor :commands

  def initialize
    @commands = []
  end

  def add_command(*args)
    args.each { |arg| commands << arg }
  end

  def execute
    commands.each { |command| command.execute }
  end
end

class Quarterback < FootballPosition
  attr_reader :path, :play
  def initialize(path, play)
    super 'Hut! Hut! Red 19! Red 19! Hut! Hike!'
    @path = path
    @play = play
  end

  def execute
    file = File.open path, 'w'
    file.write "#{name}: #{play}\n"
    file.close
  end
end

class Receiver < FootballPosition
  attr_reader :path, :play
  def initialize(path, play)
    super 'Run, run, run!!!'
    @path = path
    @play = play
  end

  def execute
    file = File.open path, 'a'
    file.write "#{name}: #{play}\n"
    file.close
  end
end

class TeamOwner < FootballPosition
  attr_reader :path, :target
  def initialize(path, target)
    super "We are moving the team from #{pretty_path path} to #{pretty_path target}!"
    @path = path
    @target = target
  end

  def execute
    FileUtils.mv path, target
    file = File.open target, 'a'
    file.write "#{name}: I moved the team from #{pretty_path path} to #{pretty_path target}!"
    file.close
  end

  def pretty_path(pathname)
    (pathname.chomp(File.extname(pathname))).capitalize
  end
end
