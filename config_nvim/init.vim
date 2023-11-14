set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" neovim specific
call plug#begin(stdpath('data') . '/plugged')

" Conjure
Plug 'Olical/conjure', {'tag': 'v4.3.1'}

" Conjure support - jack-in with nrepl dependencies
Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
" Only in Neovim:
Plug 'radenling/vim-dispatch-neovim'

call plug#end()
