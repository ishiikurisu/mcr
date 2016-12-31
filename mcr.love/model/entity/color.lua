local color = { }

color.new = function(r, g, b)
  local self = { }
  self.r = r
  self.g = g
  self.b = b
  return self
end

return color
