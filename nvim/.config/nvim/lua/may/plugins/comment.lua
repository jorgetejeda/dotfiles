-- Description:
-- Comment plugin configuration
-- key mappings:
-- NORMAL MODE
-- gcc: comment line
-- gc: comment visual selection
return {
  "numToStr/Comment.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    -- Alias <leader>gc además de los gcc/gc nativos: reutiliza los <Plug> del plugin
    local keymap = vim.keymap
    keymap.set("n", "<leader>gc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comentar línea actual" })
    keymap.set("x", "<leader>gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comentar selección" })
  end,
}
