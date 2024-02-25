-- Disable arrow keys
vim.keymap.set('', '<up>', '<nop>')
vim.keymap.set('', '<down>', '<nop>')
vim.keymap.set('', '<left>', '<nop>')
vim.keymap.set('', '<right>', '<nop>')

-- Disable mouse partially
vim.keymap.set('', '<RightMouse>', '<nop>')
vim.keymap.set('', '<2-RightMouse>', '<nop>')
vim.keymap.set('', '<3-RightMouse>', '<nop>')
vim.keymap.set('', '<4-RightMouse>', '<nop>')
vim.keymap.set('', '<RightDrag>', '<nop>')
vim.keymap.set('', '<LeftMouse>', '<nop>')
vim.keymap.set('', '<2-LeftMouse>', '<nop>')
vim.keymap.set('', '<3-LeftMouse>', '<nop>')
vim.keymap.set('', '<4-LeftMouse>', '<nop>')
vim.keymap.set('', '<LeftDrag>', '<nop>')
vim.keymap.set('', '<MiddleMouse>', '<nop>')
vim.keymap.set('', '<2-MiddleMouse>', '<nop>')
vim.keymap.set('', '<3-MiddleMouse>', '<nop>')
vim.keymap.set('', '<4-MiddleMouse>', '<nop>')

-- Reposition Screen on Events
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- add point in undo list
vim.keymap.set('i', '[', '[<C-g>u')
vim.keymap.set('i', ']', ']<C-g>u')

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('n', '<', '<<')
vim.keymap.set('n', '>', '>>')

vim.keymap.set('n', 'J', '>+1<CR>gv=gv')
vim.keymap.set('n', 'K', '<-2<CR>gv=gv')
vim.keymap.set('n', 'J', '.+1<CR>==')
vim.keymap.set('n', 'K', '.-2<CR>==')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Prevents space execution in case leaders follows no command
vim.keymap.set('n', '<SPACE>', '<nop>')
