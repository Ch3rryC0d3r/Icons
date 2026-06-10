Icons.testjk = SMODS.Joker{
    key = 'test',
    loc_vars = function (self, info_queue, card)
        return {vars = {
            22,
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
            "{C:green} Mult #1# {element:1}jimbo",
            "Chips Mult"
        }
    }
}

SMODS.Atlas{
    key = 'icons',
    path = 'icons.png',
    px = 18,
    py = 18
}

Icons.Icon{
    key = 'mult',
    atlas = 'icons',
    pos = {x = 2, y = 3},
    targets = {"Mult"},
}
Icons.Icon{
    key = 'chps',
    atlas = 'icons',
    pos = {x = 0, y = 5},
    targets = {"Chips"},
}