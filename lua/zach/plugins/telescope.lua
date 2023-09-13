return {
    "nvim-telescope/telescope.nvim", tag = '0.1.2',
    dependencies = { 
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup()

        telescope.load_extension("fzf")

        local wk = require("which-key")
        local prefix = "<leader>f"

        wk.register({
            [prefix] = { name = "[F]ind"},
            [prefix .. "f"] = { "<cmd>Telescope find_files<cr>", "[F]ind [F]iles" },
            [prefix .. "g"] = { "<cmd>Telescope live_grep<cr>", "[F]ind [G]rep" },
            [prefix .. "s"] = { "<cmd>Telescope grep_string<cr>", "[F]ind [S]ring" },
            [prefix .. "b"] = { "<cmd>Telescope buffers<cr>", "[F]ind [B]uffers" },
            [prefix .. "h"] = { "<cmd>Telescope help_tags<cr>", "[F]ind [H]elp" },
            [prefix .. "r"] = { "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent" },
        })
    end,
}
