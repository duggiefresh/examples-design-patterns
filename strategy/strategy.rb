#! /usr/bin/env ruby
require 'minitest/autorun'

class StringInstrument
  attr_accessor :type

  def initialize type
    @type = type
  end

  def size
    @type.size
  end
end

class Violin < StringInstrument
  def self.size
    'small size'
  end
end

class Guitar < StringInstrument
  def self.size
    'medium size'
  end
end

describe Violin do
  it 'should have a small size' do
    string = StringInstrument.new(Violin)
    string.size.must_equal 'small size'
  end
end

describe Guitar do
  it 'should have a medium size' do
    string = StringInstrument.new(Guitar)
    string.size.must_equal 'medium size'
  end
end

p string = StringInstrument.new(Violin)
p string.size

p string = StringInstrument.new(Guitar)
p string.size
