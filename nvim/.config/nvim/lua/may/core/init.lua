-- Disable LazyVim order check (we're not using LazyVim)
vim.g.lazyvim_check_order = false

-- Shim para compatibilidad con Neovim 0.12 (ft_to_lang fue removido, lo usa telescope)
if vim.treesitter.language and not vim.treesitter.language.ft_to_lang then
  vim.treesitter.language.ft_to_lang = function(ft)
    return vim.treesitter.language.get_lang(ft)
  end
end

require("may.core.options")
require("may.core.keymaps")
