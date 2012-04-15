component = class()

function component:new( type )
    self.type = type
end

function component:get_type()
    return self.type
end