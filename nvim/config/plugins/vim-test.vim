" janko-m/vim-test

let test#strategy = "vtr"
let test#ruby#rspec#executable = "bundle exec spring rspec --format=documentation"
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ts :TestSuite<CR>
map <Leader>tl :TestLast<CR>
map <Leader>tv :TestVisit<CR>
map <Leader>tof :VtrSendCommandToRunner clear; echo -e 'spring rspec --only-failures'; bundle exec spring rspec --only-failures<CR>
map <Leader>toof :VtrSendCommandToRunner clear; echo -e 'spring rspec --next-failure'; bundle exec spring rspec --next-failure<CR>
