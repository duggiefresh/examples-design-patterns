require 'minitest/autorun'

class StringInstrument
  def number_of_strings
    "I am a #{name}. I contain #{number} strings."
  end

  private

  def material
    'We are usually made from wood.'
  end

  def number
    raise NotImplementedError
  end

  def name
    raise NotImplementedError
  end
end

class Guitar < StringInstrument
  private

  def name
    'guitar'
  end

  def number
    'six'
  end
end

class Violin < StringInstrument
  private

  def name
    'violin'
  end

  def number
    'four'
  end
end

describe Guitar do
  it 'should have six strings' do
    Guitar.new.number_of_strings.must_equal "I am a guitar. I contain six strings."
  end
end

describe Violin do
  it 'should have four strings' do
    Violin.new.number_of_strings.must_equal "I am a violin. I contain four strings."
  end
end

puts Violin.new.number_of_strings
