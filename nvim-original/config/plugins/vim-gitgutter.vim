" airblade/vim-gitgutter

let g:gitgutter_map_keys = 0

" Default is 4000. Reducing this makes vim-gitgutter update quicker.
set updatetime=100

" Show the changes for the hunk your cursor is on.
nmap <Leader>gs <Plug>(GitGutterPreviewHunk)

" Undo the changes for the hunk your cursor is on.
nmap <Leader>gu <Plug>(GitGutterUndoHunk)
