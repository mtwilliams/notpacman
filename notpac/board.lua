board = class(entity)

function board:new()
    entity.new(self, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5 + 16, 0)

    if CLIENT then
        self._drawable = components.drawable(resources.board_sprite)
        self:attach_component(self._drawable)
    end
end

function board:update( dt )
end