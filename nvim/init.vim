colorscheme molokai
syntax on
highlight Comment cterm=bold
set encoding=UTF-8
set number                  " Enable number line

call plug#begin('~/.vim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'itchyny/lightline.vim'
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'glepnir/dashboard-nvim'
call plug#end()

" Extra to c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
highlight Directory ctermfg=42

let g:python_highlight_all = 1  " Enable python syntax highlighting

map <F7> :NERDTreeToggle<CR>

" Shortcut for code running and Executing test cases for competitive programming
" Detial readup https://medium.com/@akashrrao/how-i-use-vim-for-competitive-programming-1f0fc96682e0
autocmd FileType cpp nnoremap     <leader>rr    :!g++ -g --std=c++17 % -o %:r && ./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in *.test; do echo "\nTEST: $f"; ./%:r < $f; done<CR>
autocmd FileType c nnoremap     <leader>rr    :!gcc -g % -o %:r && ./%:r<CR>
autocmd FileType python nnoremap     <leader>rr    :!python %:r.py<CR>
autocmd FileType python nnoremap     <leader>rt    :!for f in *.test; do echo "\nTEST: $f"; python %:r.py < $f; done<CR>

set clipboard=unnamedplus       " For using global clipboard
let &t_ut=''                    " Kitty colour issue fix
