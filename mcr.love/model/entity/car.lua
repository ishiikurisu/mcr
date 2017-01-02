local car = { }

car.construct = function()
  local self = { }

  -- described state
  self.x = 50
  self.y = 50
  self.direction = 0

  -- changed state
  self.speed = 0
  self.rotSpeed = math.pi / 3
  self.acceleration = 50

  return self
end

car.new = function()
  local self = car.construct()

  self.accelerate = function(dt, acceleration)
    if (acceleration > 0 and self.speed < util.maxSpeed)
    or (acceleration < 0 and self.speed > -util.maxSpeed) then
      self.speed = self.speed + acceleration * dt
    end
  end

  self.turnLeft = function(dt)
    self.direction = self.direction + self.rotSpeed * dt
  end

  self.turnRight = function(dt)
    self.direction = self.direction - self.rotSpeed * dt
  end

  self.decelarate = function(dt)
    self.speed = self.speed - util.airFriction * self.speed * dt
  end

  self.drive = function(dt)
    self.x = self.x + self.speed * math.sin(self.direction) * dt
    self.y = self.y + self.speed * math.cos(self.direction) * dt
  end

  return self
end

return car
