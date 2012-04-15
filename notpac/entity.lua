require 'components.lua'

entity = class()

function entity:new( x, y, rotation )
    self.x = x
    self.y = y
    self.rotation = rotation
    self.components = {}
end

function entity:attach_component( component )
    component._entity = self
    table.insert(self.components, component)
end

function entity:detach_component( type )
    for i,v in ipair(self.components) do
        if v:get_type() == type then 
            table.remove(self.components. i)
            break
        end
    end
end

function entity:get_component( type )
    for i,v in ipairs(self.components) do
        if v:get_type() == type then return v end
    end

    return nil
end

function entity:for_each_component( callback )
    for i,v in ipair(self.components) do
        callback(self, v)
    end
end