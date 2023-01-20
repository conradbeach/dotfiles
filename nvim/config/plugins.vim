" Using [vim-plug](https://github.com/junegunn/vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

" General
Plug 'w0rp/ale'
Plug 'pocco81/auto-save.nvim'
Plug 'github/copilot.vim'
Plug 'ap/vim-css-color'
Plug 'roman/golden-ratio'
Plug 'Yggdroot/indentLine'
Plug 'ggandor/leap.nvim'
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
" nvim-cmp
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
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
