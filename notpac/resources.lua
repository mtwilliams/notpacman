resources = {}

function resources.load()
    print('* loading resources')

    print('* loading \'data/default_font.ttf\'')
    resources.default_font = love.graphics.newFont('data/default_font.ttf', 16)

    print('* loading \'data/title_font.ttf\'')
    resources.title_font = love.graphics.newFont('data/default_font.ttf', 48)

    print('* loading \'data/menu_font.ttf\'')
    resources.menu_font = love.graphics.newFont('data/default_font.ttf', 24)

    print('* loading \'data/sprites.png\'')
    resources.sprites = love.graphics.newImage('data/sprites.png')
    resources.sprites:setFilter('nearest', 'nearest')

    print(' -> creating pacman sprite')
    resources.pacman = sprite(resources.sprites, {
        { x = 0,  y = 0, width = 16, height = 16, scale = 2 },
        { x = 16, y = 0, width = 16, height = 16, scale = 2 },
    })
end