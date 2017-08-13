let mapleader = ","
nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap <Leader>. :nohl<CR> :set nopaste<CR>

filetype off                   " required!
" vim-plug
call plug#begin('~/.vim/plugged')

" github repos
Plug 'ervandew/supertab'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
" Plug 'nanotech/jellybeans.vim'

" <Leader><Leader>w
Plug 'Lokaltog/vim-easymotion'

" Plug 'tpope/vim-rails.git'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'

" <c-p><c-f> buffer mode
Plug 'kien/ctrlp.vim'
nnoremap <Leader>/ :CtrlP
nnoremap <Leader>b :CtrlP

let g:ctrlp_map = '<leader><Space>'
let g:ctrlp_cmd = 'CtrlPCurWD'
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>s :syntax sync fromstart<cr>

Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/jellybeans.vim'
Plug 'vim-scripts/VimClojure'

Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
" Plug 'jnwhiteh/vim-golang'
Plug 'garbas/vim-snipmate'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'

" :Extradite in git repo
Plug 'int3/vim-extradite'

" Open files and position cursor at line number with `vim file:22`
Plug 'bogado/file-line'
" Plug 'davidhalter/jedi-vim'
" Plug 'klen/python-mode'
Plug 'rking/ag.vim'

Plug 'fatih/vim-go'
let g:go_def_mode = 'guru'
let g:go_fmt_command = "goimports"

Plug 'solarnz/thrift.vim'
Plug 'pangloss/vim-javascript'

Plug 'scrooloose/syntastic'
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_cpp_checkers = []
let g:syntastic_ruby_checkers = [] " ['mri', 'rubocop']
" let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_aggregate_errors = 1

Plug 'sjl/gundo.vim'

Plug 'derekwyatt/vim-fswitch'
" Switch to header
nmap <silent> <Leader>h :FSHere<cr>

Plug 'bronson/vim-trailing-whitespace'
set listchars=tab:».,trail:.,extends:#,nbsp:.
Plug 'embear/vim-localvimrc'
let g:localvimrc_ask=0

Plug 'rust-lang/rust.vim'

" Avro
Plug 'AoLab/vim-avro'
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

" vim-scripts repos
" Plug 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"

" vim-plug: Initialize plugin system
call plug#end()
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
let NERDTreeIgnore=['\.pyc$']

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
autocmd CursorMovedI * silent! if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * silent! if pumvisible() == 0|silent! pclose|endif
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
autocmd BufNewFile,BufRead *.py set shiftwidth=4 tabstop=4
autocmd BufNewFile,BufRead *.thrift set shiftwidth=4 tabstop=4
" autocmd BufNewFile,BufRead *.js set shiftwidth=4 tabstop=4
autocmd BufNewFile,BufRead *.go nnoremap <Leader>t :GoTest<CR>

nnoremap <Leader>g :GundoToggle<CR>

if v:version >= 703
  "undo settings
  set undodir=~/.vim/undofiles
  set undofile

  set textwidth=99
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
let g:syntastic_python_pylint_post_args="--max-line-length=100"
let g:pymode_folding = 0

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

set number
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction
nnoremap <Leader>m :Make<CR>
" :silent :Make<bar>:botright copen<CR>

let g:dispatch_handlers = ['iterm']
