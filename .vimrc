"""""""""""""""
" Launch config
"""""""""""""""
set nocompatible
filetype off


"""""""""""""""""
" vim-plug config
"""""""""""""""""
call plug#begin('~/.vim/plugged')

" My plugins
Plug 'ctrlpvim/ctrlp.vim' "find files with ctrl-p
Plug 'scrooloose/nerdtree' "file system explorer
Plug 'w0rp/ale' " async linter
Plug 'jiangmiao/auto-pairs' "insert or delete brackets, parens, quotes in pairs
Plug 'tpope/vim-surround' "add and remove surrounding characters
Plug 'tpope/vim-fugitive' "git wrapper
Plug 'tpope/vim-commentary' "comment stuff out
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter' "shows a git diff in the 'gutter' (sign column)
Plug 'ntpeters/vim-better-whitespace' "highlight whitespace and provides StripWhitespace autocmd
Plug 'skywind3000/asyncrun.vim' "run shell commands in the background
Plug 'Yggdroot/indentLine' "show vertical indent lines
Plug 'sheerun/vim-polyglot' "load syntax files on demand
Plug 'pangloss/vim-javascript' "explicitly load this syntax file
Plug 'mxw/vim-jsx' "explicitly load this syntax file
Plug 'hail2u/vim-css3-syntax' "explicitly load this syntax file
Plug 'mattn/emmet-vim' "emmet
Plug 'vim-scripts/HTML-AutoCloseTag' "autoclose html tags
Plug 'chriskempson/base16-vim' "load base16 color templates
Plug 'itchyny/lightline.vim' "minimal status line

" Initialize plugin system
call plug#end()


""""""""""""""""
" Syntax & Color
""""""""""""""""
" commented out because hyper.app uses it's color scheme
" colorscheme base16-onedark
set background=dark
syntax enable
filetype plugin indent on


"""""""""""""
" Misc config
"""""""""""""
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ttyfast

" Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
" set timeoutlen=500
set timeout timeoutlen=1000 ttimeoutlen=0

" Set utf8 as the standard encoding
set encoding=utf8 nobomb

" Use system clipboard
set clipboard=unnamed
set pastetoggle=<leader>p

" Write the old file out when switching between files.
set autowrite
set autoread

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

" Set global replace
set gdefault

" Wildmenu
set wildmenu
set wildmode=list:longest

" Don't highlight matched pairs
let g:loaded_matchparen=1


"""""""""""""""
" Auto commands
"""""""""""""""
" Remove whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave

" Fix up formatting using eslint (will use prettier if eslintrc config is
" correct)
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost vim/vimrc source ~/.vimrc
 augroup END
endif


"""""""""""""""""
" Spaces and tabs
"""""""""""""""""
set tabstop=1
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2

" Indent stuff
set smartindent
set autoindent

" Round indent to multiple of 'shiftwidth'.
set shiftround


""""""""""""""""""""""""
" UI layout and movement
""""""""""""""""""""""""
" Don't beep
set visualbell

" Remove intro
set shortmess+=I

" Display current cursor position in lower right corner.
set ruler

" Disable folding
set nofoldenable

" Map leader to ','
let mapleader=","

" Esc is too small on Mac keyboards
imap § <Esc>

" Make it easier to enter commands
nnoremap ; :

" Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number
set numberwidth=5

" Set 10 lines to the cursor
set scrolloff=10

" Always show the status line
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" Use modeline overrides
set modeline
set modelines=10

" Set terminal window title
set title
set titlestring=%F

" Showmode
set showmode

" Highlight matching [{()}]
set showmatch
set mat=2

" Redraw only when we need
set lazyredraw

" Split creation
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" More logic split positions
set splitbelow
set splitright

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" No arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Italics
" Commented out as it doesn't work in hyper.app
" hi htmlArg gui=italic
" hi Comment gui=italic
" hi Type    gui=italic
" hi htmlArg cterm=italic
" hi Comment cterm=italic
" hi Type    cterm=italic

" Change the cursor shape in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Set line number color
highlight LineNr ctermfg=240


"""""""""""""""
" Search config
"""""""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>


"""""""""""""""
" Plugin config
"""""""""""""""
" ctrlP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build)|(\.(swp|ico|git|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1

" Fugitive (Git)
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gr :Gremove<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gd :Gvdiff<CR>

" Gitgutter
set signcolumn=yes

" Emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
      \'javascript.jsx' : {
      \'extends' : 'jsx',
      \},
      \}

" indentLine
let g:indentLine_char = '|'
let g:indentLine_char = '┆'

" Ale
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" NERDtree
map <leader>n :NERDTreeToggle<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
