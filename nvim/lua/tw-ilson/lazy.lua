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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
   {
	  'numToStr/Comment.nvim',-- "gc" to comment visual regions/lines
	  config = function ()
		  require('Comment').setup()
	  end
  },
  -- icons
   'nvim-tree/nvim-web-devicons',
  -- UI to select things (files, grep results, open buffers...)
   {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim"
	}
  },

   { 'nvim-telescope/telescope.nvim',
	  dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd' },
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- },
   {
	  'nvim-lualine/lualine.nvim', -- Fancier statusline
	  dependencies = {'nvim-tree/nvim-web-devicons'}
  },
  -- Add indentation guides even on blank lines
   { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  -- Highlight, edit, and navigate code using a fast incremental parsing library
   'nvim-treesitter/nvim-treesitter',
  -- Smooth scrolling
   'psliwka/vim-smoothie',
  -- Auto Save
   {
	"Pocco81/auto-save.nvim",
	config = function()
       require("auto-save").setup {
        -- your config goes here
       }
    end,
  },
   {
    "aserowy/tmux.nvim",
  },
   {'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons'},
   {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  'neovim/nvim-lspconfig',
		  'williamboman/mason.nvim',
		  'williamboman/mason-lspconfig.nvim',

		  -- Autocompletion
		  'hrsh7th/nvim-cmp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
		  'saadparwaiz1/cmp_luasnip',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-nvim-lua',

		  -- Snippets
		  'L3MON4D3/LuaSnip',
		  'rafamadriz/friendly-snippets',
	  }
  },
  {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      lazy = false, -- This plugin is already lazy
  },
  --  {
  --   'nvim-neorg/neorg',
  --   config = function()
  --       require('neorg').setup {
  --           load = {
  --               ["core.defaults"] = {}, -- Loads default behaviour
  --               ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
  --               ["core.norg.dirman"] = { -- Manages Neorg workspaces
  --                   config = {
  --                       workspaces = {
  --                           notes = "~/Sync/notes",
  --                       },
  --                   },
  --               },
  --           },
  --       }
  --   end,
  --   run = ":Neorg sync-parsers",
  --   dependencies = "nvim-lua/plenary.nvim",
  -- },
  --Math in Ascii
   'jbyuki/nabla.nvim',
   'sbdchd/neoformat',
})
