return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local wk = require("which-key")

        local prefix = "<leader><leader>"

        wk.register({
            [prefix] = { name = "+Harpoon" },
            [prefix .. "a"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon [A]dd" },
            [prefix .. "e"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Open harpoon menu" },
            [prefix .. "j"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Navigate to file 1" },
            [prefix .. "k"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Navigate to file 2" },
            [prefix .. "l"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Navigate to file 3" },
            [prefix .. ";"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Navigate to file 4" },
        })
    end,
}
