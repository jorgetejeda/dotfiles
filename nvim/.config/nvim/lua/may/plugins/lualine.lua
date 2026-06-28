-- Status line

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = {
    "arkav/lualine-lsp-progress",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      section_separators = "",
      component_separators = "",
      globalstatus = true,
      theme = 'auto',
      -- theme = {
      --   normal = {
      --     a = "StatusLine",
      --     b = "StatusLine",
      --     c = "StatusLine",
      --   },
      -- },
    },
    sections = {
      lualine_a = {
        "mode",
      },
      lualine_b = {
        "branch",
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
        },
        -- --- CORRECCIÓN DE DEPRECATION: buf_get_clients -> get_clients ---
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          return "󰅭 " .. vim.pesc(tostring(#clients) or "0")
        end,
        { "diagnostics", sources = { "nvim_diagnostic" } },
      },
      lualine_c = {
        "filename",
      },
      lualine_x = {
        -- Protegido con función para evitar colisiones en la carga inicial de Lazy
        {
          function() return require("lazy.status").updates() end,
          cond = function() return require("lazy.status").has_updates() end,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {
        "filetype",
        "encoding",
        "fileformat",
        '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
      },
      lualine_z = {
        "searchcount",
        "selectioncount",
        "location",
        "progress",
      },
    },
  },
}
