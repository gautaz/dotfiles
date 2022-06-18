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
Plug 'airblade/vim-gitgutter' " shows a git diff in the sign column
Plug 'neomake/neomake'
Plug 'benjifisher/matchit.zip' " configure % to match more than just single characters
Plug 'blueyed/vim-diminactive' " dim inactive windows
Plug 'bronson/vim-visual-star-search' " Use * and # on visual selection
Plug 'dense-analysis/ale' " linting & completion (currently needs deoplete)
Plug 'vim-autoformat/vim-autoformat' " auto format with external formatting programs
Plug 'easymotion/vim-easymotion' " fast cursor motions with <leader>[fFswb...]
Plug 'junegunn/vim-easy-align' " ease table alignment with ga<character>
Plug 'mattn/emmet-vim' " expand web abbreviations with <crtl>y
Plug 'NLKNguyen/papercolor-theme' " color theme
Plug 'ntpeters/vim-better-whitespace' " highlight trailing whitespaces (strip with :StripWhitespace)
Plug 'sheerun/vim-polyglot' " collection of language packs
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion framework
Plug 'sirtaj/vim-openscad' " syntax highlighting for OpenSCAD
Plug 'tpope/vim-abolish' " enhanced substitute with :S instead of :s
Plug 'tpope/vim-commentary' " comment lines with gc
Plug 'tpope/vim-eunuch' " sugar for the UNIX shell commands (:Move for example)
Plug 'tpope/vim-fugitive' " access git features with :Git
" Plug 'tpope/vim-sleuth' " functionality already provided by vim-polyglot
Plug 'tpope/vim-unimpaired' " pairs of bracket maps ([q, ]q, ...)
Plug 'vim-airline/vim-airline' " lean & mean statusline
Plug 'vim-airline/vim-airline-themes' " needed to use papercolor theme
Plug 'Yggdroot/indentLine' " display indentation
call plug#end()

for vimscript in split(glob(DotFiles('modules/*.vim')), '\n')
	execute 'source' vimscript
endfor

let s:local_configuration = DotFiles('init-local.vim')
if filereadable(expand(s:local_configuration))
	execute 'source' s:local_configuration
endif
