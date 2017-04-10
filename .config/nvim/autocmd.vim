" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Fix trailing whitespace in my most used programming langauges
  autocmd BufWritePre *.vim,*.js,*.json silent! :StripTrailingWhiteSpace

  "jump to last cursor position when opening a file
  "dont do it when writing a commit log entry
  autocmd BufReadPost * call SetCursorPosition()
  function! SetCursorPosition()
      if &filetype !~ 'svn\|commit\c'
          if line("'\"") > 0 && line("'\"") <= line("$")
              exe "normal! g`\""
              normal! zz
          endif
      end
  endfunction

  "http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
  "hacks from above (the url, not jesus) to delete fugitive buffers when we
  "leave them - otherwise the buffer list gets poluted
  "
  "add a mapping on .. to view parent tree
  autocmd BufReadPost fugitive://* set bufhidden=delete
  autocmd BufReadPost fugitive://*
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif



  " Function to remove trailing whitespaces on save
  function! <SID>StripTrailingWhitespaces()
      " Preparation: save last search, and cursor position.
      let _s=@/
      let l = line(".")
      let c = col(".")
      " Do the business:
      %s/\s\+$//e
      " Clean up: restore previous search history, and cursor position
      let @/=_s
      call cursor(l, c)
  endfunction
  
  " Autoremove trailing whitespaces on save
  autocmd BufWritePre *.html,*.ts,*.js :call <SID>StripTrailingWhitespaces()
  
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  
endif
