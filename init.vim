
set tabstop=4 softtabstop=4
set shiftwidth=4
set exrc
set guicursor
set relativenumber
set hidden
set noerrorbells
set expandtab
set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set colorcolumn=80

" Plug ins

call plug#begin('~/.vim/plugged')

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Colour schemes
Plug 'gruvbox-community/gruvbox'


call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Turn off highlighting after a search.

nmap <silent> <space>/  :let @/ = ""<CR>

let mapleader=" "
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup REED
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
