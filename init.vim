call plug#begin('~/.vim/plugged')

" Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Autocompletion
Plug 'jiangmiao/auto-pairs'                      " Auto pairing
Plug 'weirongxu/coc-explorer'     
" File explorer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Basic settings
filetype plugin indent on  " Enable indentation
set tabstop=4              " Set tab width to 4 spaces
set shiftwidth=4           " Set indentation width to 4 spaces
set expandtab              " Use spaces instead of tabs



" Customize completion menu appearance
"highlight CocMenuSel guibg=#5e81ac guifg=#ffffff " Selected completion item (highlighted in blue with white text)
"highlight CocMenu guibg=#2e3440 guifg=#d8dee9 " Background of the completion menu (dark with light text)
"highlight CocPumHighlight guibg=#3b4252 guifg=#88c0d0 " Popup menu highlight (light blue text on dark background)


" Keybinding for CocExplorer commands
nnoremap <silent> <C-e> :CocCommand explorer<CR>      "Open explorer
"Resize the explorer window (increase/decrease size)
nnoremap <silent> <C-Right> :wincmd > <CR>  " Increase window size
nnoremap <silent> <C-Left> :wincmd < <CR>   " Decrease window size

" Close the explorer window (using buffer delete)
nnoremap <silent> <C-c> :q<CR>   " Press Ctrl-c to close the explorer window

" Map Tab to confirm autocompletion if popup menu is visible
inoremap <silent><expr> <Tab> pumvisible() ? coc#pum#confirm() : "\<Tab>"


" Enable Treesitter for supported languages
syntax enable
set runtimepath+=~/.vim/plugged/nvim-treesitter

" Enable Treesitter parsers
autocmd FileType * :TSBufEnable highlight

set termguicolors

"colorscheme industry


