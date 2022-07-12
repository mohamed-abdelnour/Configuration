--# selene: allow(undefined_variable, unscoped_variables, unused_variable)

local home = os_getenv("HOME")

local join = function(dir, subdir)
	return dir .. "/" .. subdir
end

local dir = function(subdir)
	return join(home, subdir)
end

local_by_default = true

home_tree = dir(".local/share/luarocks")
homeconfdir = dir(".config/luarocks")
rocks_trees = {
	{
		name = "user",
		root = dir(".local/share/luarocks"),
	},
}
