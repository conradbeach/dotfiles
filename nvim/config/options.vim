let mapleader = "\<Space>"

set guifont=Hack:h24

set nocompatible " Don't worry about Vi compatibility.
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set laststatus=2  " Always display the status line.
set scrolloff=10 " Specifies number of lines to keep above and below the cursor.
set ruler         " Show the cursor position all the time.
set cursorline
set number " Show line numbers
" set relativenumber " Show relative line numbers
set foldmethod=syntax
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace.
set nojoinspaces " Use one space, not two, after punctuation.
set autowrite     " Automatically :write before running commands.
set showcmd       " Display incomplete commands.
set inccommand=split
set ignorecase " Case insensitive searching.
set smartcase " Case sensitive searching when an uppercase letter is included in the search term.
set lazyredraw " Do not redraw screen in the middle of a macro. Makes them complete faster.
set undofile " Persist undo history after closing and reopening.
set clipboard+=unnamedplus " Automatically copy to the system clipboard.
set mouse=a " Enable mouse scrolling
set wrapmargin=0 " Don't automatically insert line breaks.
set complete+=kspell " Autocomplete with dictionary words when spell check is on.
set diffopt+=vertical " Always use vertical diffs

" Make it obvious where 80 characters is.
set textwidth=80
set colorcolumn=+1

" Wrap text, but not in the middle of a word.
set wrap
set linebreak

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Netrw
let g:netrw_browse_split = 3 " Open files in new tab.
let g:netrw_liststyle = 3 " Use tree view.
