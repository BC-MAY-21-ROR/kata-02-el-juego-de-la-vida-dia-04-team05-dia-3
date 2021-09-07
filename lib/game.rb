# frozen_string_literal: true

# require './grid.rb'

class Game
  attr_accessor :grid

  def initialize
    @neighborhood = Neighborhood.new(@cells)
    @grid = Grid.new(3, 3, @neighborhood.cells)
    @grid.paint(@neighborhood.cells)
    @neighborhood.tick
    @grid.paint(@neighborhood.cells)
  end

  def initial_state; end
end
