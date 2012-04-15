require 'entities.lua'

entity_manager = class()

function entity_manager:new()
    self.entities = {}
    self.next_eid = 1
end

function entity_manager:add_entity( entity )
    local eid = self.next_eid
    self.next_eid = self.next_eid + 1
    print('* entity_manager:add_entity()\n -> ' .. eid)
    
    entity._eid = eid
    self.entities[eid] = entity
    return eid
end

function entity_manager:remove_entity( eid )
    self.entities[eid] = nil
end

function entity_manager:get_entity( eid )
    return self.entities[eid]
end

function entity_manager:update( dt )
    for i,v in ipairs(self.entities) do
        v:update(dt)
    end
end

function entity_manager:for_each_entity( inst, callback )
    for i,v in ipairs(self.entities) do
        callback(inst, i, v)
    end
end