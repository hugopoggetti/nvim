return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Consistent ronding for boders
      -- vim.diagnostic.config({
      --   float = { border = "rounded" },
      -- })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "hls",
          "pyright",
          "lua_ls",
          "asm_lsp",
          "cmake",
          "yamlls",
          "bashls",
          "rust_analyzer",
          "html",
          "zls",
        },
        automatic_installation = true,
      })
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      local global_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities(global_capabilities)

      lspconfig.clangd.setup({
        cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        capabilities = capabilities,
      })
      lspconfig.hls.setup({
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell" },
        root_dir = lspconfig.util.root_pattern("stack.yaml", "cabal.config", ".git"),
        vim.diagnostic.config({ signs = false, update_in_insert = false }),
        views = {
          hover = {
            scrollbar = false,
          },
        },
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern("pyrightconfig.json", "setup.py", "requirements.txt", ".git"),
        vim.diagnostic.config({ signs = false, update_in_insert = false }),
        views = {
          hover = {
            scrollbar = false,
          },
        },
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_dir = lspconfig.util.root_pattern(".git", "init.lua"),
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              path = vim.split(package.path, ";"),
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
        capabilities = capabilities,
      })
      lspconfig.asm_lsp.setup({
        cmd = { "asm-lsp" },
        filetypes = { "asm", "assembly" },
        vim.diagnostic.config({ signs = false, update_in_insert = false }),
        capabilities = capabilities,
      })
      lspconfig.cmake.setup({
        cmd = { "cmake-language-server" },
        filetypes = { "cmake" },
        init_options = {
          buildDirectory = "build",
        },
        root_dir = require("lspconfig").util.root_pattern("CMakeLists.txt"),
        single_file_support = true,
        vim.diagnostic.config({ signs = false, update_in_insert = false }),
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            schemas = {
              kubernetes = "*.k8s.yaml",
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
              ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
            },
            validate = true,
            format = { enable = true },
            completion = true,
          },
        },
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { "sh", "zsh", "bash" },
        vim.diagnostic.config({ signs = false, update_in_insert = false }),
      })
      lspconfig.rust_analyzer.setup({
        cmd = { "rust-analyzer" },
        capabilities = capabilities,
        filetypes = { "rust" },
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = false,
            },
          },
        },
      })
      lspconfig.html.setup({
        cmd = { "vscode-html-language-server", "--stdio" },
        capabilities = capabilities,
        filetypes = { "html", "templ" },
        init_options = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
          provideFormatter = true,
        },
      })
      vim.lsp.enable("zls", {
        cmd = { "zls" },
        filetypes = { "zig", "zir" },
        root_markers = { "zls.json", "build.zig", ".git" },
        workspace_required = false,
      })
      local autocmd = vim.api.nvim_create_autocmd
      autocmd("LspAttach", {
        callback = function(e)
          local opts = { buffer = e.buf }
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, opts)
          vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
          end, opts)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end, opts)
          vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
          vim.keymap.set("n", "<leader>la", function()
            vim.lsp.buf.code_action()
          end, opts)
          vim.keymap.set("n", "<leader>lr", function()
            vim.lsp.buf.rename()
          end, opts)
          vim.keymap.set("n", "<leader>lk", function()
            vim.diagnostic.open_float()
          end, opts)
          vim.keymap.set("n", "<leader>ln", function()
            vim.diagnostic.goto_next()
          end, opts)
          vim.keymap.set("n", "<leader>lp", function()
            vim.diagnostic.goto_prev()
          end, opts)
        end,
      })
    end,
  },
}
