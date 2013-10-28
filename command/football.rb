# Football example

class Player
  attr_reader :action

  def initialize(action)
    @action = action
  end

  def execute
    file = File.open path, 'a'
    file.write "#{name}: #{play}\n"
    file.close
  end

  def name
    self.class
  end
end

class Coach < Player
  attr_accessor :commands

  def initialize
    @commands = []
  end

  def add_command(command)
    commands << command
  end

  def play_call
    commands.each { |command| command.execute }
  end
end

class Quarterback < Player
  def initialize(path, play)
    super 'Hut! Hut! Red 19! Red 19! Hut! Hike!'
    @path = path
    @play = play
  end
end

class Receiver < Player
  def initialize(path, play)
    super 'Run, run, run!!!'
    @path = path
    @play = play
  end
end
