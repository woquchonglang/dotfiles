-- onedarkpro
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first

  config = function()
    require("onedarkpro").setup({
      colors = {},
      highlights = {

        Error = { fg = "#FF0000", bg = "#FFFF00", italic = true },
        Comment = { italic = true },
        Directory = { bold = true },
        ErrorMsg = { italic = true, bold = true },
      },

      styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "italic",
        operators = "NONE",
        variables = "NONE",
        parameters = "NONE",
        conditionals = "italic",
        virtual_text = "NONE",
      },
    })
  end,
}
