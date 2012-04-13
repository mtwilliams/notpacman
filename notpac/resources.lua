resources = {}

function resources.load()
    print('* loading resources')

    print('* loading \'data/default_font.ttf\'')
    resources.default_font = love.graphics.newFont('data/default_font.ttf', 16)

    print('* loading \'data/title_font.ttf\'')
    resources.title_font = love.graphics.newFont('data/default_font.ttf', 48)

    print('* loading \'data/menu_font.ttf\'')
    resources.menu_font = love.graphics.newFont('data/default_font.ttf', 24)
end