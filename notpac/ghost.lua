ghost = class(entity)

local MOVE_FRAME_TIME = 1 / 9

function ghost:new( x, y )
    entity.new(self, x, y, 0.0)

    if CLIENT then
        self._drawable = components.drawable(resources.ghost, { r = 0, g = 0, b = 255, a = 255 })
        self._drawable:set_rotation(0.0)
        self:attach_component(self._drawable)
    end

    self._physical = components.physical({
        type = "circle",
        
        radius = 16,

        on_collide = function ( self, body_a, body_b )
            print('* ghost collision')
            return true
        end
    })

    self:attach_component(self._physical)
end

function ghost:update( dt )
end