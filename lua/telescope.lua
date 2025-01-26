local telescope = require("telescope")
telescope.load_extension("recent_files")
local map = vim.keymap.set

searchConfig = {
    switch = false
}

function searchConfig:flip_switch()
    self.switch = not self.switch
    if self.switch then
        print("Will search for hidden files from now on.")
    else
        print("Won't search for hidden files from now on.")
    end
end

function searchConfig:search_hidden_files()
    if self.switch then
        return { hidden = true }
    else
        return {}
    end
end

telescope.setup({
    defaults = require("telescope.themes").get_ivy {
    },
    terminal_colors = true,
})

map("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>")
map("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>")                   -- lists recently opened files
map("n", "<leader>s.", ":lua searchConfig:flip_switch()<CR>")                                                  -- toggle searching for hidden files
map("n", "<leader>sf", ":lua require('telescope.builtin').find_files(searchConfig:search_hidden_files())<CR>") -- search for files respect gitignore
map("n", "<leader>ss", ":lua require('telescope.builtin').builtin()<CR>")                                      -- lists Built-in pickers
map("n", "<leader>sw", ":lua require('telescope.builtin').grep_string()<CR>")                                  -- searches for the string under your cursor or the visual selection in your current working directory
map("n", "<leader>sg", ":lua require('telescope.builtin').live_grep(searchConfig:search_hidden_files())<CR>")  -- search for a string
map("n", "<leader>sd", ":lua require('telescope.builtin').diagnostics()<CR>")                                  -- lists diagnostics for all open buffers
map("n", "<leader>sr", ":lua require('telescope.builtin').resume()<CR>")                                       -- lists the results incl. multi-selections of the previous picker
map("n", "<leader>sh", ":lua require('telescope.builtin').help_tags()<CR>")                                    -- lists nvim help tags
map("n", "<leader>sk", ":lua require('telescope.builtin').keymaps()<CR>")                                      -- lists keymaps

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
