local car_entity = require "model/entity/car"
local level_model = { }

level_model.construct = function()
  local self = { }

  self.player = car_entity.new()
  self.actions = { }

  return self
end

level_model.new = function()
  local self = level_model.construct()

  self.push = function(action)
    table.insert(self.actions, action)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      if action == "up" then
        self.player.accelerate(dt)
      elseif action == "left" then
        self.player.turnLeft(dt)
      elseif action == "right" then
        self.player.turnRight(dt)
      elseif action == "down" then
        self.player.decelarete(dt)
      end
    end
    self.actions = { }
  end

  return self
end

return level_model
