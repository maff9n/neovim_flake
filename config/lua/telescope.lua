local telescope = require("telescope")
telescope.setup({
    defaults = require("telescope.themes").get_ivy {
    },
    terminal_colors = true,
})

local opt = { noremap = true }
telescope.load_extension("recent_files")
vim.api.nvim_set_keymap("", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt) -- lists recently opened files
vim.api.nvim_set_keymap("", "<leader>sf", ":lua require('telescope.builtin').find_files()<CR>", opt)                 -- search for files respect gitignore
vim.api.nvim_set_keymap("", "<leader>ss", ":lua require('telescope.builtin').builtin()<CR>", opt)                    -- lists Built-in pickers
vim.api.nvim_set_keymap("", "<leader>sw", ":lua require('telescope.builtin').grep_string()<CR>", opt)                -- searches for the string under your cursor or the visual selection in your current working directory
vim.api.nvim_set_keymap("", "<leader>sg", ":lua require('telescope.builtin').live_grep()<CR>", opt)                  -- search for a string
vim.api.nvim_set_keymap("", "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>", opt)                -- lists diagnostics for all open buffers
vim.api.nvim_set_keymap("", "<leader>sr", ":lua require('telescope.builtin').resume()<CR>", opt)                     -- lists the results incl. multi-selections of the previous picker
vim.api.nvim_set_keymap("", "<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>", opt)                  -- lists nvim help tags
vim.api.nvim_set_keymap("", "<leader>sk", ":lua require('telescope.builtin').keymaps()<CR>", opt)                    -- lists keymaps

-- See all class names
-- https://github.com/nvim-telescope/telescope.nvim/blob/aa83606299c5beeaf80e656efbf07bde258db7be/plugin/telescope.lua#L28
vim.api.nvim_set_hl(0, "TelescopeSelection", { ctermfg = "white", ctermbg = 237 })
vim.api.nvim_set_hl(0, "TelescopeSlectionCaret", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopeMatching", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { ctermfg = "white" })
vim.api.nvim_set_hl(0, "TelescopePrompt", { ctermfg = "white" })
