-- Multicursor para Neovim.
-- Plugin: mg979/vim-visual-multi (sucesor mantenido del abandonado terryma/vim-multiple-cursors,
-- que lanzaba E1136 por incompatibilidad con los mapeos <Cmd> de Neovim moderno).
-- URL: https://github.com/mg979/vim-visual-multi

return {
  "mg979/vim-visual-multi",
  branch = "master",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    -- Mantiene <C-n> como tecla principal (misma memoria muscular que antes / VS Code).
    vim.g.VM_maps = {
      ["Find Under"] = "<C-n>",
      ["Find Subword Under"] = "<C-n>",
    }
  end,
}
