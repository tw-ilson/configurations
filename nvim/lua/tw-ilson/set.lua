--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd [[set shortmess+=A]]

-- no wrap
vim.o.wrap = false

-- no swap file
vim.o.swapfile = false

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.o.undofile = true

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

-- Tabs
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Qt Highlighting
vim.filetype.add({
  extension = {
    qrc = "xml",
    ts = "xml",
  },
})

-- ----------------------
-- Autocmds
-- ----------------------

-- Auto-save
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    -- Skip if: not modified, no filename, not a normal buffer, or not modifiable
    if not vim.bo[buf].modified
      or vim.fn.expand("%") == ""
      or vim.bo[buf].buftype ~= ""
      or not vim.bo[buf].modifiable then
      return
    end
    vim.cmd("silent write")
  end,
})
