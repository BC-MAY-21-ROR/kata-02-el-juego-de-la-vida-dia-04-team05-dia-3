# frozen_string_literal: true

# require './cell.rb'

class Grid
  attr_reader :cells, :alive_cells, :paint, :put_life

  def initialize(width, height, cells)
    @width = width
    @height = height
    @cells = cells
    @grid = Array.new(@width) { Array.new(@height) }
    @cells = cells
    put_life(@cells)
  end

  def alive_cells
    count = 0
    @cells.each { |cell| count += 1 if cell.alive? }
    count
  end

  def paint
    count = 0
    (0..@grid.size - 1).each do |row|
      (0..@grid[row].size - 1).each do |column|
        print (@grid[row][column]).to_s
      end
      print "\n"
    end
  end

  def put_life(cells)
    count = 0
    (0..@grid.size - 1).each do |row|
      (0..@grid[row].size - 1).each do |column|
        @grid[row][column] = cells[count].char
        count += 1
      end
    end
  end
end
