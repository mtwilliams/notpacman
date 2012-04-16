require 'entity_manager.lua'
require 'physics.lua'

scene = class()

function scene:new()
    self.entity_manager = entity_manager()
    self.key_listeners = {}
    self.physical_entities = {}
end

function scene:_register_key_listener( eid, key_listener )
    self.key_listeners[eid] = key_listener
    print('* scene:_register_key_listener()\n -> ' .. eid)
end

function scene:_register_physical_entity( eid, physical )
    self.physical_entities[eid] = physical
    print('* scene:_register_physical_entity()\n -> ' .. eid)
end

function scene:add_entity( entity )
    local eid = self.entity_manager:add_entity(entity)
    local kl_component = entity:get_component('key_listener')
    if kl_component then self:_register_key_listener(eid, kl_component) end
    local phys_component = entity:get_component('physical')
    if phys_component then self:_register_physical_entity(eid, entity) end
    return eid
end

function scene:remove_entity( eid )
    return self.entity_manager:remove_entity(eid)
end

function scene:update( dt )
    self.entity_manager:update(dt)

    local phys_entity = function ( self, eid, entity )
        for k, v in pairs(self.physical_entities) do
            if k ~= eid then 
                local phys = entity:get_component('physical')
                local body = phys:get_body()
                if phys then
                    resolvers[body.type].resolve(entity, v)
                end
            end
        end
    end

    for k, v in pairs(self.physical_entities) do phys_entity(self, k, v) end
end

function scene:draw()
    local draw_entity = function ( self, eid, entity )
        local drawable_component = entity:get_component('drawable')
        if not drawable_component then return end

        local color = drawable_component:get_color()
        love.graphics.setColor(color.r, color.g, color.b, color.a)
        drawable_component:get_sprite():draw(entity.x, entity.y, drawable_component:get_rotation())
        love.graphics.setColor(255, 255, 255, 255)
    end

    self.entity_manager:for_each_entity(self, draw_entity)

    for k, v in pairs(self.physical_entities) do v:get_component('physical'):draw_debug() end
end

function scene:key_pressed( key )
    for k, v in pairs(self.key_listeners) do v:key_pressed(key) end
end

function scene:key_released( key )
    for k, v in pairs(self.key_listeners) do v:key_released(key) end
end