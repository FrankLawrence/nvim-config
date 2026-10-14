vim.pack.add { 'https://github.com/folke/trouble.nvim' }

require('trouble').setup {
  focus = true, -- focus the Trouble window when it opens
}

require('which-key').add { { '<leader>x', group = 'Trouble / diagnostics' } }

local map = vim.keymap.set
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics (workspace)' })
map('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Diagnostics (current buffer)' })
map('n', '<leader>xs', '<cmd>Trouble symbols toggle focus=false<CR>', { desc = 'Document symbols outline' })
map('n', '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<CR>', { desc = 'LSP defs/refs/etc. for word under cursor' })
map('n', '<leader>xL', '<cmd>Trouble loclist toggle<CR>', { desc = 'Location list' })
map('n', '<leader>xQ', '<cmd>Trouble qflist toggle<CR>', { desc = 'Quickfix list' })
