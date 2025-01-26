local map = vim.keymap.set
vim.g.mapleader = ' '

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Disable mouse partially
map('', '<RightMouse>', '<nop>')
map('', '<2-RightMouse>', '<nop>')
map('', '<3-RightMouse>', '<nop>')
map('', '<4-RightMouse>', '<nop>')
map('', '<RightDrag>', '<nop>')
map('', '<LeftMouse>', '<nop>')
map('', '<2-LeftMouse>', '<nop>')
map('', '<3-LeftMouse>', '<nop>')
map('', '<4-LeftMouse>', '<nop>')
map('', '<LeftDrag>', '<nop>')
map('', '<MiddleMouse>', '<nop>')
map('', '<2-MiddleMouse>', '<nop>')
map('', '<3-MiddleMouse>', '<nop>')
map('', '<4-MiddleMouse>', '<nop>')

-- Reposition Screen on Events
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')

-- add point in undo list
map('i', '[', '[<C-g>u')
map('i', ']', ']<C-g>u')

map('v', '>', '>gv')
map('v', '<', '<gv')
map('n', '<', '<<')
map('n', '>', '>>')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Prevents space execution in case leaders follows no command
map('n', '<SPACE>', '<nop>')
