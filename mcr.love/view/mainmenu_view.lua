local mainmenu_view = { }

mainmenu_view.new = function()
  local self = { }

  self.draw = function(options, chosen)
    local chosenColor = util.palette.orange
    for i, option in ipairs(options) do
      if i == chosen then
      love.graphics.setColor(chosenColor.r, chosenColor.g, chosenColor.b)
      else
        love.graphics.setColor(255, 255, 255)
      end
      love.graphics.print(option, 50, i*50)
    end
  end

  return self
end

return mainmenu_view
