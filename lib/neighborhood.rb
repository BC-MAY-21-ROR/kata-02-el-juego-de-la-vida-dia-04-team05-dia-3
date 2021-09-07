# frozen_string_literal: true

# require './location.rb'

class Neighborhood
  attr_accessor :cells

  def initialize(cells)
    @grid = cells
  end

  def cells
    @grid
  end

  def tick
    @grid.each do |cell|
      lonely_or_over_crowded_cells_die(cell)
      reproduction_of(cell)
    end
  end

  def seed(cells)
    @grid = cells
  end

  def random_populate
    @grid.each(&:random_life)
  end

  def neighbors?(cell1, cell2)
    true if cell1.center? || cell2.center?
  end

  def number_of_neighbors_for(cell)
    size = 0
    offsets = Location.all
    offsets.each { |offset| size = count_cell(cell, offset, size) }
    size
  end

  private

  def count_cell(original, offset, size)
    neighbor = find_neighbor_cell(original, offset)
    size += 1 if neighbor
    size
  end

  def find_neighbor_cell(original, offset)
    neighbor_location = Location.add(original.location, offset)
    @grid.detect { |cell| cell.at?(neighbor_location) }
  end

  def lonely_or_over_crowded_cells_die(cell)
    neighbors_count = number_of_neighbors_for(cell)
    cell.die if (neighbors_count != 2) || (neighbors_count != 3)
  end

  def reproduction_of(cell)
    neighbors_count = number_of_neighbors_for(cell)
    cell.born if cell.dead? && (neighbors_count == 3)
  end
end
