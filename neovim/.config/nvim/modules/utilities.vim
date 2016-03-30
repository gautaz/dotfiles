function! NpmBinPath(path)
	if !executable('npm')
    return []
  endif

  let l:newpwd = fnamemodify(a:path, ':p')

  if !isdirectory(l:newpwd)
    let l:newpwd = fnamemodify(l:newpwd, ':h')
  endif

  if !isdirectory(l:newpwd)
    return []
  endif

  let l:oldpwd = getcwd()
  execute 'cd' l:newpwd

  let l:result = split(system('npm bin'), '\n')[0]
  execute 'cd' l:oldpwd

  if !isdirectory(l:result)
    return []
  endif

  return [ l:result ]
endfunction

