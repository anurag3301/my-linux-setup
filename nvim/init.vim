colorscheme molokai
syntax on
highlight Comment cterm=bold
set encoding=UTF-8
set number                  " Enable number line

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/AutoComplPop'
Plug 'itchyny/lightline.vim'
Plug 'vim-python/python-syntax'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'anurag3301/vimsence'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
"Plug 'mhinz/vim-startify'
Plug 'glepnir/dashboard-nvim'
Plug 'chrisbra/Colorizer'
call plug#end()

" Extra to c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

