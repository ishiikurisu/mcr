local mainmenu_model = { }

mainmenu_model.construct = function()
  local self = { }

  self.option = 1
  self.options = { "New game", "Quit" }

  return self
end

mainmenu_model.new = function()
  local self = mainmenu_model.construct()

  self.moveUp = function()
    self.option = self.option - 1
    if self.option == 0 then
      self.option = #self.options
    end
  end

  self.moveDown = function()
    self.option = self.option + 1
    if self.option > #self.options then
      self.option = 1
    end
  end

  self.select = function()
    if self.option == #self.options then
      return nil
    else
      return true
    end
  end

  return self
end

return mainmenu_model
