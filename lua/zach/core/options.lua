local opt = vim.opt

opt.guicursor = "n-v-c-sm:block-Cursor-blinkwait300-blinkon200-blinkoff150,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 8

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

opt.hlsearch = false
opt.incsearch = true

opt.colorcolumn = "80"
