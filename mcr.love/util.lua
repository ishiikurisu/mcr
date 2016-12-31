local util = { }
local color = require "model/entity/color"

-- COLOR PALETTE
util.palette = {
  black = color.new(5, 47, 95),
  blue = color.new(0, 83, 119),
  green = color.new(6, 167, 125),
  yellow = color.new(213, 198, 122),
  orange = color.new(241, 162, 8)
}

-- CAR DYNAMICS
util.maxSpeed = 120
util.airFriction = 5/10

return util
