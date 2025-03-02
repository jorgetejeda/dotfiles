local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "jtejeda.plugins" }, { import = "jtejeda.plugins.lsp" } }, {
  checker = {
    enabled = true, -- check if plugins need update
    notify = false, -- don't notify with message
  },
  change_detection = {
    notify = false, -- disabled, don't show greeter message everytime we save a new plugin
  }
})
