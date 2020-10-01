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

call plug#begin('$LOCALAPPDATA\nvim\plugged')
      Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
      " let g:airline#extensions#tabline#formatter = 'default'
      let g:airline#extensions#tabline#formatter = 'jsformatter'

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
      "Plug 'junegunn/fzf', { 'do': './install --bin' }
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
      Plug 'junegunn/fzf.vim'

      Plug 'junegunn/limelight.vim'
      let g:limelight_paragraph_span = 1

      Plug 'qpkorr/vim-bufkill'

      "Plug 'ThePrimeagen/vim-be-good'

      Plug 'preservim/nerdcommenter'

      let g:NERDSpaceDelims = 1

      let g:NERDDefaultAlign = 'left'

call plug#end()
