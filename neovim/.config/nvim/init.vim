set redrawtime=200

" Use volta to set Neovim Node.js host
if executable('volta')
	let g:node_host_prog = trim(system("volta which neovim-node-host"))
endif

" Disable unused neovim providers
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

let g:polyglot_disabled = ['asciidoc'] " vim-polyglot / vim-asciidoc: too slow
let g:vim_json_syntax_conceal = 0 " vim-polyglot / vim-json: syntax concealing makes JSON editing cumbersome

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
Plug 'neomake/neomake'
Plug 'benjifisher/matchit.zip'
Plug 'blueyed/vim-diminactive'
Plug 'bronson/vim-visual-star-search'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'dense-analysis/ale'
Plug 'vim-autoformat/vim-autoformat'
Plug 'easymotion/vim-easymotion'
Plug 'goatslacker/mango.vim'
Plug 'hashivim/vim-vagrant'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirtaj/vim-openscad',
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-sleuth' " functionality already provided by vim-polyglot
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
call plug#end()

for vimscript in split(glob(DotFiles('modules/*.vim')), '\n')
	execute 'source' vimscript
endfor

let s:local_configuration = DotFiles('init-local.vim')
if filereadable(expand(s:local_configuration))
	execute 'source' s:local_configuration
endif
