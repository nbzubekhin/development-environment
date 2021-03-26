#!/bin/bash

make_config_file_tmux() {

cat > ~/.tmux.conf <<- "EOF"
set -g default-terminal "xterm-256color"
EOF

}

make_config_file_vim() {

cat > ~/.vimrc <<- "EOF"
filetype plugin indent on
set encoding=utf-8
set nocompatible
syntax enable
set number
set cursorline

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'skywind3000/asyncrun.vim'
Plug 'rhysd/vim-clang-format'
call plug#end()

set t_Co=256
set term=screen-256color
colorscheme sublimemonokai

" Whitespace
set shiftwidth=2
set softtabstop=2

"set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16

let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0

map <C-o> :NERDTreeToggle<CR>
map <C-l> :NERDTreeClose<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F3> :AsyncRun ctags -R<CR>
nmap <F9> :set syntax=whitespace<CR>
nmap <F10> :syntax on<CR>

let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
    \ ]
\ }


let g:clang_format#code_style='google'
let g:clang_format#style_options = {}
let g:clang_format#style_options.UseTab = 'Always'
let g:clang_format#style_options.IndentWidth = 4
let g:clang_format#style_options.AccessModifierOffset = -4
let g:clang_format#style_options.AllowShortIfStatementsOnASingleLine = 'false'
let g:clang_format#style_options.IndentCaseLabels = 'true'
let g:clang_format#style_options.AllowShortFunctionsOnASingleLine = 'true'
let g:clang_format#style_options.AlignConsecutiveDeclarations = 'true'
let g:clang_format#style_options.AlignTrailingComments = 'true'
let g:clang_format#style_options.BinPackArguments = 'false'
let g:clang_format#style_options.BinPackParameters = 'false'
let g:clang_format#style_options.ColumnLimit = '130'
let g:clang_format#style_options.Standard = 'C++11'
let g:clang_format#style_options.AlignEscapedNewlines = 'Right'
let g:clang_format#style_options.AlignConsecutiveAssignments = 'true'

nnoremap <C-f> :ClangFormat<CR>
vnoremap <C-f> :ClangFormat<CR>
EOF

}

make_config_file_tmux
make_config_file_vim

vim +'PlugInstall --sync' +qa
