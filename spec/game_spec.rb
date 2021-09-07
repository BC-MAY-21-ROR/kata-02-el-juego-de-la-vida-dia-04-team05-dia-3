# frozen_string_literal: true

require 'rspec'
require './lib/game'
require './lib/cell'
require './lib/location'
require './lib/grid'
require './lib/neighborhood'

describe Game do
  it 'it expect to create new Object' do
    @width = 3
    @height = 3
    c_1 =  Cell.new(Location::NORTHWEST)
    c_2 =  Cell.new(Location::NORTH)
    c_3 =  Cell.new(Location::NORTHEAST)
    c_4 =  Cell.new(Location::WEST)
    c_5 =  Cell.new(Location::CENTER)
    c_6 =  Cell.new(Location::EAST)
    c_7 =  Cell.new(Location::SOUTHWEST)
    c_8 =  Cell.new(Location::SOUTH)
    c_9 =  Cell.new(Location::SOUTHEAST)
    @cells = [c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9]
    @neighborhood = Neighborhood.new(@cells)
    @neighborhood.seed(@cells)
    @neighborhood.random_populate
    @grid = Grid.new(@width, @height, @neighborhood.cells)
    @grid.put_life(@neighborhood.cells)
    puts "\n"
    @grid.paint

    # expect(Game.new).to be_valid
  end
end
