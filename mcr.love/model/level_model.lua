local car_entity = require "model/entity/car"
local track_entity = require "model/entity/track"
local level_model = { }

level_model.construct = function(track)
  local self = { }

  self.player = car_entity.new()
  self.track = track_entity.new(track)
  self.actions = { }

  return self
end

level_model.new = function(track)
  local self = level_model.construct(track)

  self.push = function(action)
    table.insert(self.actions, action)
  end

  self.update = function(dt)
    -- USER MOTIVATED CHANGES
    for _, action in pairs(self.actions) do
      -- Accelerate
      if action == "up" then
        self.player.accelerate(dt, self.player.acceleration)
      elseif action == "down" then
        self.player.accelerate(dt, -self.player.acceleration)
      end

      -- Take a turn
      if action == "left" then
        self.player.turnLeft(dt)
      elseif action == "right" then
        self.player.turnRight(dt)
      end
    end

    -- AUTOMATIC CHANGES
    self.player.decelarate(dt)
    if self.track.willCollide(self.player, dt) then
      -- TODO Apply physics of collisions here
      self.player.speed = 0
    end
    self.player.drive(dt)
    self.actions = { }
  end

  return self
end

return level_model
