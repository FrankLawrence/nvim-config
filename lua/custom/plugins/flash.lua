-- flash.nvim: label-based jumping (a vim-sneak replacement)

vim.pack.add { 'https://github.com/folke/flash.nvim' }

require('flash').setup {
  modes = {
    -- Flash labels during regular `/` and `?` searches too.
    -- Set enabled = false if you'd rather keep plain search.
    search = { enabled = true },
    -- Make f/t/F/T show labels as well
    char = { enabled = true, jump_labels = true },
  },
}

local map = vim.keymap.set
-- map({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash jump' })
map({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash treesitter' })
map('o', 'r', function() require('flash').remote() end, { desc = 'Remote flash' })
map({ 'o', 'x' }, 'R', function() require('flsh').treesitter_search() end, { desc = 'Treesitter search' })
map('c', '<C-s>', function() require('flash').toggle() end, { desc = 'Toggle flash search' })
