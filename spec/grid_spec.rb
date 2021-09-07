# frozen_string_literal: true

require 'rspec'
require './lib/grid'
require './lib/cell'
require './lib/location'
describe Grid do
  before :all do
    @width = 3
    @height = 3
    c_1 =  Cell.new(Location::NORTHWEST)
    c_2 =  Cell.new(Location::NORTHEAST)
    c_3 =  Cell.new(Location::SOUTHWEST)
    c_4 =  Cell.new(Location::SOUTHEAST)
    c_5 =  Cell.new(Location::CENTER)
    c_6 =  Cell.new(Location::NORTH)
    c_7 =  Cell.new(Location::SOUTH)
    c_8 =  Cell.new(Location::EAST)
    c_9 =  Cell.new(Location::WEST)
    @cells = [c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9]
    @grid = Grid.new @width, @height, @cells
  end
  it 'with n cells' do
    skip
    expect(@grid).to be_kind_of(Grid.new(@width, @height, @cells))
  end
  it 'with 2 diferent cell alives random configuration' do
    skip
  end
end
