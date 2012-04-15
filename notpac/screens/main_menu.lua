require 'screens/single_player.lua'

main_menu = class(screen)

function main_menu:new()
    self.title_anim = 0.0
    self.title_anim_dir = 1.0
    self.title_x = (love.graphics.getWidth()  - resources.title_font:getWidth("not pacman")) * 0.5
    self.title_y = (love.graphics.getHeight() - resources.title_font:getHeight()) * 0.5 - 100
    self.options_y = (love.graphics.getHeight()) * 0.5 - 32

    self.options = {}
    self.selection = 1

    table.insert(self.options, { option = "singleplayer", on_pressed = function( self ) screen_manager.push_screen(singleplayer()) end })
    table.insert(self.options, { option = "quit", on_pressed = function ( self ) love.event.push("q") end })
end

function main_menu:update( dt )
    self.title_anim = self.title_anim + dt * self.title_anim_dir
    if self.title_anim > 5 then
        self.title_anim = 5
        self.title_anim_dir = -1
    elseif self.title_anim < 0 then
        self.title_anim = 0
        self.title_anim_dir = 1
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
    for i,v in ipairs(self.options) do
        local item_x = (love.graphics.getWidth() - resources.menu_font:getWidth(v.option)) * 0.5
        
        if self.selection == i then
            love.graphics.setColor(255, 0, 0, 255)
            love.graphics.print(v.option, item_x, item_y, 0, 1.0, 1.0)
            love.graphics.setColor(255, 191, 0, 255)
        else
            love.graphics.print(v.option, item_x, item_y, 0, 1.0, 1.0)
        end

        love.graphics.print(i, item_x - 32, item_y, 0, 1.0, 1.0)
        
        item_y = item_y + item_ys
    end

    love.graphics.setColor(255, 255, 255, 255)
end

--------------------------------------------------------------------------------

local key_handlers = {}

function key_handlers:up()
    self.selection = self.selection - 1
    if self.selection < 1 then self.selection = #self.options end
end

function key_handlers:down()
    self.selection = self.selection + 1
    if self.selection > #self.options then self.selection = 1 end
end

function key_handlers:enter()
    self.options[self.selection].on_pressed(self)
end

key_handlers['return'] = key_handlers['enter']

--------------------------------------------------------------------------------

function main_menu:key_pressed( key )
    for k, v in pairs(key_handlers) do
        if k == key then v(self) break end
    end
end

function main_menu:key_released( key )
end