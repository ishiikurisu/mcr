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

-- TRACK STUFF

--[[This function returns the bitmap of the given track, mapped as true for
the track itself (the black parts) and false for off limits bits (the white).]]
util.loadTrack = function(code)
    local filename = 'assets/track/' .. code .. '.bit.bmp'
    local source = love.graphics.newImage(filename)
    local image = nil
    local bitmap = { }

    -- Checking if source image is compressed
    if source:isCompressed() then
      local compressedData = source:getString()
      local compressionFormat = source:getFormat()
      local rawString = love.math.decompress(compressedData, compressionFormat)
      image = love.image.newImageData(600, 800, rawString)
    else
      image = source:getData()
    end

    -- Loading bits of image
    for x = 1, source:getWidth() do
      local line = { }
      for y = 1, source:getHeight() do
        local r, g, b, a = image:getPixel(x-1, y-1)
        local offLimits = true
        if r > 250 then
          offLimits = false
        end
        line[y] = offLimits
      end
      bitmap[x] = line
    end

    return bitmap
end

return util
