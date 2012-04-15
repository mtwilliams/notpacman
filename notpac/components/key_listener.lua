components.key_listener = class(component)

function components.key_listener:new( on_pressed, on_released )
    component.new(self, 'key_listener')
    self.on_pressed = on_pressed
    self.on_released = on_released
end

function components.key_listener:key_pressed( key )
    if self.on_pressed then self.on_pressed(self._entity, key) end
end

function components.key_listener:key_released( key )
    if self.on_released then self.on_released(self._entity, key) end
end