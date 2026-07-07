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
    local ts_pre_hook = ts_context_commentstring.create_pre_hook()

    -- En Neovim 0.12 vim.treesitter.get_parser devuelve nil (sin lanzar) para
    -- filetypes sin parser (.env, etc.); Comment.nvim no lo protege y crashea con
    -- "[Comment.nvim] nil". Si hay parser, usamos el contexto de treesitter
    -- (jsx/tsx/svelte); si no, devolvemos el commentstring nativo del buffer.
    local function pre_hook(ctx)
      local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
      if ok and parser then
        return ts_pre_hook(ctx)
      end
      local native = vim.bo.commentstring
      if native and native ~= "" then
        return native
      end
    end

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = pre_hook,
    })

    -- Alias <leader>gc además de los gcc/gc nativos: reutiliza los <Plug> del plugin
    local keymap = vim.keymap
    keymap.set("n", "<leader>gc", "<Plug>(comment_toggle_linewise_current)", { desc = "Comentar línea actual" })
    keymap.set("x", "<leader>gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comentar selección" })
  end,
}
