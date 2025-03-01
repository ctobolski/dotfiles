return {
	s(
		{ trig = "diso", desc = "Returns isodate" },
		f(function()
			return os.date("%Y-%m-%dT%H:%M:%S")
		end)
	),
	s(
		{ trig = "uuid", desc = "generates a uuid" },
		f(function()
			return vim.fn.system("uuidgen"):gsub("\n", "")
		end)
	),
}
