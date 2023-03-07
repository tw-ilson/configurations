return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package managers
  use {
	  'numToStr/Comment.nvim',-- "gc" to comment visual regions/lines
	  config = function ()
		  require('Comment').setup()
	  end
  }
  -- icons
  use 'nvim-tree/nvim-web-devicons'
  -- UI to select things (files, grep results, open buffers...)
  use {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	requires = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim"
	}
  }

  use { 'nvim-telescope/telescope.nvim',
	  tag='0.1.0',
	  requires = { 'nvim-lua/plenary.nvim' },
	  extensions = {
		  file_browser = {
			  theme = "ivy",
			  hijack_netrw = true,
		  }
	  }

  }
  use {
	  'nvim-lualine/lualine.nvim', -- Fancier statusline
	  requires = {'nvim-tree/nvim-web-devicons'}
  }
  -- Add indentation guides even on blank lines
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Smooth scrolling
  use 'psliwka/vim-smoothie'
  -- Auto Save
  use {
	"Pocco81/auto-save.nvim",
	config = function()
       require("auto-save").setup {
        -- your config goes here
       }
    end,
  }
  use {
    "aserowy/tmux.nvim",
  }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use 'sbdchd/neoformat'
  -- Jupyter
  use 'goerz/jupytext'
use {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
    theme = 'hyper',
   }
  requires = {'nvim-tree/nvim-web-devicons'}
  end,
}
end)
