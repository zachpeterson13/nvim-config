vim.g.mapleader = " "

local k = vim.keymap

k.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

k.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
k.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

k.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window vertically" })
k.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window horizontally" })
k.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits equal size" })
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current [S]plit" })

k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")

k.set("n", "J", "mzJ`z")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")
