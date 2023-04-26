" Save folds
autocmd BufRead * normal zR
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

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

" Set these options so Vim will be able to actually save the crontab.
autocmd filetype crontab setlocal nobackup nowritebackup

" Turn on highlighted yank.
autocmd TextYankPost * silent! lua vim.highlight.on_yank {timeout=500}
