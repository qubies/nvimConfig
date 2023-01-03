-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Left>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<S-Up>", ":move '<-2<CR>gv-gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fy", ":Telescope yank_history<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fn", ":enew<CR>", opts)

-- Git
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lff", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- undo
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

-- surrounds
keymap("n", "<leader>sp", '<cmd>execute "normal \\<Plug>Ysurroundiw)"<cr>', opts)
keymap("n", "<leader>sb", '<cmd>execute "normal \\<Plug>Ysurroundiw]"<cr>', opts)
keymap("n", "<leader>sc", '<cmd>execute "normal \\<Plug>Ysurroundiw}"<cr>', opts)
keymap("n", "<leader>sq", '<cmd>execute "normal \\<Plug>Ysurroundiw\\""<cr>', opts)

keymap(
	"v",
	"<leader>sp",
	'<cmd>execute "normal \\<Plug>VSurround)"<cr>',
	{ desc = "Surround selection with parenthesis ()", unpack(opts) }
)
keymap(
	"v",
	"<leader>sb",
	'<cmd>execute "normal \\<Plug>VSurround]"<cr>',
	{ desc = "Surround selection with brackets []", unpack(opts) }
)
keymap(
	"v",
	"<leader>sc",
	'<cmd>execute "normal \\<Plug>VSurround}"<cr>',
	{ desc = "Surround selection with curlies {}", unpack(opts) }
)
keymap(
	"v",
	"<leader>sq",
	'<cmd>execute "normal \\<Plug>VSurround\\""<cr>',
	{ desc = 'Surround selection with quotes ""', unpack(opts) }
)

-- yanky
keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
keymap({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
keymap({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

keymap("n", "<c-p>", "<Plug>(YankyCycleForward)")
keymap("n", "<c-n>", "<Plug>(YankyCycleBackward)")

-- these ones maintain the indent as it is in the copied text
-- keymap("n", "<leader>pa", "<Plug>(YankyPutIndentAfterLinewise)")
-- keymap("n", "<leader>pb", "<Plug>(YankyPutIndentBeforeLinewise)")
--
-- these ones re-indent to match the existing test in the document
keymap("n", "<leader>pa", "<Plug>(YankyPutAfterFilter)")
keymap("n", "<leader>pb", "<Plug>(YankyPutBeforeFilter)")

-- I doubt that ill ever use this... these require too much thought this way
keymap("n", "<leader>pia", "<Plug>(YankyPutIndentAfterShiftRight)") -- indent more
keymap("n", "<leader>pib", "<Plug>(YankyPutIndentBeforeShiftRight)") -- indent more
keymap("n", "<leader>pra", "<Plug>(YankyPutIndentAfterShiftLeft)") -- deindent
keymap("n", "<leader>prb", "<Plug>(YankyPutIndentBeforeShiftLeft)") -- deindent

keymap("n", "<leader>pa", "<Plug>(YankyPutAfterFilter)")
keymap("n", "<leader>pb", "<Plug>(YankyPutBeforeFilter)")
