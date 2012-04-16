resources = {}

function resources.load()
    print('* loading resources')

    print('* loading \'data/default_font.ttf\'')
    resources.default_font = love.graphics.newFont('data/default_font.ttf', 16)

    print('* loading \'data/title_font.ttf\'')
    resources.title_font = love.graphics.newFont('data/default_font.ttf', 48)

    print('* loading \'data/menu_font.ttf\'')
    resources.menu_font = love.graphics.newFont('data/default_font.ttf', 24)

    print('* loading \'data/game_font.ttf\'')
    resources.game_font = love.graphics.newFont('data/default_font.ttf', 24)

    print('* loading \'data/sprites.png\'')
    resources.sprites = love.graphics.newImage('data/sprites.png')
    resources.sprites:setFilter('nearest', 'nearest')

    print('* loading \'data/board.png\'')
    resources.board_img = love.graphics.newImage('data/board.png')
    resources.board_img:setFilter('nearest', 'nearest')

    print(' -> creating board sprite')
    resources.board_sprite = sprite(resources.board_img, {
        { x = 0,  y = 0, width = 256, height = 256, scale = 2 },
    })

    print('* loading \'data/board.png\'')
    local img_data = love.image.newImageData('data/board_tiles.png')
    resources.board_tiles = {}

    print(' -> creating tiles')
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