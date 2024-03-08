local opts = { noremap = true, silent = true }

-- TODO find a better - more local - solution
local diagnostic_toggle = true
function diagnostic_toggle_function()
    if (diagnostic_toggle)
    then
        vim.diagnostic.disable()
        diagnostic_toggle = false
    else
        vim.diagnostic.enable()
        diagnostic_toggle = true
    end
end

vim.api.nvim_set_keymap('n', '<space>d', '<cmd>lua diagnostic_toggle_function()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setqflist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

local on_attach = function(client, bufnr)
    -- (Enable completion triggered by <c-x><c-o>) Redundant?
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- KEYBINDINGS
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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
-- capabilities make the ls aware of the options of the editor?
--
-- could use a loop here -> most likely nothing is done here anyways
-- rope etc are packaged by python311 anyways
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

require('lspconfig').rnix.setup({
    on_attach = on_attach,
    flags = {},
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
