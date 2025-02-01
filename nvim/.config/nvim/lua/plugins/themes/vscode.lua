return {
  "askfiy/visual_studio_code",
  priority = 100,
  config = function()
    require("visual_studio_code").setup({
      mode = "dark", -- light or dark
    })
  end,
}
