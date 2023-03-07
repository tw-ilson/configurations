--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
-- deal with swap files
vim.cmd [[set shortmess+=A]]

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme
vim.cmd [[syntax on]]
vim.cmd [[colorscheme iceberg]]
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

