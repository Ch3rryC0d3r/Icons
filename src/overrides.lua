local ref = loc_parse_string
function loc_parse_string(...)
    local parsed_line = ref(...) or {}
    for i=#parsed_line, 1, -1 do
        local c = 1
        if parsed_line[i].control and parsed_line[i].control.element then c = c + 1 end
        for _, v in pairs(Icons.Icons) do
            for _, vv in ipairs(v.targets) do
                if parsed_line[i] and parsed_line[i].strings[1] == vv then
                    table.insert(parsed_line,i,{strings = {}, control = {element = tostring(c)}})
                    i = i - 1
                    c = c + 1
                end
            end
        end
    end
    return parsed_line
end

local ref = localize
function localize(args,misc_cat,...)
    if args and type(args) == 'table' then
        args.vars = args.vars or {}
        args.vars.elements = args.vars.elements or {}
        for _,v in ipairs(Icons.get_needed_icons(G.P_CENTERS[args.key])) do
                table.insert(
                args.vars.elements,
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                    { n=G.UIT.O, config= { object =
                        SMODS.create_sprite(0, 0, 0.3, 0.3, v.atlas ~= false and v.atlas or 'ico_icons', v.pos or {x = 0, y = 0})
                    } }
                } }
            )
        end
    end
    local ret = ref(args,misc_cat,...)
    return ret
end