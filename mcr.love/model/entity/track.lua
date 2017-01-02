local track_entity = { }

track_entity.construct = function(code)
    local self = { }

    self.code = code
    self.bit = util.loadTrack(code)

    return self
end

track_entity.new = function(code)
    local self = track_entity.construct(code)

    self.willCollide = function(car, dt)
      local dx, dy = car.nextState(dt)
      local x0, y0 = car.x + dx, car.y + dy
      local x, y = math.floor(x0), math.floor(y0)
      local result = not self.bit[x][y]

      return result
    end

    return self
end

return track_entity
