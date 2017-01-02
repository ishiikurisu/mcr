local mainmenu_model = require "model/mainmenu_model"
local mainmenu_view = require "view/mainmenu_view"
local level_controller = require "controller/level_controller"
local mainmenu_controller = { }

mainmenu_controller.construct = function()
  local self = { }

  self.model = mainmenu_model.new()
  self.view = mainmenu_view.new()
  self.actions = { }

  return self
end

mainmenu_controller.new = function()
  local self = mainmenu_controller.construct()

  self.push = function(key)
    table.insert(self.actions, key)
  end

  self.update = function(dt)
    for _, action in pairs(self.actions) do
      if action == "up" then
        self.model.moveUp()
      elseif action == "down" then
        self.model.moveDown()
      elseif action == "return" then
        reaction = self.model.select()
        if reaction == nil then
          love.event.quit()
        else
          return level_controller.new('sample')
        end
      end
    end
    self.actions = { }
    return self
  end

  self.draw = function()
    self.view.draw(self.model.options, self.model.option)
  end

  return self
end

return mainmenu_controller
