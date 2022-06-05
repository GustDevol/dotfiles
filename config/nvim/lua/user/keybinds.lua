local opts = {noremap = true}

local keymap = vim.api.nvim_set_keymap

-- Remap Space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap( "", "<F6>",  ":source ~/.config/nvim/init.vim<CR>", opts)
keymap( "", "<F4>",  ":e ~/.config/nvim/init.vim<CR>", opts)
keymap( "", "<F9>",  ":w<CR>", opts)
keymap( "", "<Del>", "dl", opts)
keymap( "", ";,",    ":tabp<CR>", opts)
keymap( "", ";.",    ":tabn<CR>", opts)

keymap("n", "<C-w>E",     ":SyntasticCheck<CR>", opts)
keymap("n", "<leader>t",  ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>g", ":Gitsigns toggle_signs<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns toggle_numhl<CR>", opts)
keymap("n", "<leader>gl", ":Gitsigns toggle_linehl<CR>", opts)
keymap("n", ",tg",        ":!ctags -R .<CR><CR>" , {})
keymap("n", ",mk",        ":!make", {})
keymap("n", ",ga",        ":G add", opts)
keymap("n", ",gm",        ":G commit -S -m \"\"<LEFT>", opts)
keymap("n", ",gP",        ":G push<CR>", opts)
keymap("n", ",gp",        ":G pull<CR>", opts)

keymap("i", "<C-b>",      "<C-x><C-o>", opts)

-- Move Text
-- lines up/dowm ( Normal Mode )
keymap("n", "<C-j>", ":m .+1<CR>", opts)
keymap("n", "<C-k>", ":m .-2<CR>", opts)
-- char left/right ( Normal Mode )
keymap("n", "<C-h>", "dlhP", opts)
keymap("n", "<C-l>", "dlp", opts)
-- selected up/dowm ( Visual Mode )
keymap("v", "<C-j>", ":m '>+1<CR>gv", opts)
keymap("v", "<C-k>", ":m '<-2<CR>gv", opts)
-- equally selected block left/right ( Visual Mode )
keymap("v", "<C-h>", "dhPgvhoho", opts)
keymap("v", "<C-l>", "dpgvlolo", opts)
