return {
    'stevearc/oil.nvim',
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>e"] = { "<CMD>Oil<CR>", "Open file exporer"},
        })
        require("oil").setup()
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
