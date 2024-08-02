toggle_diagnostic_hints = (function()
        local switch = true
        return function()
            if (switch)
            then
                vim.diagnostic.disable()
                switch = false
            else
                vim.diagnostic.enable()
                switch = true
            end
        end
    end)()

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua toggle_diagnostic_hints()<CR>', opts)   -- toggle visibility of any diagnostic hints
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)  -- set the quickfix list to the diagnostics
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- open the diagnostic float window
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)        -- go to the previous diagnostic
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)        -- go to the next diagnostic

local on_attach = function(client, bufnr)
    -- Mappings.
    -- KEYBINDINGS
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)           -- search for declaration of the symbol under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)            -- jump to the definition of the symbol under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)                  -- show hover information for the symbol under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)        -- list all implementations of the symbol under the cursor in the quickfix window
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)     -- show signature help for the symbol under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)                      -- list all workspace folders
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts) -- jump to the type definition of the symbol under the cursor
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)            -- list all references of the symbol under the cursor in the quickfix window
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)      -- format the current buffer
    -- Mappings.
    -- AUTOCOMMANDS
    vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup("lspTweaks", { clear = true, }),
        pattern = client.filetypes,
        callback = function(args)
            vim.lsp.buf.formatting_sync()
        end,
    })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pylsp.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
    plugins = {},
})

require('lspconfig').gopls.setup({
    on_attach = on_attach,
    flags = {},
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
        },
    },
    capabilities = capabilities,
})

require('lspconfig').cmake.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})

require('lspconfig').yamlls.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})

require('lspconfig').elmls.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})

require('lspconfig').html.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})

require('lspconfig').lua_ls.setup({
    on_attach = on_attach,
    flags = {},
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    capabilities = capabilities,
})

require('lspconfig').sqls.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    flags = {},
    settings = {
            ['rust-analyzer'] = {},
    },
    capabilities = capabilities,
})

require('lspconfig').bashls.setup({
    on_attach = on_attach,
    flags = {},
    capabilities = capabilities,
})
