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
      cmake = {
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
      },
      clangd = {
        keys = {
          { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            -- "Makefile",
            -- "configure.ac",
            -- "configure.in",
            -- "config.h.in",
            -- "meson.build",
            -- "meson_options.txt",
            -- "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern(
            "build/compile_commands.json"
            -- "compile_flags.txt"
          )(fname) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-8" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--pretty",
          "--all-scopes-completion",
          "--header-insertion=iwyu", -- stdlib / never / iwyu
          "--completion-style=bundled", --更详细的补全内容
          "--function-arg-placeholders=false",
          "--fallback-style=llvm", --找不到 .clang-format 文件时，默认应用的 clang-format 风格
          "--compile-commands-dir=build",
          "--all-scopes-completion", -- 全局补全
          "--pch-storage=memory", --预编译头文件存储在内存中以加快速度
          "--query-driver=/home/yjy/apps/arm-gnu-toolchain/bin/arm-none-eabi*",
          -- "--query-driver=/home/yjy/apps/ATfE-20.1.0-Linux-x86_64/bin/*",
          -- "--resource-dir=/usr/lib/llvm-14/lib/clang/14.0.0",
          -- "--include-directory=/usr/include/c++/11",
          -- "--include-directory=/usr/include",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          InlayHints = false,
        },
        filetypes = { "c", "cpp", "h", "hpp" }, -- 只处理这些文件类型
      },
    },

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
