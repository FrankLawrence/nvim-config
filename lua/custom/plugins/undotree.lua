vim.pack.add { 'https://github.com/mbbill/undotree' }

vim.g.undotree_SetFocusWhenToggle = 1 -- focus the tree when it opens
vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo tree' })
