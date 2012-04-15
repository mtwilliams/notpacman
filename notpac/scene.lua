require 'entity_manager.lua'

scene = class()

function scene:new()
    self.entity_manager = entity_manager()
    self.key_listeners = {}
end

function scene:_register_key_listener( eid, key_listener )
    self.key_listeners[eid] = key_listener
end

function scene:add_entity( entity )
    local eid = self.entity_manager:add_entity(entity)
    local kl_component = entity:get_component('key_listener')
    if kl_component then self:_register_key_listener(eid, kl_component) end
    return eid
end

function scene:remove_entity( eid )
    return self.entity_manager:remove_entity(eid)
end

function scene:update( dt )
    self.entity_manager:update(dt)
end

function scene:draw()
    love.graphics.setBackgroundColor(110, 110, 110)
    love.graphics.clear()

    local draw_entity = function ( eid, entity )
        local drawable_component = entity:get_component("drawable")
        if not drawable_component then return end

        local color = drawable_component:get_color()
        love.graphics.setColor(color.r, color.g, color.b, color.a)
        drawable_component:get_sprite():draw(entity.x, entity.y, drawable_component:get_rotation())
        love.graphics.setColor(255, 255, 255, 255)
    end

    self.entity_manager:for_each_entity(draw_entity)
end

function scene:key_pressed( key )
    for i, v in ipairs(self.key_listeners) do v:key_pressed(key) end
end

function scene:key_released( key )
    for i, v in ipairs(self.key_listeners) do v:key_released(key) end
end