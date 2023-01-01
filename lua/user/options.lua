local v = vim.opt -- looks prettier

v.backup = false                          -- creates a backup file
v.cmdheight = 1                           -- more space in the neovim command line for displaying messages
v.clipboard = ""
v.completeopt = { "menuone", "noselect" } -- mostly just for cmp
v.conceallevel = 0                        -- so that `` is visible in markdown files
v.fileencoding = "utf-8"                  -- the encoding written to a file
v.hlsearch = true                         -- highlight all matches on previous search pattern
v.ignorecase = true                       -- ignore case in search patterns
v.smartcase = true
v.mouse = "a"                             -- allow the mouse to be used in neovim
v.pumheight = 10                          -- pop up menu height
v.showtabline = 0                         -- always show tabs
v.smartcase = true                        -- smart case
v.smartindent = true                      -- make indenting smarter again
v.splitbelow = true                       -- force all horizontal splits to go below current window
v.splitright = true                       -- force all vertical splits to go to the right of current window
v.swapfile = false                        -- creates a swapfile
v.termguicolors = true                    -- set term gui colors (most terminals support this)
v.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
v.undofile = true                         -- enable persistent undo
v.updatetime = 300                        -- faster completion (4000ms default)
v.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
v.expandtab = true                        -- convert tabs to spaces
v.shiftwidth = 4                          -- the number of spaces inserted for each indentation
v.tabstop = 4                             -- insert 2 spaces for a tab
v.cursorline = true                       -- highlight the current line
v.number = true                           -- set numbered lines
v.laststatus = 3                          -- only the last window will always have a status line
v.showcmd = false                         -- hide (partial) command in the last line of the screen (for performance)
v.ruler = false                           -- hide the line and column number of the cursor position
v.numberwidth = 4                         -- minimal number of columns to use for the line number {default 4}
v.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
v.wrap = false                            -- display lines as one long line
v.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
v.sidescrolloff = 8                       -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
v.guifont = "monospace:h17"               -- the font used in graphical neovim applications
v.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
v.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
v.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
v.iskeyword:append("-")                   -- treats words with `-` as single words
v.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
v.linebreak = true
v.foldmethod = "marker"                   -- Sets the fold method to use {{{ }}} to mark the start and end of a fold
