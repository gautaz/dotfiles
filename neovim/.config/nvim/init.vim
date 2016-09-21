augroup my_autocommands
	autocmd!
augroup END

function! DotFiles(path)
	return '~/.config/nvim/' . a:path
endfunction

if empty(glob(DotFiles('autoload/plug.vim')))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	augroup my_autocommands
		autocmd VimEnter * PlugInstall | source $MYVIMRC
	augroup END
endif

call plug#begin(DotFiles('plugged'))
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bronson/vim-visual-star-search'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'embear/vim-localvimrc'
Plug 'goatslacker/mango.vim'
Plug 'junegunn/vim-easy-align'
Plug 'k-takata/matchit.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
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
