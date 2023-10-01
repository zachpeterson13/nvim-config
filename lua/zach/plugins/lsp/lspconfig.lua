return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			local wk = require("which-key")

			local prefix = "<leader>l"

			wk.register({
				[prefix] = { name = "[L]sp, Linter, and Formatter" },
				[prefix .. "a"] = { vim.lsp.buf.code_action, "Code [A]ctions" },
				[prefix .. "r"] = { ":LspRestart<CR>", "[R]estart Lsp" },
				[prefix .. "n"] = { vim.lsp.buf.rename, "Smart Re[n]ame" },
				-- Telescope related keybinds
				[prefix .. "f"] = { name = "[F]ind in Telescope" },
				[prefix .. "fr"] = { "<cmd>Telescope lsp_references<CR>", "Show Lsp [R]eferences" },
				[prefix .. "fi"] = { "<cmd>Telescope lsp_implementations<CR>", "Show Lsp [I]mplementations" },
				[prefix .. "ft"] = { "<cmd>Telescope lsp_type_definitions<CR>", "Show Lsp [T]ype definitions" },
				[prefix .. "fd"] = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer [D]iagnostics" },
			})

			-- set keybinds
			opts.desc = "Go to declaration"
			keymap.set("n", "gd", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = true,
					check = {
						command = "clippy",
						features = "all",
					},
				},
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
