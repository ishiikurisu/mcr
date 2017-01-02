local car_entity = { }

car_entity.construct = function(path)
    local self = { }

    self.path = path
    self.image = love.graphics.newImage(path)
    self.width = 8
    self.height = 16

    return self
end

car_entity.new = function(path)
    local self = car_entity.construct(path)

    self.draw = function(car)
        -- TODO Add rotation to car
        love.graphics.draw(self.image, car.x - self.width/2, car.y - self.height/2)
    end

    return self
end

return car_entity
