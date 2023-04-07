source ~/.config/nvim/config/plugins.vim
for f in split(glob('~/.config/nvim/config/plugins/*'), '\n')
    exe 'source' f
endfor

source ~/.config/nvim/config/options.vim
source ~/.config/nvim/config/maps.vim
source ~/.config/nvim/config/autocommands.vim
source ~/.config/nvim/config/theme.vim


" Source init.vim on startup. Some of my commands weren't working after starting without re-sourcing init.vim.
" I'm guessing there's a better solution than this but it works for now.
autocmd VimEnter * source ~/.config/nvim/init.vim
