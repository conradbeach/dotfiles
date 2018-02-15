"""""""""""""""""
" Plugins
"""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thoughtbot/vim-rspec'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'Shougo/deoplete-rct'
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'slashmili/alchemist.vim'
Plug '907th/vim-auto-save'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'janko-m/vim-test'
Plug 'jremmen/vim-ripgrep'
Plug 'rizzatti/dash.vim'
Plug 'roman/golden-ratio'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/splitjoin.vim'
call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#enable()

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

" ALE
let g:ale_sign_column_always = 1

" matchit
runtime macros/matchit.vim

" textobj-rubyblock
if has("autocmd")
  filetype indent plugin on
endif

" DISABLED: It kept freezing up my editor. Report an issue when you have time.
" splitjoin.vim
" let g:splitjoin_split_mapping = ''
" let g:splitjoin_join_mapping = ''
" nmap <Leader>J :SplitjoinJoin<cr>
" nmap <Leader>j :SplitjoinSplit<cr>

"""""""""""""""""
" Theme
"""""""""""""""""
syntax on
colorscheme onedark

let g:onedark_terminal_italics=1

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }

"""""""""""""""""
" Sets
"""""""""""""""""
let mapleader = "\<Space>"

set guifont=Hack:h24

set nocompatible " Don't worry about Vi compatibility.
set scrolloff=10 " Specifies number of lines to keep above and below the cursor.
set number
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autowrite     " Automatically :write before running commands
set laststatus=2  " Always display the status line
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set nojoinspaces " Use one space, not two, after punctuation.
set inccommand=split
set foldmethod=syntax
set ignorecase " Case insensitive searching.
set smartcase " Case sensitive searching when an uppercase letter is included in the search term.
set cursorline
set number
set relativenumber

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Netrw
let g:netrw_browse_split = 3 " Open files in new tab.
let g:netrw_liststyle = 3 " Use tree view.

"""""""""""""""""
" Maps
"""""""""""""""""

" 0 goes to the first non-whitespace character.
map 0 ^

" Allow moving through wrapped lines.
map k gk
map j gj

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" vim-test
nmap <Leader>t<C-n> :TestNearest<CR>
nmap <Leader>t<C-f> :TestFile<CR>
nmap <Leader>t<C-s> :TestSuite<CR>
nmap <Leader>t<C-l> :TestLast<CR>
nmap <Leader>t<C-g> :TestVisit<CR>

" Allow for easy .vimrc editing and reloading.
map <Leader>eiv :tabe ~/Development/dotfiles/init.vim<cr>
map <Leader>siv :source ~/.config/nvim/init.vim<cr>

" vim-autoformat
map <Leader>f :Autoformat<CR>
" Indent the whole file.
map <Leader>i migg=G`i

" RSpec.vim mappings
let g:rspec_command = '!spring rspec {spec}'
map <Leader>fs :call RunCurrentSpecFile()<CR>
map <Leader>ns :call RunNearestSpec()<CR>
map <Leader>ls :call RunLastSpec()<CR>
map <Leader>as :call RunAllSpecs()<CR>

" Open a new tab.
map <Leader>t :tabnew<CR>
" Close the current window.
map <Leader>q :q<CR>
" Close the current tab.
map <Leader>tc :tabclose<CR>
" Delete Ruby comment lines.
map <Leader>drc :g/^\s*#/d<CR>:noh<CR>
" Delete empty lines.
map <Leader>del :g/^\s*$/d<CR>:noh<CR>
" Remove search highlights.
map <Leader>nh :noh<CR>
" Open Netrw.
map <Leader>x :Explore!<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
