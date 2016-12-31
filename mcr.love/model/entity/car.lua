local car = { }

car.construct = function()
  local self = { }

  -- described state
  self.x = 50
  self.y = 50
  self.direction = 0

  -- changed state
  self.speed = 0
  self.accelaration = 5

  return self
end

car.new = function()
  local self = car.construct()

  self.accelerate = function()
  end

  self.turnLeft = function()
  end

  self.turnRight = function()
  end

  self.decelarete = function()
  end

  return self
end

return car
