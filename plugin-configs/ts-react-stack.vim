"------------------------ COC ----------------------- 
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 

" coc extensions 
let g:coc_global_extensions = ['coc-eslint', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier'] 
nnoremap <leader>p :CocCommand prettier.formatFile<CR>
nnoremap <leader>a :CocAction<CR>

" Remap keys for gotos and set correct filetype
au BufNewFile,BufRead *.tsx
         \ nmap <silent> gd <Plug>(coc-definition) |
         \ nmap <silent> gy <Plug>(coc-type-definition) |
         \ nmap <silent> gi <Plug>(coc-implementation) |
         \ nmap <silent> gr <Plug>(coc-references) 

au BufNewFile,BufRead *.ts setlocal filetype=typescript 
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx 

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

"" Syntax highlight for typescript
Plug 'HerringtonDarkholme/yats.vim'
