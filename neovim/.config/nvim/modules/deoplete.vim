let g:deoplete#enable_at_startup = 1

" workaround needed by deoplete-ternjs
" https://github.com/carlitux/deoplete-ternjs/issues/88
call deoplete#custom#option('num_processes', 0)

" deoplete-ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

" close the preview window after completion is done
augroup my_autocommands
  autocmd CompleteDone * pclose!
augroup END
