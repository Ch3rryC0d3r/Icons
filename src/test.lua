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
            "{C:green}Mult #1# {element:1}jimbo"
        }
    }
}

Icons.Icon{
    key = 'mult',
    targets = {"Mult"}
}
Icons.Icon{
    key = 'chps',
    targets = {"Chips"},
    pos = {x = 1, y = 0}
}