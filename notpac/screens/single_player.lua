require 'entities.lua'
require 'scene.lua'

singleplayer = class(screen)

function singleplayer:new()
    self.scene = scene()
    self.scene:add_entity(pacman(love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5, 0.0))
end

function singleplayer:update( dt )
    self.scene:update(dt)
end

function singleplayer:draw()
    self.scene:draw()
end

function singleplayer:key_pressed( key )
    self.scene:key_pressed(key)
end

function singleplayer:key_released( key )
    self.scene:key_released(key)
end