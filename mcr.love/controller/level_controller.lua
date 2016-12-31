local level_model = require "model/level_model"
local level_view = require "view/level_view"
local level_controller = { }

level_controller.construct = function()
  local self = { }

  self.model = level_model.new()
  self.view = level_view.new()
  self.actions = { }
  love.keyboard.setKeyRepeat(true)

  return self
end

level_controller.new = function()
  local self = level_controller.construct()

  self.push = function(key)
    table.insert(self.actions, key)
  end

  self.wait = function()
    local keys = { "up", "left", "right", "down" }
    for _, key in pairs(keys) do
      if love.keyboard.isDown(key) then
        table.insert(self.actions, key)
      end
    end
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      if action == "up" then
        self.model.push(action)
      elseif action == "left" then
        self.model.push(action)
      elseif action == "right" then
        self.model.push(action)
      elseif action == "down" then
        self.model.push(action)
      end
    end
    self.model.update(dt)
    self.actions = { }
    return self
  end

  self.draw = function()
    self.view.drawCar(self.model.player)
  end

  return self
end

return level_controller
