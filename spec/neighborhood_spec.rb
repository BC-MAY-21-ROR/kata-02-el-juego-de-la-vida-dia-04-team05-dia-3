# frozen_string_literal: true

require 'rspec'
require './lib/neighborhood'
require './lib/cell'
require './lib/location'

describe Neighborhood do
  it 'with one alive cell will die in the next generation' do
    cell = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    neighborhood = Neighborhood.new
    neighborhood.seed([cell, c2])
    neighborhood.tick
    expect(cell.dead?).to be_truthy
  end
  it 'with 2 alive cells as neighbors will stay alive' do
    cell_one = Cell.new(Location::CENTER)
    cell_two = Cell.new(Location::NORTH)
    cell_tree = Cell.new(Location::SOUTH)
    neighborhood = Neighborhood.new
    neighborhood.seed([cell_one, cell_two, cell_tree])
    neighborhood.tick
    expect(cell_one.alive?).to be_truthy
  end
  it 'number of neighbors is 0 for a cell that is lonely' do
    c1 = Cell.new(Location::CENTER)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1])
    neighbors = neighborhood.number_of_neighbors_for(c1)
    expect(neighbors).to eq(0)
  end
  it 'number of neighbors is 1 for a cell that has a neighbor in north' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(1)
  end
  it 'number of neighbors is 2 for a cell that has a neighbor in north and south' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(2)
  end

  it 'number of neighbors is 2 for a northwest cell that has a neighbor in north and west' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(2)
  end
  it 'number of neighbors is 8 for a center cell that has a neighbor in all locations' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::SOUTH)
    c4 = Cell.new(Location::EAST)
    c5 = Cell.new(Location::WEST)
    c6 = Cell.new(Location::NORTHWEST)
    c7 = Cell.new(Location::NORTHEAST)
    c8 = Cell.new(Location::SOUTHWEST)
    c9 = Cell.new(Location::SOUTHEAST)

    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3, c4, c5, c6, c7, c8, c9])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(8)
  end
  it 'number of neighbors is 3 for a north west cell that has a neighbor in north, west and center' do
    c1 = Cell.new(Location::NORTHWEST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3, c4])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(3)
  end
  it 'number of neighbors is 3 for a NorthEast cell that has a neighbor in north, east and center' do
    c1 = Cell.new(Location::NORTHEAST)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::EAST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3, c4])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(3)
  end
  it 'number of neighbors is 3 for a SouthWest cell that has a neighbor in south, west and center' do
    c1 = Cell.new(Location::SOUTHWEST)
    c2 = Cell.new(Location::SOUTH)
    c3 = Cell.new(Location::WEST)
    c4 = Cell.new(Location::CENTER)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3, c4])
    expect(neighborhood.number_of_neighbors_for(c1)).to eq(3)
  end
  it 'a cell with 4 alive cells will die of overcrowding' do
    c1 = Cell.new(Location::CENTER)
    c2 = Cell.new(Location::NORTH)
    c3 = Cell.new(Location::NORTHWEST)
    c4 = Cell.new(Location::WEST)
    c5 = Cell.new(Location::SOUTHWEST)
    neighborhood = Neighborhood.new
    neighborhood.seed([c1, c2, c3, c4, c5])
    neighborhood.tick
    expect(c1.dead?).to be_truthy
  end
end
