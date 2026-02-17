--- my remappings ---
---
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

-- folding
map('n', '<space>', 'za')
map('v', '<space>', 'zf')

-- Telescope (fuzzy find)
map('n', 'fd', ':Telescope fd')
map('n', 'fr', ':Telescope live_grep_args')

-- Neotree (file browser)
map('n', '<leader>\\', ':Neotree toggle position=left reveal_force_cwd<cr>')

-- Nabla (math)
-- map('n', 'mp', ':lua require("nabla").popup()<CR>')

--BarBar (buffers as tabs)
map('n', '<leader>[', ':BufferPrevious<CR>')
map('n', '<leader>]', ':BufferNext<CR>')
map('n', '<leader>x', ':BufferClose<CR>')
map('n', '<leader>4', ':BufferGoto 1<CR>')
map('n', '<leader>2', ':BufferGoto 2<CR>')
map('n', '<leader>3', ':BufferGoto 3<CR>')
map('n', '<leader>4', ':BufferGoto 4<CR>')
map('n', '<leader>5', ':BufferGoto 5<CR>')
map('n', '<leader>6', ':BufferGoto 6<CR>')
map('n', '<leader>7', ':BufferGoto 7<CR>')
map('n', '<leader>8', ':BufferGoto 8<CR>')
map('n', '<leader>9', ':BufferGoto 9<CR>')
map('n', '<leader>0', ':BufferLast<CR>')


--Remap space as leader key
-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
