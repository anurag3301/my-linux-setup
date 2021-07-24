colorscheme molokai
syntax on
highlight Comment cterm=bold
set encoding=UTF-8

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
