return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    -- Deshabilitar Tab de copilot para no conflictuar con nvim-cmp
    vim.g.copilot_no_tab_map = true

    vim.keymap.set("i", "<C-l>", 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion",
    })
    vim.keymap.set("i", "<C-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
    vim.keymap.set("i", "<C-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
    vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
  end,
}
