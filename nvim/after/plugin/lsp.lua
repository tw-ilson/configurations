-- Native Neovim 0.11+ LSP setup (lsp-zero is deprecated)
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'clangd',
        'pyright',
        'texlab',
        'cmake',
        'glsl_analyzer',
        'wgsl_analyzer',
        'autotools_ls',
    },
    handlers = {
        function(server_name)
            vim.lsp.enable(server_name)
        end,
        -- Custom clangd configuration
        clangd = function()
            vim.lsp.config('clangd', {
                cmd = {
                    'clangd',
                    '--query-driver=/usr/bin/g++',
                    '--background-index',
                    '--clang-tidy',
                },
            })
            vim.lsp.enable('clangd')
        end,
    },
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<Enter>'] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ['<C-f>'] = cmp.mapping(function() require('luasnip').jump(1) end, {'i', 's'}),
      ['<C-b>'] = cmp.mapping(function() require('luasnip').jump(-1) end, {'i', 's'}),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer"},
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})


-- LSP keybindings on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local opts = {buffer = bufnr, remap = false}

    if client.name == "eslint" then
        vim.lsp.stop_client(client.id)
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end,
})

-- Show diagnostic when hovering cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
