"""""""""""""""""
" Plugins
"""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-rct'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'rizzatti/dash.vim'
Plug 'roman/golden-ratio'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'joshdick/onedark.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug '907th/vim-auto-save'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'jremmen/vim-ripgrep'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Coffeescript
Plug 'kchmck/vim-coffee-script'
" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Markdown
Plug 'gabrielelana/vim-markdown'
" Ruby & Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'christoomey/vim-rfactory'
" YAML
Plug 'stephpy/vim-yaml'
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
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" matchit
runtime macros/matchit.vim

" textobj-rubyblock
if has("autocmd")
  filetype indent plugin on
endif

" vim-test
let test#strategy = "vtr"
let test#ruby#rspec#executable = "spring rspec"
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tv :TestVisit<CR>
map <Leader>tof :VtrSendCommandToRunner clear; echo -e 'spring rspec --only-failures'; spring rspec --only-failures<CR>
map <Leader>toof :VtrSendCommandToRunner clear; echo -e 'spring rspec --next-failure'; spring rspec --next-failure<CR>

" vim-tmux-runner
let g:VtrPercentage = 30
let g:VtrOrientation = "v"
let g:VtrGitCdUpOnOpen = 1
map <Leader>ro :VtrOpenRunner<CR>
map <Leader>ra :VtrAttachToPane<CR>
map <Leader>rf :VtrFocusRunner<CR>
map <Leader>rsl :VtrSendLinesToRunner<CR>
map <Leader>rk :VtrKillRunner<CR>
map <Leader>rd :VtrDetachRunner<CR>
map <Leader>rr :VtrReattachRunner<CR>
map <Leader>rc :VtrClearRunner<CR>
map <Leader>rsd :VtrSendCtrlD<CR>
map <Leader>rsk :VtrSendCommandToRunner !!!<CR>
map <Leader>rsf :VtrSendFile<CR>

" splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>J :SplitjoinJoin<CR>
nmap <Leader>j :SplitjoinSplit<CR>

" vim-gutter
let g:gitgutter_map_keys = 0

" autozimu/LanguageClient-neovim
let g:LanguageClient_serverCommands = {
  \ 'ruby': ['orbaclerun', 'file-server'],
  \ }
nnoremap <Leader>sj :call LanguageClient_textDocument_definition()<CR>
nnoremap T :call LanguageClient_textDocument_hover()<CR>
" timeout has to be bigger than time needed to index your project
let g:LanguageClient_waitOutputTimeout = 240

" liuchengxu/vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Shougo/neosnippet
" Note: You must use 'imap' and 'smap'.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" To conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory = '/Users/cbeach/.local/share/nvim/plugged/vim-snippets/snippets'
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
" Include Rails snippets in Ruby files.
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['ruby'] = 'ruby,rails'

" christoomey/vim-rfactory
nmap <Leader>gf :RVfactory<CR>


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

" Enable mouse scrolling
set mouse=a

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Don't automatically insert line breaks.
set wrapmargin=0

" Wrap text, but not in the middle of a word.
set wrap
set linebreak
set nolist

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Save folds
au BufRead * normal zR
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Netrw
let g:netrw_browse_split = 3 " Open files in new tab.
let g:netrw_liststyle = 3 " Use tree view.

" NERDTree
let NERDTreeShowHidden=1 " Show hidden files.

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Source init.vim on startup. Some of my commands weren't working after starting
" without resourcing init.vim. I'm guessing there's a better solution than this
" but it works for now.
autocmd VimEnter * source ~/.config/nvim/init.vim

"""""""""""""""""
" Maps
"""""""""""""""""

" 0 goes to the first non-whitespace character.
map 0 ^

" Allow moving through wrapped lines.
map k gk
map j gj

" Make Y behave comparably to C and D.
map Y y$

" Allow for easy .vimrc editing and reloading.
map <Leader>oiv :tabe ~/Development/dotfiles/init.vim<CR>
map <Leader>giv :source ~/.config/nvim/init.vim<CR>

" vim-autoformat
map <Leader>f :Autoformat<CR>
" Indent the whole file.
map <Leader>i migg=G`i

" Open a new tab.
map <Leader>nt :tabnew<CR>
" Close the current tab.
map <Leader>ct :tabclose<CR>
" Tab Switching
noremap <Leader>h gT
noremap <Leader>l gt
noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
" Switch to last viewed tab.
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <Leader>0 :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Close the current window.
map <Leader>q :q<CR>
" Delete Ruby comment lines.
map <Leader>drc :g/^\s*#/d<CR>:noh<CR>
" Delete empty lines.
map <Leader>del :g/^\s*$/d<CR>:noh<CR>
" Remove search highlights.
map <Leader>nh :noh<CR>
" Open NERDtree.
map <Leader>x :NERDTree<CR>
map <Leader>nx :tabnew<CR>:NERDTree<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>
" Rotate pane positions.
nmap <Leader>pr <C-w>R

" Easier quotation switching.
map <Leader>' cs"'cs`'
map <Leader>" cs'"cs`"
map <Leader>` cs'`cs"`

" vim-anywhere
map <Leader>md :set syntax=markdown textwidth=0 wrapmargin=0 wrap linebreak<CR>

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
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
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
