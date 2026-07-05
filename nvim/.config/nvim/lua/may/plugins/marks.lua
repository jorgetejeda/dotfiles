-- Nota: para cerrar una ventana emergente de preview, se debe usar ctrl+w c, ya que no se puede usar <esc> para salir de la ventana emergente.
return {
  "chentoast/marks.nvim",
  config = function()
    require("marks").setup({
      disable_mappings = false,
      mappings = {
        toggle = "mm",
        set_next = "mm",
        next = "mn",
        prev = "mp",
        preview = false, -- desactiva el preview por defecto para usar el nuestro
        delete_buf = "md",
      },
    })

    vim.keymap.set("n", "mi", function()
      vim.api.nvim_echo({ { "pulsa la letra de la marca, <esc> para salir" } }, false, {})
      local ok, char = pcall(vim.fn.getcharstr)
      vim.api.nvim_echo({ { "" } }, false, {})
      if not ok or char == "\27" then return end -- <esc>

      local pos = vim.fn.getpos("'" .. char)
      if pos[2] == 0 then return end

      local W, H = vim.api.nvim_win_get_width(0), vim.api.nvim_win_get_height(0)
      local w, h = math.floor(W * 0.85), math.floor(H * 0.85)
      vim.api.nvim_open_win(pos[1], true, {
        relative = "win",
        win = 0,
        width = w,
        height = h,
        col = math.floor((W - w) / 2),
        row = math.floor((H - h) / 2),
        border = "rounded",
      })
      vim.cmd("normal! `" .. char)
      vim.cmd("normal! zz")
    end, { desc = "Preview mark (ventana grande)" })
  end,
}

