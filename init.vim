" Keymaps
"" General
let mapleader = " "
set list
set timeoutlen=400 ttimeoutlen=30
set autoread
set ff=unix
set ffs=unix,dos
set diffopt+=iwhite
let g:sessions_dir = "~/AppData/nvim"
set hid

source $LOCALAPPDATA/nvim/plugin-configs/font-settings.vim
source $LOCALAPPDATA/nvim/plugin-configs/terminal.vim
source $LOCALAPPDATA/nvim/plugin-configs/fzf.vim
source $LOCALAPPDATA/nvim/plugin-configs/custom-functions.vim
source $LOCALAPPDATA/nvim/plugin-configs/plugins.vim
source $LOCALAPPDATA/nvim/plugin-configs/ts-react-stack.vim

"" NerdMode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"" Buffer management
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gh <C-w>h
nnoremap gl <C-w>l

nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gH <C-w>H
nnoremap gL <C-w>L
" nnoremap gr <C-w>r
" nnoremap gR <C-w>R

nnoremap g= <C-w>=
nnoremap g+ 5<C-w>>
nnoremap g- 5<C-w><
nnoremap g_ <C-w>_
nnoremap g\| <C-w>\|

nnoremap gn :split<CR>
nnoremap gv :vsplit<CR>

nnoremap <silent> gt :bn<CR>

nnoremap <silent> gT :Buffers<CR>
nnoremap <silent> gc :BD<CR>
nnoremap <silent> gW :BDS<CR>
nnoremap <silent> gq :q<CR>

"""" Fuzzy finder
nnoremap <C-t> :Rg<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BLines<CR>

""" NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b>l :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd w

""" Save and quit
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>t :tabnext<CR>

map - /

"" Clear find selection
"cmap <Esc> :noh<CR>
nnoremap <silent><esc> :noh<CR><esc>

nnoremap <silent><C-l> :e <CR> <BAR> :redraw <CR>

"" Shortcuts
""" Edit config
nnoremap <leader>rc :e $LOCALAPPDATA\nvim\init.vim<CR>
nnoremap <leader>ts :e $LOCALAPPDATA/nvim/plugin-configs/ts-react-stack.vim<CR>
""" Load config
nnoremap <leader>vim :source $LOCALAPPDATA\nvim\init.vim<CR>

"""Ctrl-tab like windows
nnoremap <C-Tab> :bn<cr>


nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
exec 'nnoremap <leader>so :so ' . g:sessions_dir . '/'


"""" Set local directory
command! CDC cd %:p:h
""" Clears the quickfix window
command! ClearQuickfixList cexpr []

" General editor config
"" 256 color support
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

"" Fugitive split window vertical
:set diffopt+=vertical


""Split modes
set splitbelow
set splitright

""Case sensitivity for completion
set infercase
set ignorecase

set termguicolors

"" Tabs and spaces
set tabstop=3       " number of visual spaces per TAB
set softtabstop=3   " number of spaces in tab when editing
set shiftwidth=3    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

"" line numberings
set relativenumber
set number

"" line break
set nowrap

"" Clipboard
set clipboard=unnamedplus

" == AUTOCMD END ================================

:colorscheme monokai

:highlight Directory guifg=#AAAAAA ctermfg=grey

"let g:enable_bold_font = 0

au VimEnter * call ResetFont()
inoremap <M-}> }
