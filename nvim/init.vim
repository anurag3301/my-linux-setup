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
Plug 'Lenovsky/nuake'
call plug#end()

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

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

set clipboard=unnamedplus       " For using global clipboard
let &t_ut=''                    " Kitty colour issue fix
