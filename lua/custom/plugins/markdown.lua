vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name ~= 'markdown-preview.nvim' then return end
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then return end
    if not ev.data.active then vim.cmd.packadd 'markdown-preview.nvim' end
    vim.fn['mkdp#util#install']() -- downloads/builds the preview server (needs node)
  end,
})

vim.pack.add {
  'https://github.com/iamcco/markdown-preview.nvim',
  'https://github.com/OXY2DEV/markview.nvim',

  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
  -- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
  -- 'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}
-- require('render-markdown').setup({})
require('markview').setup {
  preview = {
    enable = false,
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function(ev)
    local map = function(lhs, rhs, desc) vim.keymap.set('n', lhs, rhs, { buffer = ev.buf, desc = desc }) end
    map('<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', '[M]arkdown [P]review (browser)')
    map('<leader>mv', '<cmd>Markview toggle<CR>', '[M]arkdown [V]iew (inline)')
    map('<leader>mr', '<cmd>RenderMarkdown toggle<CR>', '[M]arkdown [R]ender (inline)')
  end,
})

require('which-key').add { { '<leader>m', group = '[M]arkdown' } }
