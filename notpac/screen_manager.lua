require 'screen.lua'

screen_manager = {}
screen_manager.screens = {}

function screen_manager.push_screen( screen )
    table.insert(screen_manager.screens, screen)
    print("* screen_manager.push_screen")
end

function screen_manager.pop_screen()
    table.remove(screen_manager.screens, #screen_manager.screens)
end

function screen_manager.get_current_screen()
    if #screen_manager.screens < 1 then
        return nil
    end

    return screen_manager.screens[#screen_manager.screens]
end

function screen_manager.update( dt )
    screen = screen_manager.get_current_screen()
    if not screen then
        return
    end

    screen:update(dt)
end

function screen_manager.draw()
    screen = screen_manager.get_current_screen()
    if not screen then
        return
    end

    screen:draw()
end

function screen_manager.key_pressed( key )
    screen = screen_manager.get_current_screen()
    if not screen then
        return
    end

    screen:key_pressed(key)
end

function screen_manager.key_released( key )
    screen = screen_manager.get_current_screen()
    if not screen then
        return
    end

    screen:key_released(key)
end