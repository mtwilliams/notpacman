ghost = class(entity)

local MOVE_FRAME_TIME = 1 / 9

-- http://www.webpacman.com/ghosts.html

local TYPES = {
    blinky = {
        color = { r = 255, g = 0, b = 0 }
    },

    pinky = {
        color = { r = 255, g = 128, b = 255 }
    },

    inky = {
        color = { r = 128, g = 255, b = 255 }
    },

    clyde = {
        color = { r = 255, g = 170, b = 0 }
    },
}

function ghost:new( x, y, type )
    entity.new(self, x, y, 0.0)

    self.start = { x = x, y = y, rotation = rotation }
    self.is_ghost = true
    self.type = type

    if CLIENT then
        local color = TYPES[type].color
        self._drawable = components.drawable(sprite(resources.sprites, {
            { x = 0,  y = 32, width = 16, height = 16, scale = 2 },
        }), { r = color.r, g = color.g, b = color.b, a = 255 })

        self._drawable:set_rotation(0.0)
        self:attach_component(self._drawable)
    end

    self._physical = components.physical({
        type = "circle",
        
        radius = 12,

        on_collide = function ( self, other )
            if other.is_ghost or other.is_pacman then return false end
            return true
        end
    })

    self:attach_component(self._physical)
end

function ghost:reset()
    if CLIENT then
        self.x = self.start.x
        self.y = self.start.y
        self.rotation = self.start.rotation
    end
end

function ghost:update( dt )
end