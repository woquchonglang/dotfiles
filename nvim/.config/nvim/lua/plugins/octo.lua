return {
  "pwntester/octo.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "folke/snacks.nvim",
  },
  config = function()
    require("octo").setup()
  end,
}
