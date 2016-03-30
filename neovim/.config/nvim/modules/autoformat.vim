"adds standard-format as a potential formatter
let g:formatdef_standardformat = '"standard-format"'
let g:formatters_javascript = ['standardformat', 'jscs']

"most formatters get their configuration relatively to the path of the file
"being formatted
function! LocalAutoformat()
		let l:oldpwd = getcwd()
    cd %:p:h
    :Autoformat
    execute 'cd' l:oldpwd
endfunction

noremap <leader>f :call LocalAutoformat()<CR>

"this ensures that node project formatters located in the npm binary path are
"foudn by autoformat
augroup my_autocommands
	autocmd Filetype javascript let g:formatterpath = NpmBinPath(expand('%'))
augroup END
