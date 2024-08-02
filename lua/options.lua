require "os"

vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 237 })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.autoread       = true
vim.opt.backup         = true
vim.opt.backupdir      = os.getenv("HOME") .. "/.config/nvim/backup_directory"
vim.opt.breakindent    = true
vim.opt.clipboard      = "unnamedplus"
vim.opt.cursorline     = true
vim.opt.encoding       = "UTF-8"
vim.opt.expandtab      = true
vim.opt.hlsearch       = true
vim.opt.incsearch      = true
vim.opt.list           = true
vim.opt.listchars      = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse          = "nv"
vim.opt.mousehide      = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 777
vim.opt.shiftwidth     = 4
vim.opt.smartcase      = true
vim.opt.softtabstop    = 4
vim.opt.splitright     = true
vim.opt.tabstop        = 4
vim.opt.timeoutlen     = 300
vim.opt.undodir        = os.getenv("HOME") .. "/.config/nvim/undo_history"
vim.opt.undofile       = true
vim.opt.updatetime     = 250
vim.opt.wrap           = true
vim.opt.writebackup    = true
