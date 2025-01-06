vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })

require('gitsigns').setup {
    signs                             = {
        -- add          = { hl = 'GitSignsAdd', text = '+' },
        -- change       = { hl = 'GitSignsChange', text = '+' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    watch_gitdir                      = {
        follow_files = true
    },
    attach_to_untracked               = true,
    max_file_length                   = 40000,
    preview_config                    = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    signcolumn                        = false, -- Toggle with `:Gitsigns toggle_signs`
    numhl                             = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                            = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                         = false, -- Toggle with `:Gitsigns toggle_word_diff`
    current_line_blame                = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts           = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter      = '<author_time:%d.%m.%Y> > <author> > <summary>',
    status_formatter                  = nil, -- Use default
}
