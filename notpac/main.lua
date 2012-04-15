CLIENT = true
SERVER = false

require 'debug.lua'
require 'class.lua'
require 'sprite.lua'
require 'resources.lua'
require 'screen_manager.lua'
require 'screens/main_menu.lua'

function love.load( args )
    resources.load()

    local screen = main_menu()
    screen_manager.push_screen(screen)
end

function love.quit()
end

function love.update( dt )
    screen_manager.update(dt)
end

function love.draw()
    screen_manager.draw()
end

function love.keypressed( key, unicode )
    screen_manager.key_pressed(key)
end

function love.keyreleased( key, unicode )
    screen_manager.key_released(key)
end