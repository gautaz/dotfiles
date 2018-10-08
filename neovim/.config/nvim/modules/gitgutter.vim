" See https://github.com/airblade/vim-gitgutter/issues/502#issuecomment-420040597
augroup my_autocommands
  autocmd BufWinLeave * GitGutterAll
augroup END
