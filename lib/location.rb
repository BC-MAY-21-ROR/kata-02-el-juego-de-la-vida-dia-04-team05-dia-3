# frozen_string_literal: true

class Location
  NORTHWEST = [-1, -1].freeze
  NORTHEAST = [-1, 1].freeze
  SOUTHWEST = [1, -1].freeze
  SOUTHEAST = [1, 1].freeze
  CENTER    = [0, 0].freeze
  NORTH     = [-1, 0].freeze
  SOUTH     = [1, 0].freeze
  EAST      = [0, 1].freeze
  WEST      = [0, -1].freeze
  OFFSETS = [NORTHWEST, NORTHEAST, SOUTHWEST, SOUTHEAST, NORTH, SOUTH, EAST, WEST].freeze

  def self.all
    [NORTHWEST, NORTHEAST, SOUTHWEST, SOUTHEAST, NORTH, SOUTH, EAST, WEST]
  end

  def self.add(first, second)
    [first[0] + second[0], first[1] + second[1]]
  end
end
