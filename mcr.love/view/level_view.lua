local car_entity = require "view/entity/car"
local track_entity = require "view/entity/track"
local level_view = { }

level_view.construct = function(track)
  local self = { }

  self.player = car_entity.new('assets/car/player_car.bmp')
  self.track = track_entity.new('assets/track/' .. track .. '.art.bmp')

  return self
end

level_view.new = function(track)
  local self = level_view.construct(track)

  self.drawCar = function(car)
    self.player.draw(car)
  end

  self.drawTrack = function()
    self.track.draw()
  end

  return self
end

return level_view
