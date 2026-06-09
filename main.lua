Icons = SMODS.current_mod

Icons.HasAdded = false
Icons.IconNames = {
    "tarot"
}

function Icons.splitWords(str) -- splits lines into table of words
    local words = {}
    for word in str:gmatch("%S+") do
        table.insert(words, word)
    end
    return words
end

function Icons.parse(val)
    if type(val) == "table" then
        for i,v in pairs(val) do
            val[i] = Icons.parse(v)
        end
        return val
    elseif type(val) == "string" then
        local words = Icons.splitWords(val)
        local line = ""
        for i,v in pairs(words) do
            for ii,vv in pairs(Icons.IconNames) do
                if string.lower(v) == vv then
                    line = line .. "(ICON:" .. vv .. ") "
                end
            end
            line = line .. v .. " "
        end

        line = line:sub(1, -2)
        return line
    end
    return val
end

local old_init_localization = init_localization
function init_localization()
    if not Icons.HasAdded then G.localization = Icons.parse(G.localization); Icons.HasAdded = true end
    old_init_localization()
end

init_localization()

-- misc_functions.lua has localize(), init_localization(), loc_parse_string()
-- game.lua has G.localization line 993