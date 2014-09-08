set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'rodjek/vim-puppet'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ggreer/the_silver_searcher'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'
Plugin 'wincent/command-t'
Plugin 'kien/ctrlp.vim'
Plugin 'fugitive.vim'
Plugin 'taglist.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent on

function! InitializeDirectories()
    for dirname in [ ".backup", ".backup/vim", ".backup/vim/undo", ".backup/vim/backup" ]
        if !isdirectory($HOME . "/" . dirname)
            call mkdir($HOME . "/" . dirname)
        endif
    endfor
endfunction
call InitializeDirectories()


set incsearch hlsearch ignorecase smartcase
set expandtab smarttab shiftwidth=4 shiftround softtabstop=4 tabstop=4
set smartindent autoindent copyindent cindent
set hlsearch showmatch ignorecase incsearch smartcase
set noerrorbells

set backspace=eol,start,indent
set bs=indent,eol,start
set ts=4 sts=4 expandtab shiftround smarttab shiftwidth=4
set lbr tw=84
set virtualedit=onemore

set winminheight=0
set showcmd title cmdheight=2
set showmatch

" TagList {{
set tags=./tags,../tags,../../tags;/,$HOME/.vimtags
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1

let g:ctags_statusline=1
" Override how taglist does javascript
let g:tlist_javascript_settings = 'javascript;f:function;c:class;m:method;p:property;v:global' 
" }} 

if has('mouse')
    set mouse=a
endif

if &term =~ "xterm" || &term =~ "screen"
    set t_RV=^[[c
    set ttymouse=xterm2
    set t_Co=256
endif


syntax enable
silent! colorscheme solarized
set background=dark

let mapleader=","
let g:mapleader=","

" Remap the totally useless ; to :
nnoremap ; :

" Move between windows easier
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk


highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

if filereadable(expand("\~/.vimrc.local"))
    source \~/.vimrc.local
endif
