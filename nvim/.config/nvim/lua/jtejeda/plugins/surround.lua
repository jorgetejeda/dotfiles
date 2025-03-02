-- Surrounding element, for example: word -> "word"
-- Keymaps to surround ysiw to select text for ex: word <ysiw>' -> 'word'
-- unroll what we did typing <ds>' or <ds>{ depending of what symbol you add
-- to replace without deleting using <cs><old symbo><new symbol>
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
