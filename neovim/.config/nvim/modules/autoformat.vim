noremap <leader>f :Autoformat<CR>

function! s:npm_bin_path()
	if executable('npm')
		let l:oldpwd = getcwd()
		if isdirectory(expand('%:p:h'))
			cd %:p:h
			let l:result = split(system('npm bin'), '\n')[0]
			execute 'cd' l:oldpwd
			if isdirectory(l:result)
				return l:result
			endif
		endif
	endif
	return ''
endfunction

augroup my_autocommands
	autocmd BufEnter * :let g:formatterpath = [ s:npm_bin_path() ]
augroup END

let g:formatdef_standardformat = '"standard-format"'
let g:formatters_javascript = ['standardformat', 'jscs']
