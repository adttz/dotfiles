local nvchad_lsp = require "nvchad.configs.lspconfig"

nvchad_lsp.defaults()

-- Web dev: html, cssls, tsserver (JS/TS), jsonls (JSON), eslint (linting)
-- Python/FastAPI: pyright
-- C/C++: clangd
local servers = { "html", "cssls", "ts_ls", "jsonls", "eslint", "pyright", "clangd", "yamlls" }

for _, server in ipairs(servers) do
  local opts = {
    on_attach = nvchad_lsp.on_attach,
    capabilities = nvchad_lsp.capabilities,
  }

  -- fix HTML "Property" issue
  if server == "html" then
    opts.on_attach = function(client, bufnr)
      -- disable semantic tokens
      client.server_capabilities.semanticTokensProvider = nil
      nvchad_lsp.on_attach(client, bufnr)
    end
  end

  -- Python/FastAPI: pyright with type-checking and venv-friendly settings
  if server == "pyright" then
    opts.settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
          useLibraryCodeForTypes = true,
        },
      },
    }
  end

  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end
