return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = function()
    require("nvim-treesitter.install").install({
      "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
      "prisma", "markdown", "markdown_inline", "svelte", "graphql",
      "bash", "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c",
    }, { summary = true })
  end,
  config = function()
    require("nvim-treesitter").setup()

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        if pcall(vim.treesitter.get_parser, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
