local track_entity = { }

track_entity.construct = function(path)
    local self = { }

    self.path = path
    self.image = love.graphics.newImage(path)

    return self
end

track_entity.new = function(path)
    local self = track_entity.construct(path)

    self.draw = function(car)
        love.graphics.draw(self.image)
    end

    return self
end

return track_entity
