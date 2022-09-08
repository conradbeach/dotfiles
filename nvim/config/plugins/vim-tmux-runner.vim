" christoomey/vim-tmux-runner

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
