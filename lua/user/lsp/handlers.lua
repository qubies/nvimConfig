local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
	local signs = {

		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		virtual_text = false, -- disable virtual text
		signs = {
			active = signs, -- show signs
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function symbol_finder(type)
	return string.format('<cmd>lua require("telescope.builtin").lsp_workspace_symbols({symbols="%s"})<CR>', type)
end

local function diagnostic_finder(severity)
	return string.format('<cmd>lua require("telescope.builtin").diagnostics({severity="%s"})<CR>', severity)
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(
		bufnr,
		"n",
		"<leader>lD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ desc = "Goto declaration in buffer", unpack(opts) }
	)
	keymap(
		bufnr,
		"n",
		"<leader>l?",
		"<cmd>Telescope lsp_definitions<CR>",
		{ desc = "Find definition(s) in buffer", unpack(opts) }
	)
	keymap(
		bufnr,
		"n",
		"gd",
		"<cmd>Telescope lsp_definitions<CR>",
		{ desc = "Find definition(s) in buffer", unpack(opts) }
	)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show symbol info", unpack(opts) })
	keymap(bufnr, "n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show Implementations", unpack(opts) })
	keymap(
		bufnr,
		"n",
		"<leader>lR",
		"<cmd>Telescope lsp_references<CR>",
		{ desc = "Find references for symbol", unpack(opts) }
	)
	keymap(bufnr, "n", "<leader>lea", diagnostic_finder(), { desc = "Show all errors/diagnostics", unpack(opts) })
	keymap(bufnr, "n", "<leader>lee", diagnostic_finder("error"), { desc = "Show only error dignostics", unpack(opts) })
	keymap(
		bufnr,
		"n",
		"<leader>lew",
		diagnostic_finder("warn"),
		{ desc = "Show only warning diagnostics", unpack(opts) }
	)
	keymap(bufnr, "n", "<leader>lei", diagnostic_finder("info"), { desc = "Show only info dignostics", unpack(opts) })
	keymap(
		bufnr,
		"n",
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<cr>",
		{ desc = "Show options to fix error (actions)", unpack(opts) }
	)
	keymap(bufnr, "n", "<leader>lfa", symbol_finder(), { desc = "Find all symbols", unpack(opts) })
	keymap(bufnr, "n", "<leader>lfv", symbol_finder("variable"), { desc = "Find all variables", unpack(opts) })
	keymap(bufnr, "n", "<leader>lfc", symbol_finder("class"), { desc = "Find all classes", unpack(opts) })
	keymap(bufnr, "n", "<leader>lfs", symbol_finder("struct"), { desc = "Find all structs", unpack(opts) })
	keymap(
		bufnr,
		"n",
		"<leader>ld",
		"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
		{ desc = "Next diagnostic", unpack(opts) }
	)
	keymap(
		bufnr,
		"n",
		"<leader>lD",
		"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
		{ desc = "Previous diagnostic", unpack(opts) }
	)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename/refactor", unpack(opts) })
	keymap(
		bufnr,
		"n",
		"<leader>ls",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		{ desc = "Show signature", unpack(opts) }
	)
	keymap(bufnr, "n", "<leader>lm", "<cmd>LspInfo<cr>", { desc = "Show status of lsp", unpack(opts) })
	keymap(bufnr, "n", "<leader>lI", "<cmd>Mason<cr>", { desc = "Install new LSP", unpack(opts) })
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.documentFormattingProvider = false
	end

	lsp_keymaps(bufnr)
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

return M
