local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
  Copilot = "",
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern(
            "cmake-build-debug/compile_commands.json",
            "compile_flags.txt"
          )(fname) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-8" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--compile-commands-dir=cmake-build-debug",
          "--query-driver=/home/yjy/apps/arm-gnu-toochain/bin/arm-none-eabi-gcc",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          InlayHints = false,
        },
      },
    },

    -- snippet = {
    --   expand = function(args)
    --     vim.fn["UltiSnips#Anon"](args.body)
    --   end,
    -- },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,

      texlab = function(_, opts)
        opts.treesitter = {
          ensure_installed = { "latex" },
          highlight = {
            enable = true,
          },
        }
      end,

      sources = {
        -- Copilot Source
        { name = "copilot", group_index = 2 },
        -- Other Sources
        { name = "nvim_lsp", group_index = 2 },
        { name = "path", group_index = 2 },
        { name = "luasnip", group_index = 2 },
      },
    },
  },

  -- config = function()
  --   require("cmp").setup({
  --     -- formatting = {
  --     format = function(entry, vim_item)
  --       -- Kind icons
  --       vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
  --       -- Source
  --       vim_item.menu = ({
  --         buffer = "[Buffer]",
  --         nvim_lsp = "[LSP]",
  --         luasnip = "[LuaSnip]",
  --         nvim_lua = "[Lua]",
  --         latex_symbols = "[LaTeX]",
  --       })[entry.source.name]
  --       return vim_item
  --     end,
  --     -- },
  --   })
  -- end,
}
