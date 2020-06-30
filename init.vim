" vim:foldmethod=marker:foldlevel=0
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

" Load plugin
" == VIM PLUG ================================
" Setup plugin manager
if has('linux')
   echo 'Running on linux'
   if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
               \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
endif

if has('win32')
   echo 'Running on windows'
   if empty(glob('$LOCALAPPDATA\nvim\autoload\plug.vim'))
      silent ! powershell (md "$env:LOCALAPPDATA\nvim\autoload")
      silent ! powershell curl 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' -Outfile ("$env:LOCALAPPDATA" + '\nvim\autoload\plug.vim')
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
   endif
endif

source $LOCALAPPDATA/nvim/plugin-configs/font-settings.vim
source $LOCALAPPDATA/nvim/plugin-configs/terminal.vim
source $LOCALAPPDATA/nvim/plugin-configs/fzf.vim
source $LOCALAPPDATA/nvim/plugin-configs/custom-functions.vim

call plug#begin('$LOCALAPPDATA\nvim\plugged')

      source $LOCALAPPDATA/nvim/plugin-configs/ts-react-stack.vim

      Plug 'breuckelen/vim-resize'
      let g:resize_count = 4

      "" Multiple cursors
      Plug 'terryma/vim-multiple-cursors'

      "" Git support
      Plug 'tpope/vim-fugitive'

      if has('nvim') || has('patch-8.0.902')
        Plug 'mhinz/vim-signify'
      else
        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
      endif

      """Surround stuff in params and other chars.
      Plug 'tpope/vim-surround'

      """ NERDTree
      Plug 'preservim/nerdtree'
      Plug 'Xuyuanp/nerdtree-git-plugin'
      let NERDTreeShowHidden=1

      Plug 'ryanoasis/vim-devicons'
      set encoding=UTF-8

      """ Unix like operations
      Plug 'tpope/vim-eunuch'

      """ Move codeblocks around
      Plug 'matze/vim-move'

      """ Theming plugins
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      " let g:airline_theme = 'bubblegum'
      let g:airline_theme = 'deus'
      let g:airline_powerline_fonts = 1

      let g:airline#extensions#tabline#enabled = 1
      let g:airline#extensions#tabline#formatter = 'default'
      " let g:airline#extensions#tabline#formatter = 'jsformatter'

      " let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'

      " let g:airline#extensions#tabline#show_splits = 1  " enable/disable displaying open splits per tab (only when tabs are opened). >
      " let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab let g:airline#extensions#tabline#tab_nr_type = 1  " tab number

      let g:airline#extensions#tabline#buffers_label = ''

      let g:airline#extensions#tabline#show_tab_nr = 1
      let g:airline#extensions#tabline#show_tab_type = 1
      "let g:airline#extensions#tabline#tab_min_count = 2

      let g:airline#extensions#tabline#fnamemod = ':p:.'

      nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>"

      Plug 'tomasr/molokai'
      Plug 'crusoexia/vim-monokai'

      """" Fuzzy finder
      Plug 'junegunn/fzf', { 'do': './install --bin' }
      Plug 'junegunn/fzf.vim'

      Plug 'junegunn/limelight.vim'
      let g:limelight_paragraph_span = 1

      Plug 'qpkorr/vim-bufkill'


      "Plug 'ThePrimeagen/vim-be-good'

call plug#end()

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
nnoremap gr <C-w>r
nnoremap gR <C-w>R

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

"""" Set local directory
command! CDC cd %:p:h

exec 'nnoremap <leader>so :so ' . g:sessions_dir . '/'

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
