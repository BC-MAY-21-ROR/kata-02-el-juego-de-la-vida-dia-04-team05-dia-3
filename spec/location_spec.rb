# frozen_string_literal: true

require 'rspec'
require './lib/location'
describe Location do
  before :all do
    @north_west = Location::NORTHWEST
    @north_east = Location::NORTHEAST
    @south_west = Location::SOUTHWEST
    @south_east = Location::SOUTHEAST
    @center = Location::CENTER
    @north = Location::NORTH
    @south = Location::SOUTH
    @east = Location::EAST
    @west = Location::WEST
  end
  it 'NorthWest is located at (-1, 1)' do
    location = Location::NORTHWEST
    expect(location).to eq(@north_west)
  end
  it 'NorthEast is located at (1, 1)' do
    location = Location::NORTHEAST
    expect(location).to eq(@north_east)
  end
  it 'SouthWest is located at (-1, -1)' do
    location = Location::SOUTHWEST
    expect(location).to eq(@south_west)
  end
  it 'SouthEast is located at (1, -1)' do
    location = Location::SOUTHEAST
    expect(location).to eq(@south_east)
  end
  it 'Center is located at (0, 0)' do
    location = Location::CENTER
    expect(location).to eq(@center)
  end
  it 'North is located at (0, 1)' do
    location = Location::NORTH
    expect(location).to eq(@north)
  end
  it 'South is located at (0, -1)' do
    location = Location::SOUTH
    expect(location).to eq(@south)
  end
  it 'East is located at (1, 0)' do
    location = Location::EAST
    expect(location).to eq(@east)
  end
  it 'West is located at (-1, 0)' do
    location = Location::WEST
    expect(location).to eq(@west)
  end
  it 'location for 0, 1 is north' do
    location = Location::NORTH
    expect(location).to eq(@north)
  end
  it 'adding two locations returns a new location' do
    result = Location.add(Location::SOUTH, Location::CENTER)
    expect(result).to eq(Location::SOUTH)
  end
  it 'returns a list of offsets for any cell' do
    offsets = Location::OFFSETS
    expected = [Location::NORTHWEST, Location::NORTHEAST,
                Location::SOUTHWEST, Location::SOUTHEAST, Location::NORTH,
                Location::SOUTH, Location::EAST, Location::WEST]
    expect(expected).to eq(offsets)
  end
end
