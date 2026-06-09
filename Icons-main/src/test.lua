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