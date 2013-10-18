class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    # Find me in the child classes
  end
end

class CompositeCommand < Command
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
    commands.each { |command| description += command.description + "\n" }
    description
  end
end

class CreateFile < Command
  def initialize(path, contents)
    super "Create file: #{path}"
    @path = path
    @contents = contents
  end

  def execute
    file = File.open @path, 'w'
    file.write @contents
    file.close
  end
end

class DeleteFile < Command
  def initialize(path)
    super "Delete file: #{path}"
    @path = path
  end

  def execute
    File.delete @path
  end
end

class CopyFile < Command
  def initialize(source, target)
    super "Copy file: #{source} to #{target}"
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy @source, @target
  end
end
