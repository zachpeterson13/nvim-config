return {
    "nvim-telescope/telescope.nvim", tag = '0.1.2',
    dependencies = { "nvim-lua/plenary.nvim"},
    config = function()
        local wk = require("which-key")
        local prefix = "<leader>f"

        wk.register({
            [prefix] = { name = "[F]ind"},
            [prefix .. "f"] = { "<cmd>Telescope find_files<cr>", "[F]ind [F]iles" },
            [prefix .. "g"] = { "<cmd>Telescope live_grep<cr>", "[F]ind [G]rep" },
            [prefix .. "b"] = { "<cmd>Telescope buffers<cr>", "[F]ind [B]uffers" },
            [prefix .. "h"] = { "<cmd>Telescope help_tags<cr>", "[F]ind [H]elp" },
        })
    end,
}
