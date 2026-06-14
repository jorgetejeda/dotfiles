return {
  "folke/twilight.nvim",
  lazy = false,
  opts = {
    dimming = { alpha = 0.25 },
    context = 15,
    expand = {
      "function_declaration",
      "function_expression",
      "arrow_function",
      "method_definition",
      "class_declaration",
      "class_body",
      "export_statement",
      "if_statement",
      "for_statement",
      "while_statement",
      "table_constructor",
    },
  },
  config = function(_, opts)
    require("twilight").setup(opts)

    local view = require("twilight.view")
    local orig_get_node = view.get_node
    view.get_node = function(buf, pos)
      local ok, result = pcall(orig_get_node, buf, pos)
      if not ok then return nil end
      return result
    end
  end,
  keys = {
    { "<leader>tw", "<cmd>Twilight<CR>", desc = "Toggle Twilight dimming" },
  },
}
