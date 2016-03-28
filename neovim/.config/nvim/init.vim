let mapleader=" "

function! DotFiles(path)
	return '~/.config/nvim/' . a:path
endfunction

if empty(glob(DotFiles('autoload/plug.vim')))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(DotFiles('plugged'))
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

for vimscript in split(glob(DotFiles('modules/*.vim')), '\n')
	execute 'source' vimscript
endfor

let s:local_configuration = DotFiles('init-local.vim')
if filereadable(expand(s:local_configuration))
	execute 'source' s:local_configuration
endif
