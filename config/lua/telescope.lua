local telescope = require("telescope")
telescope.setup({
    defaults = require("telescope.themes").get_ivy {
    },
    terminal_colors = true,
})

local opt = { noremap = true }
telescope.load_extension("recent_files")
vim.api.nvim_set_keymap("", "<leader><tab>", ":lua require('telescope.builtin').find_files()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sk", ":lua require('telescope.builtin').keymaps()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sf", ":lua require('telescope.builtin').find_files()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>ss", ":lua require('telescope.builtin').builtin()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sw", ":lua require('telescope.builtin').grep_string()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sg", ":lua require('telescope.builtin').live_grep()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>sr", ":lua require('telescope.builtin').resume()<CR>", opt)
vim.api.nvim_set_keymap("", "<leader>s.", ":lua require('telescope.builtin').oldfiles()<CR>", opt)

-- See all class names
-- https://github.com/nvim-telescope/telescope.nvim/blob/aa83606299c5beeaf80e656efbf07bde258db7be/plugin/telescope.lua#L28
-- gruvbox color plate
-- https://github.com/gruvbox-community/gruvbox
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeSlectionCaret", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#111111" })
vim.api.nvim_set_hl(0, "TelescopePrompt", { fg = "#111111" })
