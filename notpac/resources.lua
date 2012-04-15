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

    print(' -> creating ghost sprite')
    resources.ghost = sprite(resources.sprites, {
        { x = 0,  y = 32, width = 16, height = 16, scale = 2 },
    })

    print('* loading \'data/board.png\'')
    resources.board_img = love.graphics.newImage('data/board.png')
    resources.board_img:setFilter('nearest', 'nearest')

    print(' -> creating tiles')
    resources.create_board_tiles()

    print(' -> creating board sprite')
    resources.board_sprite = sprite(resources.board_img, {
        { x = 0,  y = 0, width = 32, height = 32, scale = 16 },
    })
end

function resources.create_board_tiles()
    local img_data = love.image.newImageData('data/board.png')
    resources.board_tiles = {}

    for x=0,img_data:getWidth() - 1 do
        local tiles = {}

        for y=0,img_data:getHeight() - 1 do
            local r, g, b, a = img_data:getPixel(x, y)
            local tile = 0
            if r == 255 and g == 255 and b == 255 then tile = 1 end
            tiles[y + 1] = tile
        end

        resources.board_tiles[x] = tiles
    end
end