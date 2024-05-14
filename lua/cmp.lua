vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
            ['<C-y>'] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ['<Tab>'] = nil,
            ['<S-Tab>'] = nil,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' },
--         { name = 'buffer' }
--     }, {
--         {
--             name = 'cmdline',
--             option = {
--                 ignore_cmds = { 'Man', '!' }
--             }
--         }
--     })
-- })
