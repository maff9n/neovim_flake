-- Setup nvim-cmp.

vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    -- vim.fn["luasnip#anonymous"](args.body) -- For `vsnip` users.
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
mapping = {
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  ['<Tab>'] = cmp.mapping.select_next_item(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' },
}, {
  { name = 'buffer' },
})
})
