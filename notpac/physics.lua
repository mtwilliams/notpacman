resolvers = {}
resolvers.circle = {}

local RESOLVE_SPEED = 0.33

function resolvers.circle.get_overlap( a, b )
    local body_a = a:get_component('physical'):get_body()
    local body_b = b:get_component('physical'):get_body()

    local overlap = { x = 0, y = 0 }

    if body_b.type == 'circle' then
        if b.x - a.x < 0 then overlap.x = b.x - a.x + body_a.radius + body_b.radius
        else overlap.x = b.x - a.x - body_a.radius - body_b.radius end

        if b.y - a.y < 0 then overlap.y = b.y - a.y + body_a.radius + body_b.radius
        else overlap.y = b.y - a.y - body_a.radius - body_b.radius end
    end

    local m = 1.0 / math.sqrt(overlap.x * overlap.x + overlap.y * overlap.y)
    overlap.x = overlap.x * m * body_a.radius * RESOLVE_SPEED
    overlap.y = overlap.y * m * body_a.radius * RESOLVE_SPEED

    return overlap
end

function resolvers.circle.get_distance( entity, x, y )
    local body = entity:get_component('physical'):get_body()
    local dx = x - entity.x
    local dy = y - entity.y
    return math.sqrt(dx * dx + dy * dy) - body.radius
end

function resolvers.circle.resolve( a, b )
    local phys_a = a:get_component('physical')
    local body_a = phys_a:get_body()
    local phys_b = b:get_component('physical')
    local body_b = phys_b:get_body()
    local b_resolver = resolvers[body_b.type]

    local dist = b_resolver.get_distance(b, a.x, a.y)
    if dist > body_a.radius then return end

    if not phys_a:on_collide(b) then return end

    local overlap = resolvers.circle.get_overlap(a, b)
    a.x = a.x + overlap.x
    a.y = a.y + overlap.y
end