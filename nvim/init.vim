"""""""""""""""""
" Plugins (via (vim-plug](https://github.com/junegunn/vim-plug))
"""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'pocco81/auto-save.nvim'
Plug 'ap/vim-css-color'
Plug 'roman/golden-ratio'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'tpope/vim-unimpaired'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" nvim-cmp (completion engine)
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'rafamadriz/friendly-snippets'
" nvim-telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
" Elixir
Plug 'elixir-editors/vim-elixir'
"Ember
Plug 'joukevandermaas/vim-ember-hbs'
" HTML
Plug 'mattn/emmet-vim'
" JavaScript
Plug 'othree/es.next.syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/yajs.vim'
Plug 'jparise/vim-graphql'
" Ruby & Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'keith/rspec.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'christoomey/vim-rfactory'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user' " nelstrom/vim-textobj-rubyblock depends on this.
" YAML
Plug 'stephpy/vim-yaml'
call plug#end()

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
let test#ruby#rspec#executable = "bundle exec spring rspec --format=documentation"
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tv :TestVisit<CR>
map <Leader>tof :VtrSendCommandToRunner clear; echo -e 'spring rspec --only-failures'; bundle exec spring rspec --only-failures<CR>
map <Leader>toof :VtrSendCommandToRunner clear; echo -e 'spring rspec --next-failure'; bundle exec spring rspec --next-failure<CR>

" vim-tmux-runner
let g:VtrPercentage = 35
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
map <Leader>rl :VtrSendCommandToRunner !!<CR><CR>

" splitjoin.vim
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>J :SplitjoinJoin<CR>
nmap <Leader>j :SplitjoinSplit<CR>

" vim-gitgutter
let g:gitgutter_map_keys = 0
" Show the changes for the hunk your cursor is on.
nmap <Leader>gs <Plug>(GitGutterPreviewHunk)
" Undo the changes for the hunk your cursor is on.
nmap <Leader>gu <Plug>(GitGutterUndoHunk)

" liuchengxu/vim-which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" christoomey/vim-rfactory
nmap <Leader>gf :RVfactory<CR>

" rizatti/dash.vim
:nmap <Leader>dash <Plug>DashSearch

" emmet-vim
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" undotree
nnoremap <Leader>u :UndotreeToggle<cr>

" Open a tag in a horizontal split, vertical split and new tab respectively.
map <Leader>[ :split <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>] :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Yggdroot/indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " Show different indentation markers at each level.

" auto-save.nvim
lua << EOF
  local autosave = require("auto-save")

  autosave.setup {
    execution_message = {
      message = ""
    }
  }
EOF

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "css", "html", "javascript", "json", "ruby", "scss", "yaml" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}
EOF

" nvim-cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
      { name = 'cmp_tabnine' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['solargraph'].setup {
    capabilities = capabilities
  }
EOF

" vim-vsnip
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.ruby = ['rails']

" cmp-tabnine
lua <<EOF
  local tabnine = require('cmp_tabnine.config')

  tabnine.setup({
    max_lines = 1000,
    max_num_results = 5,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = '..',
    ignored_file_types = {
      -- default is not to ignore
      -- uncomment to ignore in lua:
      -- lua = true
    },
    show_prediction_strength = false
  })
EOF

" nvim-telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>


"""""""""""""""""
" Sets
"""""""""""""""""
let mapleader = "\<Space>"

set guifont=Hack:h24

set nocompatible " Don't worry about Vi compatibility.
set scrolloff=10 " Specifies number of lines to keep above and below the cursor.
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
set number " Show line numbers
set relativenumber " Show relative line numbers
set lazyredraw " Do not redraw screen in the middle of a macro. Makes them complete faster.
set undofile " Persist undo history after closing and reopening.
set clipboard+=unnamedplus " Automatically copy to the system clipboard.
set updatetime=100 " Default is 4000. Reducing this makes vim-gitgutter update quicker.

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

" Show whitespace characters.
set list

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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown syntax=markdown textwidth=0 wrapmargin=0 wrap linebreak

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

" Set these options so Vim will be able to actually save the crontab.
autocmd filetype crontab setlocal nobackup nowritebackup

" Turn on highlighted yank.
au TextYankPost * silent! lua vim.highlight.on_yank {timeout=500}


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
map <Leader>oiv :tabe ~/Development/dotfiles/nvim/init.vim<CR>
map <Leader>giv :source ~/.config/nvim/init.vim<CR>

" Indent the whole file.
map <Leader>i migg=G`i

" Open a new tab.
map <Leader>nt :tabnew<CR>
" Close the current tab.
map <Leader>ct :tabclose<CR>
" Close other tabs.
map <Leader>cot :tabonly<CR>
" Close other windows.
map <Leader>on :on<CR>
" Close all other tabs and windows.
map <Leader>ce :on<CR>:tabonly<CR>
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
" Run the Elixir formatter on the current file.
map <Leader>fe :!mix format %<CR>
" Run the jq JSON formatter on the current file.
map <Leader>fj :%!jq .<CR>
" Delete empty lines.
map <Leader>del :g/^\s*$/d<CR>:noh<CR>
" Remove search highlights.
map <Leader>nh :noh<CR>
" Open NERDtree.
map <Leader>x :NERDTreeToggle<CR>
map <Leader>nx :tabnew<CR>:NERDTree<CR>
map <Leader>fx :NERDTreeFind<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <Leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>
" Rotate pane positions.
nmap <Leader>pr <C-w>R

" Easier quotation switching.
map <Leader>' cs"'cs`'
map <Leader>" cs'"cs`"
map <Leader>` cs'`cs"`

" Markdown
map <Leader>md :set filetype=markdown syntax=markdown textwidth=0 wrapmargin=0 wrap linebreak<CR>
map <Leader>mp :!open "%" -a "Google Chrome"<CR>

" Convert tabs to spaces.
map <Leader>ft :set expandtab<CR>:retab<CR>

" Send whatever you delete next to the black hole register.
map <Leader>dd "_

"""""""""""""""""
" Theme
"""""""""""""""""
syntax on
set termguicolors
colorscheme one
let g:one_allow_italics = 1
set background=light

let g:onedark_terminal_italics=1

let g:lightline = {
      \ 'colorscheme': 'ayu_light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineoftotal' ],
      \              [ 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [ [ 'lineoftotal' ]],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'lineoftotal': 'ColumnAndLineOfTotals',
      \ },
      \ }

" Found this function here: https://github.com/itchyny/lightline.vim/issues/92
function! ColumnAndLineOfTotals()
  return '('. virtcol('.') . '/' . (virtcol('$') - 1) . ') ' . line('.') . '/' . line('$')
endfunction

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }
