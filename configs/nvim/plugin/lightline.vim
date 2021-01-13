let g:lightline = {
\   'colorscheme': 'n0rd',
\ }

let g:lightline.tabline = {
\   'left': [
\     ['buffers']
\   ],
\   'right': [
\     []
\   ],
\ }

let g:lightline.component_expand = {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\   'buffers': 'lightline#bufferline#buffers',
\ }

let g:lightline.component_type = {
\   'linter_checking': 'right',
\   'linter_infos': 'right',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\   'linter_ok': 'right',
\   'buffers': 'tabsel',
\ }

function! LightlineMode()
  return &ft !=? 'nvimtree' ? lightline#mode() : ''
endfunction

function! LightlineBranch()
  return &ft !=? 'nvimtree' ? FugitiveHead() : ''
endfunction

function! LightlineReadonly()
  return &ft !=? 'nvimtree' && &readonly ? 'RO' : ''
endfunction

function! LightlineModified()
  return &ft !=? 'nvimtree' && &modified ? '+' : ''
endfunction

function! LightlineRelativePath()
  return &ft !=? 'nvimtree' ? expand('%:f') != '' ? expand('%:f') : '[no name]' : 'Explorer'
endfunction

function! LightlineLineInfo()
  return &ft !=? 'nvimtree' ? line('.') . ':' . col('.') : ''
endfunction

function! LightlinePercent()
  return &ft !=? 'nvimtree' ? line('.') * 100 / line('$') . '%' : ''
endfunction

function! LightlineFileFormat()
  return &ft !=? 'nvimtree' ? &ff : ''
endfunction

function! LightlineFileEncoding()
  return &ft !=? 'nvimtree' ? &enc : ''
endfunction

function! LightlineFileType()
  return &ft !=? 'nvimtree' ? &filetype : ''
endfunction

let g:lightline.component_function = {
\   'obsession': 'ObsessionStatus',
\   'gitbranch': 'LightlineBranch',
\   'mode': 'LightlineMode',
\   'readonly': 'LightlineReadonly',
\   'modified': 'LightlineModified',
\   'relativepath': 'LightlineRelativePath',
\   'lineinfo': 'LightlineLineInfo',
\   'percent': 'LightlinePercent',
\   'fileformat': 'LightlineFileFormat',
\   'fileencoding': 'LightlineFileEncoding',
\   'filetype': 'LightlineFileType'
\ }

let g:lightline.inactive = {
\   'left': [
\     [],
\     ['relativepath']
\   ],
\   'right': [
\     ['lineinfo'],
\     ['percent']
\   ]
\ }

let g:lightline.active = {
\   'left': [
\     ['mode', 'paste'],
\     ['gitbranch', 'readonly', 'relativepath', 'modified']
\   ],
\   'right': [
\     [
\       'linter_ok',
\       'linter_checking',
\       'linter_errors',
\       'linter_warnings',
\       'linter_infos'
\     ],
\     ['lineinfo'],
\     ['percent'],
\     [
\       'fileformat',
\       'fileencoding',
\       'filetype'
\     ],
\     ['obsession'],
\   ]
\ }
