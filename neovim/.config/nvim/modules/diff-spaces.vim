if &diff
	map gs :call IwhiteToggle()<CR>
	function! IwhiteToggle()
		if &diffopt =~ 'iwhite'
			set diffopt-=iwhite
		else
			set diffopt+=iwhite
		endif
	endfunction
endif
