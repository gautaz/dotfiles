let s:scriptpath = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! FindNpmBin(path, binaries)
  let l:result = {}

	if !executable('node')
    return l:result
  endif

  let l:destination = fnamemodify(a:path, ':p')

  if !isdirectory(l:destination)
    let l:destination = fnamemodify(l:destination, ':h')
  endif

  try
    for l:entry in split(system('node ' . globpath(s:scriptpath, 'findnpmbin.js') . ' ' . l:destination . ' ' . join(a:binaries)), '\n')
      let l:sentry = split(l:entry, ':')
      let l:result[l:sentry[0]] = l:sentry[1]
    endfor
  catch /./
    " This fails sometimes for reasons I have not yet clearly understood
  endtry

  return l:result
endfunction

function! NpmBinPaths(path)
	if !executable('node')
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

  let l:result = split(system('node -e "module.paths.forEach(function(p) { console.log(require(''path'').join(p, ''.bin'')) })"'), '\n')
  execute 'cd' l:oldpwd

  return l:result
endfunction
