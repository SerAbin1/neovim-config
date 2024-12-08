call plug#begin('~/.local/share/nvim/plugged')
Plug 'dense-analysis/ale'
call plug#end()

" Enable linting on save and while typing
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'

" Specify linters for C and C++
let g:ale_linters = {
    \ 'c': ['gcc', 'clang', 'clangtidy', 'cppcheck'],
    \ 'cpp': ['g++', 'clang', 'clangtidy', 'cppcheck'],
    \ }

" Set clang-tidy as the primary linter for advanced checks
let g:ale_c_clangtidy_options = '-checks=*'
let g:ale_cpp_clangtidy_options = '-checks=*'

" Enable automatic fixes using clang-format or other formatters
let g:ale_fixers = {
    \ 'c': ['clang-format'],
    \ 'cpp': ['clang-format'],
    \ }
let g:ale_fix_on_save = 1

call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Map Tab to confirm autocompletion if popup menu is visible
inoremap <silent><expr> <Tab> pumvisible() ? coc#pum#confirm() : "\<Tab>"


" Automatically insert closing curly brace without moving to a new line
inoremap { {}<Left>

" Correct indentation when pressing Enter inside curly braces
inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>" : getline('.') =~ '{.*}' && col('.') == match(getline('.'), '{') + 2 ? "\<CR>\<Esc>O" : "\<CR>"

" Automatic pairing for other brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i

" Indentation settings
set smartindent
set cindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin indent on


" Customize completion menu appearance
highlight CocMenuSel guibg=#5e81ac guifg=#ffffff " Selected completion item (highlighted in blue with white text)
highlight CocMenu guibg=#2e3440 guifg=#d8dee9 " Background of the completion menu (dark with light text)
highlight CocPumHighlight guibg=#3b4252 guifg=#88c0d0 " Popup menu highlight (light blue text on dark background)
