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

" Open a tag in a horizontal split, vertical split and new tab respectively.
map <Leader>[ :split <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>] :vsplit <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
