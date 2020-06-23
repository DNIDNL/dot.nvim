call plug#begin('$LOCALAPPDATA\nvim\plugged')
      " Always enable preview window on the right with 60% width
      let g:fzf_preview_window = 'right:30%'

      if executable("rg")
      ":let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!node_modules/*" --glob "!.git/*"'
      endif

      :let $FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard'

      if executable("bat")
      command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--height', '80%', '--color=border:#707070', '--bind=ctrl-d:preview-page-down,ctrl-u:preview-page-up,alt-j:preview-down,alt-k:preview-up', '--layout=reverse', '--info=inline', '--preview', 'bat --theme "Monokai Extended" --color always --style plain {}']}, <bang>0)
      endif

      """" Fuzzy finder
      "" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)

      """ FZF function for delete buffers
      function! s:list_buffers()
        redir => list
        silent ls
        redir END
        return split(list, "\n")
      endfunction

      function! s:delete_buffers(lines)
        execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
      endfunction

      command! BDS call fzf#run(fzf#wrap({
        \ 'source': s:list_buffers(),
        \ 'sink*': { lines -> s:delete_buffers(lines) },
        \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
        \ }))
call plug#end()
