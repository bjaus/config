set nocompatible
filetype off

call plug#begin('~/.vim.plugged')

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'codota/tabnine-vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-flake8'
Plug 'preservim/nerdcommenter'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/SimpylFold'
Plug 'toupeira/vim-desertink'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-syntastic/syntastic'

"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'psf/black', { 'branch': 'stable' }
"Plug 'turbio/bracey.vim'

call plug#end()

syntax enable  " enable syntax highlighting
filetype plugin indent on  " enable detection, plugins and indent

" (1) important
set pastetoggle=<leader>p  " paste mode: avoid auto indent, literal chars

" (2) moving around, searching and patterns
set incsearch  " show match for partial typed search
set magic  " change the way backslashes are used in search patterns
"set ignorecase  " ignore case when using a search pattern
"set smartcase  " override 'ignorecase' when pattern has uppercase characters

" (3) tags

" (4) displaying text
set wrap  " long lines wrap
set linebreak  " wrap long lines at a character in 'breakat'
set breakindent  " preserve indentation in wrapped text
set breakat=\ \  " character that causes a linebreak
set number  " show the line number for each line
"set relativenumber  " show the relative line number for each line
set lazyredraw  " don't redraw while executing macros

" (5) syntax, highlighting and spelling
set background=dark  " 'dark' or 'light'; the background color brightness
set hlsearch  " highlight all matches for the last used search pattern
"set cursorcolumn  " hightlight the screen column of the cursor
set cursorline  " highlight the screen line of the cursor

" (6) multiple windows
set statusline+=%F  " see full path in status line
set laststatus=2  " 0, 1, or 2; when to use a status line for the last window
set hidden  " don't unload a buffer when not longer shown in a window
set splitbelow  " a new window is put below the current one
set splitright  " a new window is put right of the current one

" (7) multiple tab pages

" (8) terminal
set term=xterm-256color  " name of the used terminal
set ttyfast  " terminal connection is fast
set title  " show info in the window title
set titlelen=100  " percentage of 'columns' used for the window title

" (9) using the mouse
set mouse=i  " list of flags for using the mouse

" (10) printing

" (11) messages and info
set showcmd  " show (partial) command keys in the status line
set showmode  " show the current mode in the status line
set ruler  " show cursor position below each window
set noerrorbells  " ring the bell for error messages
set visualbell  " use a visual bell instead of beeping

" (12) selecting text

" (13) editing text
set undolevels=999  " maximum number of changes that can be undone
set textwidth=120  " line length above which to break a line
set backspace=indent,eol,start  " specifies what <BS> can do in insert mode
set formatoptions=jtcqrn1  " list of flags that tell how automatic formatting works
set formatoptions-=o  " don't start new line w/ comment character (`o`) key
set matchpairs=(:),{:},[:],<:>  " list of pairs that match for '%' command
set showmatch  " when inserting a bracket, briefly jump to its match

" (14) tabs and indenting
"set softtabstop=2  " if non-zero, number of spaces to insert for a <Tab>
"set shiftwidth=2  " number of spaces used for each step in (auto)indent
"set expandtab  " expand <Tab> to spaces in insert mode
"set autoindent  " automatically set the indent of a new line
"set copyindent  " copy whitespace for indenting from previous line

au BufNewFile,BufRead *.json,*.yml,*.yaml,*.go,*.c,*.cpp,*.js,*.vue,*.html,*.css
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set autoindent |
  \ set expandtab

au BufNewFile,BufRead *.py
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set autoindent |
  \ set expandtab

" (15) folding
set foldenable  " set to display all folds open
set foldlevel=99  " folds with a level higher than this number will be closed
set foldclose=all  " set to 'all' to close a fold when the cursor leaves it
set foldmethod=indent " folding type: 'manual', 'indent', 'expr', 'marker', 'syntax'
set foldnestmax=10  " maximum fold dept for when 'foldmethod' is 'indent' or 'syntax'

" (16) diff mode

" (17) mapping

" (18) reading and writing files
set modelines=0  " enable using settings for modelines when reading a file
set fileformat=unix " end-of-line format: 'dos', 'unix', 'mac'
set autoread  " automatically read a file when it was modified outside of vim

" (19) the swap file
set updatetime=100  " time in msec after which the swap file will be updated

" (20) command line editing
set history=999 " how many commands are remembered
set wildmode=list:longest  " specifies how command line completion works
set wildignore=*/.git/*,*/*venv/*,*/node_modules/* " list of patterns to ignore files for file name completion
set fileignorecase  " ignore case when using file names
set wildignorecase  " ignore case when completing file names
set wildmenu  " command-line completion shows a list of matches
set wildchar=<TAB>  " key that triggers command-line expansion

" (21) executing external commands
set shell=/bin/bash  " name of the shell program used for external commands

" (22) running make and jumping to errors

" (23) language specific

" (24) multi-byte characters
set encoding=utf-8  " character encoding used in vim

" (25) various

" --- cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"  " line cursor (insert mode)
let &t_EI = "\<Esc>]50;CursorShape=0\x7"  " block cursor (command mode)

" vim-desertink
colorscheme desertink

" vim-flake8
let python_highlight_all=1
syntax on

" black
"let g:black_linelength=120
"let g:black_virtualenv='~/.black'

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" SimpylFold
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=1
let g:SimpylFold_fold_import=1

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$', '__pycache__', '.venv', 'venv', 'node_modules']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-better-whitespace
highlight ExtraWhitespace ctermbg=red
"let g:strip_max_file_size=500
let g:better_whitespace_enabled=1
let g:better_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

" --- functions

function! NumberToggle()
  if (&number == 1)
    "set norelativenumber
    set nonumber
  else
    set number
    "set relativenumber
  endif
endfunc

" --- key remap
let mapleader=";"  " change leader key

"nnoremap <leader>b :Black<cr>
nnoremap <C-@> :BD<cr>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>h :nohlsearch<cr>
nnoremap <leader>l :IndentLinesToggle<cr>
nnoremap <leader>n :call NumberToggle()<cr>
nnoremap <space><space> za
nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap [w :PrevTrailingWhitespace<cr>
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap ]w :NextTrailingWhitespace<cr>
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>

