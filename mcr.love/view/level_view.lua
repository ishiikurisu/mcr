local level_view = { }

level_view.new = function()
  local self = { }

  self.drawCar = function(car)
    local color = util.palette.blue
    local side = 8
    love.graphics.setColor(color.r, color.g, color.b)
    love.graphics.rectangle("fill", car.x - side/2, car.y - side/2, side, side)
  end

  return self
end

return level_view
