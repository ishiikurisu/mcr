start = require "controller/mainmenu_controller"
util = require "util"

function love.load()
  love.keyboard.setKeyRepeat(true)
  current_controller = start.new()
end

function love.keypressed(key)
  current_controller.push(key)
end

function love.update(dt)
  current_controller = current_controller.update(dt)
end

function love.draw()
  current_controller.draw()
end
