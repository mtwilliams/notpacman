components.drawable = class(component)

function components.drawable:new( sprite, color )
    component.new(self, 'drawable')
    self.sprite = sprite

    if type(color) ~= 'table' then color = { r = 255, g = 255, b = 255, a = 255 } end
    self.color = color
end

function components.drawable:set_rotation( rotation )
    self.rotation = rotation
end

function components.drawable:get_rotation()
    return self.rotation
end

function components.drawable:get_color()
    return self.color
end

function components.drawable:get_sprite()
    return self.sprite
end