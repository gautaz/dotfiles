let g:neomake_open_list = 2

"let g:neomake_html_tidy_maker = neomake#makers#ft#html#tidy()
let g:neomake_html_tidy_args = neomake#makers#ft#html#tidy().args + [ '-language', 'us' ]
let g:neomake_html_tidy_errorformat = '%A%f:%l:%c: %m'

"if an npm binary path is available, this function ensures that the first
"available maker present in this path will be used to reveal errors
"if no maker is available in such a path, reset to the default makers list
function! s:set_local_javascript_maker()
  let l:binpaths = FindNpmBin(expand('%'), [ 'standard' ] + neomake#makers#ft#javascript#EnabledMakers())

  if has_key(l:binpaths, 'standard')
    let g:neomake_javascript_npmstandard_maker = {
          \ 'exe': l:binpaths['standard'],
          \ 'errorformat': '%f:%l:%c: %m'
          \ }
    let g:neomake_javascript_enabled_makers = [ 'npmstandard' ]
    return
  endif

  for l:maker in neomake#makers#ft#javascript#EnabledMakers()
    if has_key(l:binpaths, l:maker)
      let g:neomake_javascript_npm{l:maker}_maker = neomake#makers#ft#javascript#{l:maker}()
      let g:neomake_javascript_npm{l:maker}_maker.exe = l:binpaths[l:maker]
      let g:neomake_javascript_enabled_makers = [ 'npm' . maker ]
      return
    endif
  endfor

  let g:neomake_javascript_enabled_makers = neomake#makers#ft#javascript#EnabledMakers()
  call filter(g:neomake_javascript_enabled_makers, 'executable(v:val)')
endfunction

augroup my_autocommands
	autocmd BufWritePost,BufReadPost * Neomake
  autocmd FileType javascript call s:set_local_javascript_maker()
augroup END
