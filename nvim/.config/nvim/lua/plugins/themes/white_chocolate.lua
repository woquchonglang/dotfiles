return {
  "EtiamNullam/white-chocolate.nvim",
  dependencies = { "RRethy/nvim-base16" },
  opt = function()
    require("white-chocolate").setup({
      apply_colorscheme = true,
      invert_visual = false,
      invert_selection = true,
      tweak_nontext = true,
      tweak_float = true,
      tweak_matchparen = true,
    })
  end,
}
