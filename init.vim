
" vim:foldmethod=marker:foldlevel=0
" Keymaps
"" General
let mapleader = ";"
set list

" Load plugins
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

call plug#begin('$LOCALAPPDATA\nvim\plugged')

      source $LOCALAPPDATA/nvim/plugin-configs/ts-react-stack.vim

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

      """ Unix like operations
      Plug 'tpope/vim-eunuch'
      Plug 'tpope/vim-fugitive'

      """ Move codeblocks around
      Plug 'matze/vim-move'

      """ Theming plugins
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      let g:airline_theme = 'bubblegum'
      let g:airline_powerline_fonts = 1

      """ Themes
      "Plug 'rafi/awesome-vim-colorschemes'
      "Plug 'mcmartelle/vim-monokai-bold'

      "Plug 'sickill/vim-monokai'
      "let g:molokai_original = 1
      " let g:rehash256 = 1

      Plug 'tomasr/molokai'
      Plug 'crusoexia/vim-monokai'

      """" Fuzzy finder
      Plug 'junegunn/fzf', { 'do': './install --bin' }
      Plug 'junegunn/fzf.vim'

      if executable("rg")
         :let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
      endif

      Plug 'ryanoasis/vim-devicons'
      set encoding=UTF-8

      Plug 'junegunn/limelight.vim'
      let g:limelight_paragraph_span = 1

call plug#end()

"" Buffer management
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gh <C-w>h
nnoremap gl <C-w>l

nnoremap gJ <C-w>J
nnoremap gK <C-w>K
nnoremap gH <C-w>H
nnoremap gL <C-w>L

nnoremap g= <C-w>=
nnoremap g+ 5<C-w>>
nnoremap g- 5<C-w><

nnoremap gn :split<CR>
nnoremap gv :vsplit<CR>

nnoremap gt :bn<CR>
"nnoremap gT :ls<CR>:b<Space>
nnoremap gT :Buffers<CR>
nnoremap gc :bd!<CR>

"""" Fuzzy finder
nnoremap <C-t> :Ag<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :BLines<CR>

""" NERDTree
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-b>l :NERDTreeFind<CR>

""" Save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"" Clear find selection
cmap <Esc> :noh<CR>

"" Shortcuts
""" Edit config
nnoremap <leader>rc :e $LOCALAPPDATA\nvim\init.vim<CR>
""" Load config
nnoremap <leader>vim :source $LOCALAPPDATA\nvim\init.vim<CR>

"""" Fuzzy finder
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)

"""" Set local directory
command CDC cd %:p:h

" General editor config
"" 256 color support
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

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
":autocmd UIEnter * GuiPopupmenu 0
:autocmd UIEnter * GuiFont FiraCode\ NF:h12
:autocmd UIEnter * GuiTabline 0
" set guifont=FiraCode\ NF:h12
"let g:enable_bold_font = 0
