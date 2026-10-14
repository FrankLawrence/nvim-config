-- Build hook: must be registered BEFORE vim.pack.add so it fires on install
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name ~= 'typst-preview.nvim' then return end
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then return end
    if not ev.data.active then vim.cmd.packadd 'typst-preview.nvim' end
    require('typst-preview').update() -- downloads the binaries the plugin needs
  end,
})

vim.pack.add { 'https://github.com/chomosuke/typst-preview.nvim' }
require('typst-preview').setup {}

vim.lsp.config('tinymist', {
  settings = {
    formatterMode = 'typstyle',
    exportPdf = 'onType',
  },
})

vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreviewToggle<CR>', { desc = '[T]ypst [P]review' })
