Icons.Icon = SMODS.GameObject:extend {
    obj_table = Icons.Icons,
    set = "Icons",
    required_params = {
        "key"
    },

    inject = function(self)
        if not self.key then sendErrorMessage("Missing key!","ICONS") return end
        self.atlas = self.atlas or 'Joker'
        self.pos = self.pos or {x = 0, y = 0}
        self.targets = self.targets or {self.key}
    
        Icons.Icons[SMODS.current_mod.prefix..'_'..self.key] = {
            key = SMODS.current_mod.prefix..'_'..self.key,
            original_key = self.key,
            atlas = self.atlas,
            pos = self.pos,
            targets = self.targets
        }
        sendDebugMessage(("Icon %s has been registered"):format(self.key),"ICONS")
    end
}

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

function Icons.get_needed_icons(obj)
    local c = 1
    for _,line in ipairs(G.localization.descriptions[obj.set][obj.key].text_parsed) do
        for _,segment in ipairs(line) do
            if segment.control and segment.control.element then c = c + 1 end
        end
    end
    return c - Icons.get_starting_index(obj)
end