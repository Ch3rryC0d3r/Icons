Icons = SMODS.current_mod
function Icons.log(txt) print("ICONS: ", txt) end


Icons.Icons = {}

function Icons.Icon(args)
    if not args.key then sendErrorMessage("Missing key!","ICONS") return end
    args.atlas = args.atlas or 'Joker'
    args.pos = args.pos or {x = 0, y = 0}
    args.targets = args.targets or {args.key}
    
    Icons.Icons[SMODS.current_mod.prefix..'_'..args.key] = {
        key = SMODS.current_mod.prefix..'_'..args.key,
        original_key = args.key,
        atlas = args.atlas,
        pos = args.pos,
        targets = args.targets
    }
    sendDebugMessage(("Icon %s has been registered"):format(args.key),"ICONS")
    --[[if not args.case_sensitive then
        for i,v in pairs(args.target) do
            args.target[i] = string.lower(v)
        end
    end]] --Probably remove this idk, just makes target lowercase if args.case_sensitive is false
end

-- misc_functions.lua has localize(), init_localization(), loc_parse_string()
-- game.lua has G.localization line 993

function Icons.get_starting_index(obj)
    if obj.loc_vars then
        local ret = obj.loc_vars(obj,{},obj)
        return ret.vars and ret.vars.elements and #ret.vars.elements
    else
        return 1
    end
end

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

Icons.testjk = SMODS.Joker{
    key = 'test',
    loc_vars = function (self, info_queue, card)
        return {vars = {
            elements = {
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                { n=G.UIT.O, config= { object =
                    SMODS.create_sprite(0, 0, .5, .5, "Joker", {x = 0, y = 0})
                } }
            } },
            }
        }}
    end,
    loc_txt = {
        name = 'test',
        text = {
            "{C:green}hi{element:1}jimbo"
        }
    }
}

Icons.Icon{
    key = 'test',
    targets = {"Mult", "Chips", "Joker"}
}