local M = {}
local remap = vim.api.nvim_set_keymap
local g = vim.g
local npairs = require('nvim-autopairs')

npairs.setup {
    map_bs = false,
    map_cr = false,
    disable_filetype = { 'TelescopePrompt', 'vim' },
}

g.coq_settings = { keymap = { recommended = false } }

if not _G.plugins then
    _G.plugins = {}
end

function M.CR()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.plugins.autopairs.CR()', { expr = true, noremap = true })

function M.BS()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.plugins.autopairs.BS()', { expr = true, noremap = true })

_G.plugins.autopairs = M
