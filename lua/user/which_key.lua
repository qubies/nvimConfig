local wk = require("which-key")
wk.register({
	["<leader>"] = {
		f = {
			name = "Find Stuff",
			f = "Find File",
			g = "Find in git files",
			t = "Find with grep",
			p = "Find a project",
			b = "Find an open buffer",
			y = "Find yanks",
			r = "Find a recent file",
			n = "New File",
		},
		["/"] = "Comment selection or line",
        e = "File Explorer",
        h = "Clear search highlights",
        u = "Undo Tree",
        d = {
            name = "Debug",
        },
        g   = "Lazygit",
        l = {
            name = "LSP",
            a = "Try to fix error on current line",
            f = "Format",
            i = "LSP information",
            I = "Run Mason to install/update LSPs",
            j = "Goto next error",
            k = "Goto previous error",
            r = "Rename",
            s = "Signature",
        },
        p = {
            name = "Put with yanky",
            a = "Put on line after",
            b = "Put on line before",
            i = {
                name = "Add indent",
                a = "after",
                b = "before",
            },
            r = {
                name = "Remove indent",
                a = "after",
                b = "before",
            }
        },
        s = {
            name = "Surrounds",
        }
	},
})
