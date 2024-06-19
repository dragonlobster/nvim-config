augroup vertical_help
  " Open :help in vertical split instead of horizontal
  autocmd!
  autocmd FileType help
        \ setlocal bufhidden=unload |
        \ wincmd L |
        \ vertical resize 80 |
        \ set winfixwidth
augroup END
