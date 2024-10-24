--[[
Author: yjy 3253932102@qq.com
Date: 2024-10-24 22:20:41
LastEditors: yjy 3253932102@qq.com
LastEditTime: 2024-10-24 22:25:09
FilePath: /dotfiles/nvim/lua/plugins/markview.lua
Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
--]]
return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    opt = function()
      require("markview").setup({
        -- Buffer types to ignore
        buf_ignore = { "nofile" },
        -- Delay, in miliseconds
        -- to wait before a redraw occurs(after an event is triggered)
        debounce = 50,
        -- Filetypes where the plugin is enabled
        filetypes = { "markdown", "quarto", "rmd" },
        -- Highlight groups to use
        -- "dynamic" | "light" | "dark"
        highlight_groups = "dynamic",
        -- Modes where hybrid mode is enabled
        hybrid_modes = nil,
        -- Tree-sitter query injections 折叠
        injections = {
          languages = {
            markdown = {
              --- This disables other
              --- injected queries!
              overwrite = true,
              query = [[
                    (section
                        (atx_headng) @injections.mkv.fold
                        (#set! @fold))
                ]],
            },
          },
        },
        -- Initial plugin state,
        -- true = show preview
        -- falss = don't show preview
        initial_state = true,
        -- Max file size that is rendered entirely
        max_file_length = 1000,
        -- Modes where preview is shown
        modes = { "n", "no", "c" },
        -- Lines from the cursor to draw when the
        -- file is too big
        render_distance = 100,
        -- Window configuration for split view
        split_conf = {},

        latex = {
          enable = true,

          --- Bracket conceal configuration.
          --- Shows () in specific cases
          brackets = {
            enable = true,

            --- Highlight group for the ()
            ---@type string
            hl = "@punctuation.brackets",
          },

          --- LaTeX blocks renderer
          block = {
            enable = true,

            --- Highlight group for the block
            ---@type string
            hl = "Code",

            --- Virtual text to show on the bottom
            --- right.
            --- First value is the text and second value
            --- is the highlight group.
            ---@type string[]
            text = { " LaTeX ", "Special" },
          },

          --- Configuration for inline LaTeX maths
          inline = {
            enable = true,
          },

          --- Configuration for operators(e.g. "\frac{1}{2}")
          operators = {
            enable = true,
            configs = {
              sin = {
                --- Configuration for the extmark added
                --- to the name of the operator(e.g. "\sin").
                ---
                --- see `nvim_buf_set_extmark()` for all the
                --- options.
                ---@type table
                operator = {
                  conceal = "",
                  virt_text = { { "𝚜𝚒𝚗", "Special" } },
                },

                --- Configuration for the arguments of this
                --- operator.
                --- Item index is used to apply the configuration
                --- to a specific argument
                ---@type table[]
                args = {
                  {
                    --- Extmarks are only added
                    --- if a config for it exists.

                    --- Configuration for the extmark
                    --- added before this argument.
                    ---
                    --- see `nvim_buf_set_extmark` for more.
                    before = {},

                    --- Configuration for the extmark
                    --- added after this argument.
                    ---
                    --- see `nvim_buf_set_extmark` for more.
                    after = {},

                    --- Configuration for the extmark
                    --- added to the range of text of
                    --- this argument.
                    ---
                    --- see `nvim_buf_set_extmark` for more.
                    scope = {},
                  },
                },
              },
            },
          },

          --- Configuration for LaTeX symbols.
          symbols = {
            enable = true,

            --- Highlight group for the symbols.
            ---@type string?
            hl = "@operator.latex",

            --- Allows adding/modifying symbol definitions.
            overwrite = {
              --- Symbols can either be strings or functions.
              --- When the value is a function it receives the buffer
              --- id as the parameter.
              ---
              --- The resulting string is then used.
              ---@param buffer integer.
              today = function(buffer)
                return os.date("%d %B, %Y")
              end,
            },

            --- Create groups of symbols to only change their
            --- appearance.
            groups = {
              {
                --- Matcher for this group.
                ---
                --- Can be a list of symbols or a function
                --- that takes the symbol as the parameter
                --- and either returns true or false.
                ---
                ---@type string[] | fun(symbol: string): boolean
                match = { "lim", "today" },

                --- Highlight group for this group.
                ---@type string
                hl = "Special",
              },
            },
          },

          subscript = {
            enable = true,

            hl = "MarkviewLatexSubscript",
          },

          superscript = {
            enable = true,

            hl = "MarkviewLatexSuperscript",
          },
        },
      })
    end,
  },
}
