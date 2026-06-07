return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Creamos el color morado de DMQ Tech Labs para NeoVim
    vim.api.nvim_set_hl(0, "DMQPurple", { fg = "#8E5BE1", bold = true })

    -- Set header (El logo masivo y tupido de DMQ TECH LABS)
    dashboard.section.header.val = {
      "                                                  ",
      "  ████████▄    ███▄           ▄███      █████████▄   ",
      "  ███    ▀██▄  █████▄       ▄█████    ███▀      ▀██▄ ",
      "  ███     ███  ███ ▀██▄   ▄██▀ ███   ███          ███",
      "  ███     ███  ███   ▀██▄██▀   ███   ███          ███",
      "  ███     ███  ███     ██▀     ███   ███          ███",
      "  ███    ▄██▀  ███             ███    ███▄      ▄██▀ ",
      "  ████████▀    ███             ███      █████████▀   ",
      "                                                ▀██▄ ",
      "               T E C H   L A B S                  ▀▀ ",
      "                                                  ",
    }

    -- Aplicamos el color morado DMQ al header
    dashboard.section.header.opts.hl = "DMQPurple"

    -- Set menu (Mantenemos tus mismos keymaps de Telescope, NvimTree y Autocomandos)
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
