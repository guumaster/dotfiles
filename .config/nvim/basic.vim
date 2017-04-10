" ---------------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ---------------------------------------------
let mapleader=","
nmap <F8> :TagbarToggle<CR>

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

"load ftplugins and indent files
filetype plugin on
filetype indent on

" ---------------
" Language
" ---------------
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

" ---------------
" Color
" ---------------
set background=dark
colorscheme default

" -----------------------------
" Backups, Tmp Files, and Undo
" -----------------------------
set backup
set backupdir=~/.config/nvim/.backup
set directory=~/.config/nvim/.tmp

" Persistent Undo
if v:version >= 703
    "undo settings
    set undodir=~/.config/nvim/undofiles
    set undofile

"    set colorcolumn=+1 "mark the ideal max text width
endif


" ---------------
" UI
" ---------------
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom
"set ruler          " Ruler on
"set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
"set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file

" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

" ---------------
" Behaviors
" ---------------
syntax enable          "turn on syntax highlighting
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=5000       " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set timeoutlen=2000     " Time to wait for a command (after leader for example).
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions-=o "dont continue comments when pushing o/O
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
set sidescrolloff=7
set sidescroll=1

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=indent,eol,start "allow backspacing over everything in insert mode
set shiftwidth=2 " Tabs under smart indent
set softtabstop=2
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
"set nohlsearch
"set wildmode=list,full
set wildmode=longest:list  "make cmdline tab completion similar to bash
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*.swp,.#*,
  \*.o,*.core,*~,core,#*#,*.gif,*.jpg,*.png,*.db,*.zip,*.tgz "stuff to ignore when tab completing

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" a tab should display as "  ", trailing whitespace as "."
set listchars=tab:\ \  " Indentended trailing whitespace
" show trailing spaces as dots
set listchars+=trail:.
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
"set mousehide  " Hide mouse after chars typed
"set mouse=a    " Mouse in all modes
"set ttymouse=xterm2

" Better complete options to speed it up
set complete=.,w,b,u,U

"tell the term has 256 colors
set t_Co=256

