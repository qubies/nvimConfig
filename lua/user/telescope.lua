local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

require("telescope").load_extension("refactoring")

local actions = require "telescope.actions"
telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,
      },
    },
  },
}

-- for yanky
telescope.load_extension("yank_history")
