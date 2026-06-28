return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
  -- --- AGREGA EL BLOQUE CONFIG AQUÍ ---
  config = function()
    -- Creamos un grupo de autocomandos para interceptar la terminal de lazygit
    local lazygit_colors = vim.api.nvim_create_augroup("LazyGitColors", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "lazygit", -- Se activa en caliente cuando se dibuja el buffer de lazygit
      group = lazygit_colors,
      callback = function()
        -- 1. Extraemos de forma segura el color sólido de Gruvbox
        local ok, gruvbox_palette = pcall(require, "gruvbox.palette")
        local bg_solid = 0x282828 -- Fallback si el tema no ha expuesto su API (#282828)

        if ok and gruvbox_palette then
          local colors = gruvbox_palette.get_colors()
          -- Convertimos el HEX string (#282828) a formato numérico de Neovim
          bg_solid = tonumber(colors.dark0:gsub("#", "0x")) or bg_solid
        end

        -- 2. Definimos los nombres de los grupos de resaltado opacos
        vim.api.nvim_set_hl(0, "LazyGitNormal", { bg = bg_solid })
        vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = bg_solid, bg = bg_solid })

        -- 3. Le ordenamos a la ventana actual de la terminal mutar a estos colores opacos
        vim.cmd("setlocal winhl=Normal:LazyGitNormal,FloatBorder:LazyGitBorder")
      end,
    })
  end,
}
