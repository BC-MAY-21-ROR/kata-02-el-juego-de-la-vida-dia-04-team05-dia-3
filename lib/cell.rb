class Cell 
  def initialize axis_x , axis_y 
    @axis_x,@axis_y = axis_x , axis_y 
    @alive = true  
  end

  def alive?
    @alive = true  
  end

  def die!
    @alive = false  
  end
end
