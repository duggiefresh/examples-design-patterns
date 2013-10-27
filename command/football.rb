# Football example

class Player
  attr_reader :action, :source, :perform

  def initialize(action)
    @action = action
  end

  def execute
    # Find me in the child classes
  end
end

class CompositeCommand < Player
  attr_accessor :commands

  def initialize
    @commands = []
  end

  def add_command(command)
    commands << command
  end

  def execute
    commands.each { |command| command.execute }
  end

  def description
    description = ''
    commands.each { |command| description += command.description + "\n"}
    description
  end
end

class Quarterback < Player
  attr_reader :path, :play

  def initialize(path, play)
    super 'Hut! Hut! Red 19! Red 19! Hut! Hike!'
    @path = path
    @play = play
  end

  def execute
    file = File.open path, 'w'
    file.write "#{self}: #{play}\n"
    file.close
  end
end

class Receiver < Player
  attr_reader :source, :play

  def initialize(source, play)
    super 'Run, run, run!!!'
    @source = source
    @play = play
  end

  def execute
    file = File.open source, 'a'
    file.write "#{self}: #{play}\n"
    file.close
  end
end
