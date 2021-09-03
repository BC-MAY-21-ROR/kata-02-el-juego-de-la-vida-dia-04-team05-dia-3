require 'rspec'
require './lib/cell.rb'

describe Cell do
		before :each do 
				@cell = Cell.new(0, 0)
		end
		it 'is alive when it is created' do            
			expect(!@cell.alive?).to be_     
		end

		it 'is alive when it is created' do            
			expect(@cell.alive?).to eq(true)           
		end  

    it "a cell can't transition from live to dead" do
		  @cell.die!          
			expect(!@cell.alive?).to be_falsey
		end

		it 'a cell can transition from live to dead' do
			expect(@cell.alive?).to be_truthy
		end

    # it 'a cell have coordinates x, y' do
		# 	cell = Cell.new(0, 0)
    #   expect(cell).to eq(@y=0, @x=0)
		# end
end