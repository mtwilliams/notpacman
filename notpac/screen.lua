screen = class()

function screen:new()
end

function screen:update( dt )
    print('! default screen:update')
end

function screen:draw()
    print('! default screen:draw')
end

function screen:key_pressed( key )
    print('! default screen:key_pressed')
end

function screen:key_released( key )
    print('! default screen:key_released')
end