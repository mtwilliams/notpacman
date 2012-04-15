components.physical = class(component)

function components.physical:new( body )
    component.new(self, 'physical')
    self.body = body
end

function components.physical:set_body( body )
    self.body = body
end

function components.physical:get_body()
    return self.body
end

local debug_drawers = {}
function debug_drawers.circle ( phys_component )
    local entity = phys_component._entity
    local body = phys_component.body

    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.circle('line', entity.x, entity.y, body.radius, 32)
    love.graphics.setColor(255, 255, 255, 255)
end

function components.physical:draw_debug()
    debug_drawers[self.body.type](self)
end