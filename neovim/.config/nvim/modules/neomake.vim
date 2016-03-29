autocmd BufWritePost,BufReadPost * Neomake

let g:neomake_open_list = 2

"The following ensures that javascript linters available locally to the project are
"used instead of global ones (in fact global linters are not needed anymore)
for jschecker in neomake#makers#ft#javascript#EnabledMakers()
	let g:neomake_javascript_{jschecker}_maker = neomake#makers#ft#javascript#{jschecker}()
	let g:neomake_javascript_{jschecker}_maker.exe = expand(DotFiles('helpers/npm-exec'))
	let g:neomake_javascript_{jschecker}_maker.args = [ '%:p:h', jschecker ] + g:neomake_javascript_{jschecker}_maker.args
endfor
