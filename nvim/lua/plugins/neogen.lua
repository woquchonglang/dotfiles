return {
  "danymat/neogen",
  config = true,
  require("neogen").setup({
    languages = {
      ["cpp.doxygen"] = require("neogen.configurations.cpp"),
    },
  }),
  -- Uncomment next line if you want to follow only stable versions
  -- version = "2.19.3",
}
