local car_entity = require "view/entity/car"
local level_view = { }

level_view.construct = function()
    local self = { }

    self.playerCar = car_entity.new('assets/player_car.png')

    return self
end

level_view.new = function()
  local self = level_view.construct()

  self.drawCar = function(car)
    self.playerCar.draw(car)
  end

  return self
end

return level_view
