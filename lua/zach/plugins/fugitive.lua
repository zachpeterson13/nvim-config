return {
    "tpope/vim-fugitive",
    config = function()
        local wk = require("which-key")

        local prefix = "<leader>g"

        wk.register({
            [prefix] = { name = "[G]it"},
            [prefix .. "s"] = { "<cmd>Git<cr>", "[G]it [S]tart"}
        })
    end,
}
