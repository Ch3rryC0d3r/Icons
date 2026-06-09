Icons = SMODS.current_mod
function Icons.log(txt) print("ICONS: ", txt) end


Icons.Icons= {
    tarot = {
        key = "tarot",
        target = {"tarot"},
        atlas = "I cant the atlas name",
        pos = "nor the pos"
    }
}

function Icons.AddIcon(args)
    if not args.key then
        Icons.log("Missing key!")
        Icons.log("A key value is missing")
        Icons.log("from Icons.AddIcon somewhere!")
        return
    end

    if not args.atlas then
        Icons.log("Missing atlas!")
        Icons.log("An atlas value is missing")
        Icons.log("from Icons.AddIcon somewhere!")
        return
    end

    if not args.pos then
        args.pos = {x = 0, y = 0}
    end



    if not args.target then
        args.target = {args.key}
    end

    --[[if not args.case_sensitive then
        for i,v in pairs(args.target) do
            args.target[i] = string.lower(v)
        end
    end]] --Probably remove this idk, just makes target lowercase if args.case_sensitive is false
end

-- misc_functions.lua has localize(), init_localization(), loc_parse_string()
-- game.lua has G.localization line 993