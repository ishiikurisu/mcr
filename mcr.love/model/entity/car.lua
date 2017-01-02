local car = { }

car.construct = function()
  local self = { }

  -- described state
  self.x = 200
  self.y = 200
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

  self.nextState = function(dt)
    local dx = self.speed * math.sin(self.direction) * dt
    local dy = self.speed * math.cos(self.direction) * dt
    return dx, dy
  end

  self.drive = function(dt)
    local dx, dy = self.nextState(dt)
    self.x = self.x + dx
    self.y = self.y + dy
  end

  return self
end

return car
