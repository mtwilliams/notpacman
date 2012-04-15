debug = {}

function debug.dump_table( t, indent )
    if indent == nil then indent = 0 end

    local si = string.rep(' ', indent)

    print(si .. '{')

    for k, v in pairs(t) do
        local vt = type(v)
        if vt == 'table' then
            print(si .. ' ' .. k .. ' = ' )
            debug.dump_table(v, indent + 2)
        elseif vt == 'userdata' then
            print(si .. ' ' .. k .. ' = userdata')
        else 
            if not v then
                print(si .. ' ' .. k .. ' = nil')
            else
                print(si .. ' ' .. k .. ' = ' .. v)
            end
        end
    end

    print(si .. '}')
end