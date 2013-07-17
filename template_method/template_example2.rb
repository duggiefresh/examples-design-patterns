# Blueprints for Wall

class Wall
  def dimensions
    "I am #{length}ft. long and #{width}ft. wide!"
  end

  def made_of
    "I am made from #{material}!"
  end

  private

  def material
    'brick'
  end

  def length
    30
  end

  def width
    20
  end
end

require 'minitest/autorun'

describe Wall do
  let(:wall) { Wall.new }

  it 'should state its dimensions' do
    wall.dimensions.must_equal 'I am 30ft. long and 20ft. wide!'
  end

  it 'should be made from brick' do
    wall.made_of.must_equal 'I am made from brick!'
  end
end
