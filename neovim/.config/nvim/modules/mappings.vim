"all mapping should be here to avoid overlaps
let mapleader=" "

"disable all arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"autoformat
noremap <leader>f :Autoformat<CR>

"easy align in visual mode (e.g. vipga) and for a motion/text object (e.g. gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
