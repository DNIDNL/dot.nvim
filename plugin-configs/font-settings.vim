
":autocmd UIEnter * GuiFont! FiraCode\ NF:h11

let g:font_size=10
let g:font_type="FiraCode\ NF"
""" let g:font_type="FiraCode\ Nerd\ Font"
"" let g:font_type="Consolas"

function IncreaseFont()
   if exists('g:GuiLoaded')
      echo "Increasing"
      let g:font_size = g:font_size + 0.5
      call ResetFont()
   endif
endfunction

function DecreaseFont()
   if exists('g:GuiLoaded')
      echo "Decreasing"
      let g:font_size = g:font_size - 0.5
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
nnoremap <silent> <C-'> :call ResetSize()<cr>

