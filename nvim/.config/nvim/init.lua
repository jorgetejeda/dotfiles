-- require("jtejeda.core")
-- require("jtejeda.lazy")

-- Shim para Neovim 0.12+: ft_to_lang fue removida, Telescope aún la busca
if vim.treesitter.language.ft_to_lang == nil then
  vim.treesitter.language.ft_to_lang = function(ft)
    return vim.treesitter.language.get_lang(ft)
  end
end

-- May configuration
if vim.g.vscode then
  print("Vscode is working")
else
  require("may.core")
  require("may.lazy")
end
