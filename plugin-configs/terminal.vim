" set shell=powershell.exe\ -NoLogo\ -NoProfile\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
" if shellcmdflag starts with '-' then tempname() uses forward slashes, see 
" https://groups.google.com/forum/#!topic/vim_dev/vTR05EZyfE0
" set shellcmdflag=\ -Command
" set shellquote=
" set shellxquote=(
" let &shellpipe=\|
" let &shellredir='| Out-File -Encoding UTF8 %s'
" set noshellslash

      
if has('nvim')
  tnoremap  <C-\><C-n>
endif

let g:sh_defaults = { 'shell':&shell, 'shellcmdflag':&shellcmdflag,
                   \ 'shellquote':&shellquote, 'shellxquote':&shellxquote,
                   \ 'shellpipe':&shellpipe, 'shellredir':&shellredir }
func s:UsePowerShell()
   set shell=powershell.exe\ -NoLogo\ -NonInteractive\ -ExecutionPolicy\ RemoteSigned
   " set shell=powershell shellquote=\" shellpipe=\| shellredir=>
   set shellcmdflag=\ -ExecutionPolicy\ RemoteSigned\ -Command
   let &shellxquote=' '
endfunction

func s:UseDefaultShell()
   let s = g:sh_defaults
   let &shell=s.shell
   let &shellquote=s.shellquote
   let &shellpipe=s.shellpipe
   let &shellredir=s.shellredir
   let &shellcmdflag=s.shellcmdflag
   let &shellxquote=s.shellxquote
endfunction

func StartShell()
   if has('win32')
      call s:UsePowerShell()
   endif

   split | resize 15
   terminal
   normal gJ
   normal 15g_
   call s:UseDefaultShell()
endfunction

nnoremap <silent><C-´> :exec StartShell()<Cr>
nnoremap <silent> :exec StartShell()<Cr>

