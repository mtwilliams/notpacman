main_menu = class(screen)

function main_menu:new()
    self.title_anim = 0.0
    self.title_anim_dir = 1.0
    self.title_x = (love.graphics.getWidth()  - resources.title_font:getWidth("not pacman")) * 0.5
    self.title_y = (love.graphics.getHeight() - resources.title_font:getHeight()) * 0.5 - 100
    self.options_y = (love.graphics.getHeight()) * 0.5 - 32

    self.options = {}
    self.options.singeplayer = function( self ) screen_manager.push_back(singeplayer()) end

    self.selection = "singleplayer"
end

function main_menu:update( dt )
    self.title_anim = self.title_anim + dt * self.title_anim_dir
    if self.title_anim > 5 or self.title_anim < 0 then
        self.title_anim_dir = -self.title_anim_dir
    end
end

function main_menu:draw()
    love.graphics.setBackgroundColor(54, 69, 79)
    love.graphics.clear()
    love.graphics.setFont(resources.title_font)

    love.graphics.setColor(255, 191, 0, 255 * self.title_anim * 0.2)
    love.graphics.print("not pacman", self.title_x, self.title_y, 0, 1.0, 1.0)

    love.graphics.setFont(resources.menu_font)
    love.graphics.setColor(255, 191, 0, 255)
    
    local item_y = self.options_y
    local item_ys = resources.menu_font:getHeight() + 8
    for k,v in pairs(self.options) do
        local item_x = (love.graphics.getWidth() - resources.menu_font:getWidth(k)) * 0.5
        love.graphics.print(k, item_x, item_y, 0, 1.0, 1.0)
        item_y = item_y + item_ys
    end

    love.graphics.setColor(255, 255, 255, 255)
end

function main_menu:key_pressed( key )
end

function main_menu:key_released( key )
end