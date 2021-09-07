# frozen_string_literal: true

class Cell
  attr_reader :location, :random_life

  def initialize(location)
    @location = location
    @alive = true
  end

  def char
    @alive == true ? '*' : '.'
  end

  def random_life
    @alive = [true, false].sample
  end

  def alive?
    @alive == true
  end

  def dead?
    !alive?
  end

  def die
    @alive = false
  end

  def born
    @alive = true
  end

  def at?(location)
    @location == location
  end
end
