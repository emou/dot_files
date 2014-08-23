let mapleader = ","
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
noremap t "=strftime("%d/%m/%Y")<CR>P
noremap d "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
nnoremap <Leader>. :nohl<CR>

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" github repos
Bundle 'ervandew/supertab'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
" Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/jellybeans.vim'

" <Leader><Leader>w
Bundle 'Lokaltog/vim-easymotion'

Bundle 'tpope/vim-rails.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'slim-template/vim-slim'

" <c-p><c-f> buffer mode
Bundle 'kien/ctrlp.vim'
nnoremap <Leader>/ :CtrlP
nnoremap <Leader>b :CtrlP

let g:ctrlp_map = '<leader><Space>'
let g:ctrlp_cmd = 'CtrlPCurWD'
nmap <leader>b :CtrlPBuffer<cr>

Bundle 'vim-scripts/grep.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jnwhiteh/vim-golang'
Bundle 'garbas/vim-snipmate'
Bundle 'vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'

" :Extradite in git repo
Bundle 'int3/vim-extradite'

" Open files and position cursor at line number with `vim file:22`
Bundle 'bogado/file-line'
Bundle 'klen/python-mode'
Bundle 'rking/ag.vim'

Bundle 'scrooloose/syntastic'
let g:syntastic_cpp_checkers = []
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

Bundle 'sjl/gundo.vim'

Bundle 'derekwyatt/vim-fswitch'
" Switch to header
nmap <silent> <Leader>h :FSHere<cr>

" vim-scripts repos
" Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"
filetype plugin indent on     " required!

syntax enable
set pastetoggle=<F2>
set ignorecase
set smartcase
set shiftwidth=2
set nocp
set autoindent
set smartindent
set expandtab

let NERDTreeWinPos = 'right'
nnoremap <Leader>e :NERDTreeToggle .<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

map r :silent !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>:redraw!<CR>
map <F7>  :set tags+=~/.vim/tags
set tags=tags;./tags;/
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
":vmap <Space> :s/\(.\+\)\(\w\+\)\(.\+\)/\3\2\1
" automatically open and close the popup menu / preview window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menuone,menu,longest,preview
" <-- OniCppComplete end
colorscheme jellybeans "ir_black, wombat
nnoremap <silent> <Leader>k mk:exe 'match Search /<Bslash>%'.line(".").'l/'<CR>
let loaded_matchparen = 1 
set incsearch
set hlsearch
command -bar -nargs=1 OpenURL :!firefox <args>
set clipboard=unnamed
let $PAGER='less'

" set autochdir
set backup
set backupdir=~/.vim/backup

" === begin latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_ViewRule_dvi = "open"
let g:Tex_ViewRule_pdf = "open"
let g:Tex_Folding = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Imap_UsePlaceHolders = 0
" au BufWritePost *.tex silent call Tex_CompileLatex()
" === end latex-suite

set ruler
set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

let $PATH = "/usr/bin/:".$PATH

set shiftwidth=2
set tabstop=2
autocmd BufNewFile,BufRead *.cpp,*.h,*.c set shiftwidth=4 tabstop=4

nnoremap <Leader>g :GundoToggle<CR>

if v:version >= 703
  "undo settings
  set undodir=~/.vim/undofiles
  set undofile

  set textwidth=79
  set colorcolumn=+1 "mark the ideal max text width

  " mkdir -p ~/.vim/undofiles
  " mkdir -p ~/.vim/backup
  " mkdir -p ~/.vim/swap
  "  Backups
  set noswapfile            " don't keep swp files either
  set backupdir=~/.vim/backup " store backups under ~/.vim/backup
  set backupcopy=yes        " keep attributes of original file
  set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
  set directory=~/.vim/swap

  set cryptmethod=blowfish
endif

" Force markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
