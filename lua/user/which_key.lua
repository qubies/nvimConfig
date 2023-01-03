local wk = require("which-key")
wk.register({
	["<leader>"] = {
		f = {
			name = "Find Stuff",
		},
		d = {
			name = "Debug",
		},
		l = {
			name = "LSP",
            f = {
                name = "Find with LSP"
            },
            e = {
                name = "Errors/Diagnostics"
            }
		},
		p = {
			name = "Put with yanky",
		},
		s = {
			name = "Surrounds",
		},
	},
})
