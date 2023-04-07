" janko-m/vim-test

let test#strategy = "vtr"
let test#ruby#rspec#executable = "bundle exec spring rspec --format=documentation"
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tv :TestVisit<CR>
map <Leader>tof :VtrSendCommandToRunner clear; echo -e 'bundle exec spring rspec --only-failures --format=documentation'; bundle exec spring rspec --only-failures --format=documentation<CR>
map <Leader>toof :VtrSendCommandToRunner clear; echo -e 'bundle exec spring rspec --next-failure --format=documentation'; bundle exec spring rspec --next-failure --format=documentation<CR>
