function class(base)
    local c = {}    -- a new class instance
    
    if type(base) == 'function' then
        base = nil
    elseif type(base) == 'table' then
        -- our new class is a shallow copy of the base class!
        for i,v in pairs(base) do
            c[i] = v
        end
        
        c._base = base
    end
    
    -- the class will be the metatable for all its objects,
    -- and they will look up their methods in it.
    c.__index = c

    -- expose a constructor which can be called by <classname>(<args>)
    local mt = {}
    mt.__call = function(class_tbl, ...)
    local obj = {}
    
    setmetatable(obj, c)
    
    -- make sure that any stuff from the base class is initialized!
    if base and base.new then
        base.new(obj, ...)
    end
    
    if class_tbl.new then
        class_tbl.new(obj,...)
    else 
        
    end
        return obj
    end
    
    c.new = new
    c.is_a = function(self, klass)
    
    local m = getmetatable(self)
    while m do 
        if m == klass then return true end
        m = m._base
    end
        return false
    end
    
    setmetatable(c, mt)
    return c
end