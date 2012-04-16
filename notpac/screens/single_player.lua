require 'entities.lua'
require 'scene.lua'

singleplayer = class(screen)

function singleplayer:new()
    self.life_sprite = sprite(resources.sprites, {
        { x = 16, y = 0, width = 16, height = 16, scale = 2 },
    })

    self:create_scene()
end

function singleplayer:create_scene()
    self.scene = scene()
    self.scene:add_entity(board())

    self._pacman = pacman(love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5 + 48 + 16, 0.0)
    self.scene:add_entity(self._pacman)

    self._blinky = ghost(love.graphics.getWidth() * 0.5 - 63 + 16, love.graphics.getHeight() * 0.5 + 16, 'blinky')
    self.scene:add_entity(self._blinky)

    self._pinky  = ghost(love.graphics.getWidth() * 0.5 - 31 + 16, love.graphics.getHeight() * 0.5 + 16, 'pinky')
    self.scene:add_entity(self._pinky)

    self._inky   = ghost(love.graphics.getWidth() * 0.5 + 31 - 16, love.graphics.getHeight() * 0.5 + 16, 'inky')
    self.scene:add_entity(self._inky)

    self._pokey  = ghost(love.graphics.getWidth() * 0.5 + 63 - 16, love.graphics.getHeight() * 0.5 + 16, 'clyde')
    self.scene:add_entity(self._pokey)

end

function singleplayer:reset()
    self._pacman:reset()
    self._blinky:reset()
    self._pinky:reset()
    self._inky:reset()
    self._pokey:reset()
end

function singleplayer:kill_ghost( ghost )
    ghost:reset()
end

function singleplayer:pacman_hit_ghost( pacman, ghost )
    print('* singleplayer:pacman_hit_ghost()\n -> is_invulnerable = ' .. tostring(pacman.is_invulnerable))

    if not pacman.is_invulnerable then
        pacman.lives = pacman.lives - 1
        if pacman.lives < 1 then self:kill_pacman(pacman)
        else self:reset() end
    else
        pacman.score = pacman.score + 200
        self:kill_ghost(ghost)
    end
end

function singleplayer:update( dt )
    self.scene:update(dt)
end

function singleplayer:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.clear()
    
    self.scene:draw()

    -- score
    love.graphics.setFont(resources.game_font)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print('score', (love.graphics.getWidth() - resources.game_font:getWidth('score')) * 0.5, 10, 0, 1.0, 1.0)

    local ss = tostring(self._pacman.score)
    love.graphics.print(ss, (love.graphics.getWidth() - resources.game_font:getWidth(ss)) * 0.5, 30, 0, 1.0, 1.0)

    -- lives
    love.graphics.setColor(255, 255, 0, 255)
    for i=1,self._pacman.lives do self.life_sprite:draw(love.graphics.getWidth() - 64, love.graphics.getHeight() - 148 + (3 - i) * 48) end
end

function singleplayer:key_pressed( key )
    self.scene:key_pressed(key)
end

function singleplayer:key_released( key )
    self.scene:key_released(key)
end