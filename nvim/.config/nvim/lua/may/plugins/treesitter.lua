return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  -- CORREGIDO: Usamos el comando estándar de actualización
  build = ":TSUpdate", 
  config = function()
    -- CORREGIDO: El setup se ejecuta sobre .configs, no sobre el módulo principal
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      -- Pasamos tu lista de lenguajes aquí, que es la forma oficial y segura
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "prisma", "markdown", "markdown_inline", "svelte", "graphql",
        "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true, -- Activa el coloreado inteligente de Treesitter
      },
      indent = {
        enable = true, -- Activa el indentado nativo de Treesitter
      },
    })

    -- Tu autocmd personalizado se mantiene perfectamente
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        if pcall(vim.treesitter.get_parser, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
