return {
  "windwp/nvim-ts-autotag",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "tsx", "jsx", "svelte", "vue", "xml" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
