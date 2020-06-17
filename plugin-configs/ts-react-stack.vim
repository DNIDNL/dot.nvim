"------------------------ COC ----------------------- 

set cmdheight=1
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes " coc for tslinting, auto complete and prettier


"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions 
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier'] 
nnoremap <C-k><C-d> :CocCommand prettier.formatFile<CR>
nnoremap <leader>a :CocAction<CR>
nmap <A-Cr> <Plug>(coc-fix-current)

" Remap keys for gotos and set correct filetype
au BufNewFile,BufRead *.tsx
         \ nmap <silent> gd <Plug>(coc-definition) |
         \ nmap <silent> gy <Plug>(coc-type-definition) |
         \ nmap <silent> gi <Plug>(coc-implementation) |
         \ nmap <silent> gr <Plug>(coc-references) |
         \nmap <C-r><C-r> <Plug>(coc-rename)

au BufNewFile,BufRead *.ts setlocal filetype=typescript 
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx 


""" Show documentation on button K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
   else
      call CocAction('doHover')
   endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

" Add syntax higlightning for comments inside json files
autocmd FileType json syntax match Comment +\/\/.\+$+

"" Syntax highlight for typescript
Plug 'HerringtonDarkholme/yats.vim'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

