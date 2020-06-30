call plug#begin('$LOCALAPPDATA\nvim\plugged')
      " Always enable preview window on the right with 60% width
      let g:fzf_preview_window = 'right:30%'

      if executable("rg")
      ":let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!node_modules/*" --glob "!.git/*"'
      endif

      :let $FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard'

      if executable("bat")
         let s:bind_opts = '--bind=ctrl-d:preview-page-down,ctrl-u:preview-page-up,alt-j:preview-down,alt-k:preview-up'
         let s:preview_opts =  '--preview=bat --theme "Sublime Snazzy" --style plain,numbers  --color always '

         command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--color=border:#404040',
                                                                                                \ '--layout=reverse',
                                                                                                \ '--info=inline',
                                                                                                \ s:bind_opts,
                                                                                                \ s:preview_opts . '{}'], 'down':'50%'}, <bang>0)

         command! -bang -nargs=? Buffers call fzf#vim#buffers({'options': ['--color=border:#404040',
                                                                              \ '--layout=reverse',
                                                                              \ '--info=inline',
                                                                              \ '--preview-window=50%',
                                                                              \ s:bind_opts,
                                                                              \ s:preview_opts . "{3}" ], 'down': '40%'}, <bang>0)
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

      function! s:delete_buffers(lines, bang)
        execute 'bwipeout'. ((a:bang) ? "! " : " ") . join(map(a:lines, {_, line -> split(line)[0]}))
      endfunction

      command! -bang BDS call fzf#run(fzf#wrap({
        \ 'source': s:list_buffers(),
        \ 'sink*': { lines -> s:delete_buffers(lines, <bang>0) },
        \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
        \ }))





call plug#end()
