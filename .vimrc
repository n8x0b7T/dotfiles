"" General
set number	" Show line numbers
set showmatch	" Highlight matching brace
syntax on
set relativenumber
set title

set textwidth=0
set wrapmargin=0
set wrap
set linebreak
set showbreak=+++ 	" Wrap-broken line prefix

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set autoread 
set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set timeoutlen=200
inoremap jj <ESC>

"let g:auto_save


function Auto_Save()
    if exists("g:auto_save") 
	update
    endif
endfunction


autocmd TextChanged,TextChangedI * call Auto_Save()


let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

" Bracket matching
hi MatchParen ctermfg=lightblue cterm=underline ctermbg=black

command! W  write " just in case