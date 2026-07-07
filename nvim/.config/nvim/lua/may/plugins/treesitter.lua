return {
  "nvim-treesitter/nvim-treesitter",
  version = "^0.9.2", -- Forzamos una versión semántica estable lanzada oficialmente
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- ensure_installed va dentro de configs.setup(): asignarlo como campo de
    -- nvim-treesitter.install sobrescribe una FUNCIÓN del plugin y nunca instala.
    -- auto_install descarga el parser que falte al abrir un filetype (evita el
    -- crash "attempt to index local 'tree' (a nil value)" de Comment.nvim en 0.12).
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "prisma", "markdown", "markdown_inline", "svelte", "graphql",
        "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c",
      },
      sync_install = false,
      auto_install = true,
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local status, parser = pcall(vim.treesitter.get_parser, ev.buf)
        if status and parser then
          vim.treesitter.start(ev.buf)
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
