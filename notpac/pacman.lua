pacman = class(entity)

function pacman:new( x, y, rotation )
    entity.new(self, x, y, rotation)

    -- TODO: physics component
    self.x_vel = 0.0
    self.y_vel = 0.0

    if CLIENT then
        self._drawable = components.drawable(resources.pacman, { r = 255, g = 191, b = 0, a = 255 })
        self._drawable:set_rotation(rotation)
        self:attach_component(self._drawable)

        self._key_listener = components.key_listener(pacman._on_key_pressed, pacman._on_key_released)
        self:attach_component(self._key_listener)
    end
end

local move_speed = 128
function pacman:_on_key_pressed( key )
    if key == 'up' then
        self.y_vel = -move_speed
    elseif key == 'down' then
        self.y_vel = move_speed
    end

    if key == 'left' then
        self.x_vel = -move_speed
    elseif key == 'right' then
        self.x_vel = move_speed
    end
end

function pacman:_on_key_released( key )
    if key == 'up' or key == 'down' then self.y_vel = 0.0 end
    if key == 'left' or key == 'right' then self.x_vel = 0.0 end
end

function pacman:update( dt )
    self.x = self.x + self.x_vel * dt
    self.y = self.y + self.y_vel * dt

    if CLIENT then
        if self.x_vel ~= 0 or self.y_vel ~= 0 then
            local rotation = math.deg(math.atan2(self.y_vel, self.x_vel))
            self._drawable:set_rotation(rotation)
        end
    end
end