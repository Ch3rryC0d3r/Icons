local ref = loc_parse_string
function loc_parse_string(...)
    local parsed_line = ref(...) or {}
    for i=#parsed_line, 1, -1 do
        for _, v in pairs(Icons.Icons) do
            for _, vv in ipairs(v.targets) do
                if parsed_line[i] and parsed_line[i].strings[1] == vv then
                    table.insert(parsed_line,i,{strings = {"X"}, control = {C = 'white', X = 'mult'}})
                    i = i - 1
                end
            end
        end
    end
    return parsed_line
end