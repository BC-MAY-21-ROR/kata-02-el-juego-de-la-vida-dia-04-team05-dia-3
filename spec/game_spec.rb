require 'rspec'
require './lib/game.rb'

describe Game do
 it "it expect to create new Object" do
    expect(Game.new).to be_valid
  end
end