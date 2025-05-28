return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "vimls", "pylsp", "ruff" }, --"pyright"
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    lazy = false,
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- lspconfig.pylsp.setup({ capabilities = capabilities })
      --lspconfig.ruff.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pylint = { enabled = false },
              yapf = { enabled = false },
              autopep8 = { enabled = false },
              flake8 = { enabled = false },
              pydocstyle = { enabled = false },
              preload = { enabled = false }, -- optional
            },
          },
        },
      })

      lspconfig.marksman.setup({
        capabilities = capabilities,
      })
      -- 	-- Pyright (IntelliSense only — diagnostics disabled)
      -- 	lspconfig.pyright.setup({
      -- 		capabilities = capabilities,
      -- 		handlers = {
      -- 			["textDocument/publishDiagnostics"] = function() end,
      -- 		},
      -- 	})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
