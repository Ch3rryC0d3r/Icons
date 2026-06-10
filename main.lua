Icons = SMODS.current_mod
function Icons.log(txt) print("ICONS: ", txt) end
Icons.Icons = {}

-- Manually define the path of all files to be loaded, root is 'src'
local mod_contents = {
	{path = 'util', deps = {}},
	{path = 'overrides', deps = {}},
	{path = 'test', deps = {}},
	{path = 'vanilla_definitions', deps = {}},
}

for k, v in ipairs(mod_contents) do -- Load this mod's files
	local exists = true
	if not v.deps then v.deps = {} end
	for _,vv in ipairs(v.deps) do
		if not next(SMODS.find_mod(vv)) then exists = false end
	end
	if exists then assert(SMODS.load_file('/src/'..v.path..'.lua'))() end
end