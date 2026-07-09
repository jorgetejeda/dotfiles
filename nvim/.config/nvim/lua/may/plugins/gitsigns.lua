-- install lazy git using brew
-- brew install lazygit
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500,
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Blame
      map("n", "<leader>gb", gs.blame_line, "Blame current line (float)")
      map("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame current line (full commit)")
      map("n", "<leader>gbl", gs.blame, "Blame panel (navigate commits)")

      -- Hunks (movidos de <leader>h a <leader>g para liberar teclas de harpoon)
      map("n", "<leader>gn", gs.next_hunk, "Next git hunk")
      map("n", "<leader>gN", gs.prev_hunk, "Prev git hunk")
      map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
    end,
  },
}
