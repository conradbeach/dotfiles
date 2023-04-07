syntax on
set termguicolors
set background=light

colorscheme one

let g:one_allow_italics = 1
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
