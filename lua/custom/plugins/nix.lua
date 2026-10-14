-- Server binary comes from Nix, so don't add it to the Mason `servers` table in init.lua
vim.lsp.config('nixd', {
  settings = {
    nixd = {
      formatting = { command = { 'nixfmt' } }, -- or 'alejandra' / 'nixpkgs-fmt'
    },
  },
})
vim.lsp.enable 'nixd'

-- Alternative: lighter server
-- vim.lsp.enable 'nil_ls'
