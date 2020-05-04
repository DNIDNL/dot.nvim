
":autocmd UIEnter * GuiFont! FiraCode\ NF:h11

let g:font_size=11
let g:font_type="FiraCode\ NF"

function IncreaseFont()
   if exists('g:GuiLoaded')
      echo "Increasing"
      let g:font_size = g:font_size + 1
      call ResetFont()
   endif
endfunction

function DecreaseFont()
   if exists('g:GuiLoaded')
      echo "Decreasing"
      let g:font_size = g:font_size - 1
      call ResetFont()
   endif
endfunction

function ResetFont()
   if exists('g:GuiLoaded')
      exe "GuiFont! " . g:font_type . ":h" . string(g:font_size)
      redraw!
   endif
endfunction

function ResetSize()
   if exists('g:GuiLoaded')
      let g:font_size = 11
      call ResetFont()
   endif
endfunction

nnoremap <silent> <C-+> :call IncreaseFont()<cr>
nnoremap <silent> <C-_> :call DecreaseFont()<cr>
nnoremap <silent> <C-0> :call ResetSize()<cr>

call ResetFont()
