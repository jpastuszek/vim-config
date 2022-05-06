-- Rust LSP
-- nvim_lsp object
local nvim_lsp = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if vim.fn.executable('rust-analyzer') == 1 then
	-- Enable rust_analyzer
	nvim_lsp.rust_analyzer.setup({
		capabilities=capabilities,
		-- on_attach is a callback called when the language server attachs to the buffer
		-- on_attach = on_attach,
		settings = {
		  -- to enable rust-analyzer settings visit:
		  -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
		  --["rust-analyzer"] = {
			-- enable clippy diagnostics on save
			-- checkOnSave = {
			  -- command = "clippy"
			-- },
		 -- }
		}
	})
end

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	signs = true,
	update_in_insert = true,
  }
)
