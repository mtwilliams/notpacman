sprite = class(sprite)

function sprite:new( sprite_sheet, frames )
    self.sprite_sheet = sprite_sheet
    self.frame = 1
    self.frames = {}

    local ssw = sprite_sheet:getWidth()
    local ssh = sprite_sheet:getHeight()

    for i,v in ipairs(frames) do
        self.frames[i] = { sx = v.scale, sy = v.scale, ox = v.width * 0.5, oy = v.height * 0.5, q = love.graphics.newQuad(v.x, v.y, v.width, v.height, ssw, ssh) }
    end
end

function sprite:set_frame( frame )
    if frame > #self.frames or frame < 1 then
        return
    end

    self.frame = frame
end

function sprite:draw( x, y, rotation )
    if not rotation then rotation = 0.0 else rotation = math.rad(rotation) end
    local f = self.frames[self.frame]
    love.graphics.drawq(self.sprite_sheet, f.q, x, y, rotation, f.sx, f.sy, f.ox, f.oy)
end