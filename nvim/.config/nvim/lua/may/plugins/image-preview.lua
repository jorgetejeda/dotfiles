
return {
  "adelarsq/image_preview.nvim",
  event = "VeryLazy",
  config = function()
    require("image_preview").setup({})
    vim.keymap.set(
      "n",
      "<leader>p",
      function()
        local file = vim.fn.expand("%:p")
        if require("image_preview").IsImage(file) then
          require("image_preview").PreviewImage(file)
        else
          vim.notify("Not an image file: " .. file, vim.log.levels.WARN)
        end
      end,
      { desc = "Image preview" }
    )
  end,
}
