vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  view_options = { show_hidden = true },
  keymaps = {
    ['<C-h>'] = false, -- default clashes with your window navigation
    ['<C-l>'] = false,
    ['<C-x>'] = { 'actions.select', opts = { horizontal = true } },
    ['q'] = 'actions.close',
  },
}
vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>-', function() require('oil').toggle_float() end, { desc = 'Oil (float)' })

-- Fuzzy-find files in ANY directory, not just the cwd
vim.keymap.set('n', '<leader>sF', function()
  vim.ui.input({ prompt = 'Search dir: ', default = vim.fn.expand '%:p:h' .. '/', completion = 'dir' }, function(dir)
    if dir and dir ~= '' then require('telescope.builtin').find_files { cwd = vim.fn.expand(dir), hidden = true } end
  end)
end, { desc = '[S]earch [F]iles in any directory' })
