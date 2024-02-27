require "os"

-- vim.opt.spell = true
-- vim.opt.spelllang = "en"
vim.opt.writebackup = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/backup_directory"
vim.opt.mouse = "nv"
vim.opt.encoding = "UTF-8"
vim.opt.scrolloff = 777
vim.opt.autoread  = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber  = true
vim.opt.number  = true
vim.opt.wrap  = true
vim.opt.smartcase  = true
vim.opt.undofile  = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo_history"
vim.opt.incsearch  = true
vim.opt.mousehide  = true
vim.opt.hlsearch  = true
vim.opt.breakindent  = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg=237 })
