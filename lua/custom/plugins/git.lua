vim.pack.add {
  'https://github.com/kdheepak/lazygit.nvim', -- needs the `lazygit` binary installed; plenary is already present
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/sindrets/diffview.nvim', -- optional: review all changes / file history
}

local map = vim.keymap.set
map('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })
map('n', '<leader>gf', '<cmd>LazyGitCurrentFile<CR>', { desc = 'LazyGit current [F]ile' })
map('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Fugitive [S]tatus' })
map('n', '<leader>gd', '<cmd>Gvdiffsplit<CR>', { desc = '[D]iff file vs index' })
map('n', '<leader>gB', '<cmd>Git blame<CR>', { desc = 'Fugitive [B]lame' })
map('n', '<leader>gl', '<cmd>Git log --oneline<CR>', { desc = '[L]og' })
map('n', '<leader>gD', '<cmd>DiffviewOpen<CR>', { desc = 'Diffview open' })
map('n', '<leader>gH', '<cmd>DiffviewFileHistory %<CR>', { desc = 'File [H]istory' })

require('which-key').add { { '<leader>g', group = '[G]it', mode = { 'n', 'v' } } }
