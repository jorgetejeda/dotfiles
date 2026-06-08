return {
  "nvim-treesitter/nvim-treesitter",
  version = "^0.9.2", -- Forzamos una versión semántica estable lanzada oficialmente
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate", 
  config = function()
    local install = require("nvim-treesitter.install")
    
    install.ensure_installed = {
      "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
      "prisma", "markdown", "markdown_inline", "svelte", "graphql",
      "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c",
    }
    install.sync_install = false
    install.auto_install = false

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
