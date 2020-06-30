set shell=powershell.exe
set shellpipe=|
set shellquote= shellpipe=\| shellxquote=
set shellcmdflag=\ -NoLogo\ -ExecutionPolicy\ RemoteSigned\ -NoProfile\ -Command
set shellredir=\|\ Out-File\ -Encoding\ UTF8

if has('nvim')
  tnoremap  <C-\><C-n>
endif

func StartShell()
   split | resize 15
   terminal
   normal gJ
   normal 15g_
endfunction

nnoremap <silent><C-´> :exec StartShell()<Cr>
nnoremap <silent> :exec StartShell()<Cr>
