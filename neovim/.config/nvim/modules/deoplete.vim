let g:deoplete#enable_at_startup = 1

" close the preview window after completion is done
augroup my_autocommands
  autocmd CompleteDone * pclose!
augroup END
