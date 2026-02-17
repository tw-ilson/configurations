local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
return require('lazy').setup({
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd', 'nvim-telescope/telescope-live-grep-args.nvim' },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})
            telescope.load_extension("live_grep_args")
        end
    },
    {
        'nvim-lualine/lualine.nvim', -- Fancier statusline
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Add indentation guides even on blank lines
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = function() require("gitsigns")
            .setup({}) end },
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    {
        'nvim-treesitter/nvim-treesitter', opts = { ensure_installed = { "cpp" } }
    },
    -- Smooth scrolling
    'psliwka/vim-smoothie',
    -- fancy status bar
    { 'romgrk/barbar.nvim',      dependencies = 'nvim-web-devicons',         config = function() require("barbar").setup({}) end },
    -- LSP (native Neovim 0.11+ setup, lsp-zero is deprecated)
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },
    -- Auto-format
    'sbdchd/neoformat',
    -- Codecompanion: Alternative AI chat interface
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
        cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
        keys = {
            { "<leader>ai", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
            { "<leader>aa", "<cmd>CodeCompanionActions<cr>",     desc = "AI Actions" },
            { "<leader>ac", "<cmd>CodeCompanionChat Add<cr>",    mode = "v",         desc = "Add to AI Chat" },
        },
        opts = {
            strategies = {
                chat = {
                    adapter = "anthropic",
                },
                inline = {
                    adapter = "anthropic",
                },
                agent = {
                    adapter = "anthropic",
                },
            },
            adapters = {
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        schema = {
                            model = {
                                default = "claude-sonnet-4-20250514",
                            },
                        },
                    })
                end,
            },
            display = {
                diff = {
                    provider = "mini_diff",
                },
                chat = {
                    window = {
                        layout = "vertical",
                        width = 0.3,
                    },
                },
            },
        },
    },
})
