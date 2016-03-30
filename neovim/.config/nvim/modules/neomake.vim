let g:neomake_open_list = 2

"if an npm binary path is available, this function ensures that the first
"available maker present in this path will be used to reveal errors
"if no maker is available in such a path, reset to the default makers list
function! s:set_local_javascript_maker()
  let l:npmbin = NpmBinPath(expand('%'))

  if !empty(l:npmbin)
    if executable(l:npmbin[0] . '/standard')
      let g:neomake_javascript_npmstandard_maker = {
            \ 'exe': l:npmbin[0] . '/standard',
            \ 'errorformat': '%f:%l:%c: %m'
            \ }
      let g:neomake_javascript_enabled_makers = [ 'npmstandard' ]
      return
    endif

    for maker in neomake#makers#ft#javascript#EnabledMakers()
      if executable(l:npmbin[0] . '/' . maker)
        let g:neomake_javascript_npm{maker}_maker = neomake#makers#ft#javascript#{maker}()
        let g:neomake_javascript_npm{maker}_maker.exe = l:npmbin[0] . '/' . maker
        let g:neomake_javascript_enabled_makers = [ 'npm' . maker ]
        return
      endif
    endfor
  endif

  let g:neomake_javascript_enabled_makers = neomake#makers#ft#javascript#EnabledMakers()
endfunction

augroup my_autocommands
	autocmd BufWritePost,BufReadPost * Neomake
  autocmd FileType javascript call s:set_local_javascript_maker()
augroup END
