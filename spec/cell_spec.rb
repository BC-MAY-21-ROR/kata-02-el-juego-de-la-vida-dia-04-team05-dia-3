# frozen_string_literal: true

require 'rspec'
require './lib/cell'
require './lib/location'
describe Cell do
  before :all do
    @cell = Cell.new(Location::CENTER)
  end
  it 'is alive when it is created' do
    expect(!@cell.alive?).to be_falsey
  end

  it 'is alive when it is created' do
    expect(@cell.alive?).to be_truthy
  end

  it "a cell can't transition from live to dead" do
    @cell.die
    expect(@cell.alive?).to be_falsey
  end

  it 'a cell can transition to dead' do
    @cell.die
    expect(!@cell.alive?).to be_truthy
  end

  it 'returns true if a cell is located in the specified location' do
    cell = Cell.new(Location::CENTER)
    result = cell.at?(Location::CENTER)
    expect(result).to be_truthy
  end

  it 'returns false if a cell is not located in the specified location' do
    cell = Cell.new(Location::CENTER)
    result = cell.at?(Location::NORTH)
    expect(result).to be_falsey
  end
end
