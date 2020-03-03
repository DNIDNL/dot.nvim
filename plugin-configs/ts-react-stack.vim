"------------------------ COC ----------------------- 
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 

" coc extensions 
"let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-omni'] 
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier'] 
nnoremap <leader>p :CocCommand prettier.formatFile<CR>
nnoremap <leader>a :CocAction<CR>

" Remap keys for gotos
au BufNewFile,BufRead *.tsx
         \ nmap <silent> gd <Plug>(coc-definition) |
         \ nmap <silent> gy <Plug>(coc-type-definition) |
         \ nmap <silent> gi <Plug>(coc-implementation) |
         \ nmap <silent> gr <Plug>(coc-references) 


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Add syntax higlightning for comments inside json files
autocmd FileType json syntax match Comment +\/\/.\+$+

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors 
" vim-tsx will do all the coloring for jsx in the .tsx file 
Plug 'ianks/vim-tsx' 

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors "
" typescript-vim will do all the coloring for typescript keywords 
Plug 'leafgarland/typescript-vim' 

"------------------------ THEME ------------------------ " 
" most importantly you need a good color scheme to write good code :D 
Plug 'dikiaap/minimalist' 

" == VIMPLUG END ================================ " 
" == AUTOCMD ================================ " 
" by default .ts file are not identified as typescript and .tsx files are not 
" identified as typescript react file, so add following 
au BufNewFile,BufRead *.ts setlocal filetype=typescript 
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx 
