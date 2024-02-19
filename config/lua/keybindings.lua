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

-- Search
vim.keymap.set('n', '77', ':let @/=""<CR>')
