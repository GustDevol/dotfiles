vim.cmd('syn on')
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'

vim.o.clipboard = 'unnamedplus'
vim.o.laststatus = 2
vim.o.backspace = '2'
vim.o.encoding = 'utf-8'
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.magic = true
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.omnifunc = 'syntaxcomplete#Complete'
vim.o.completeopt = 'menu,menuone,noselect'

vim.bo.tabstop = 4
vim.bo.softtabstop = 0
vim.bo.expandtab = true
vim.bo.autoindent = true
vim.bo.smartindent = true
vim.bo.shiftwidth = 4
vim.bo.omnifunc = 'syntaxcomplete#Complete'

-- Colorscheme Gruvbox Config
vim.g.gruvbox_contrast_dark = 'hard'
vim.cmd('colorscheme gruvbox')
vim.o.termguicolors = true
vim.g.background = 'dark'
vim.api.nvim_command[[
    autocmd ColorScheme * highlight Comment cterm=bolditalic gui=bolditalic
]]

-- Turning Syntastic auto checking off
vim.g.syntastic_mode_map = { mode = 'passive', active_filetypes = {}, passive_filetypes = {} }

-- Emmet
vim.g.user_emmet_leader_key=','
vim.g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css,javascript,typescript,htmldjango,jinja.html EmmetInstall')

-- Closetags
vim.g.closetag_filetypes = 'html,xhtml,phtml,js,ts,javascript'
vim.g.closetag_xhtml_filetypes = 'html,xhtml,phtml,js,ts,javascript'

-- Treesitter
-------WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
-------ENDWORKAROUND
