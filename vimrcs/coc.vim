set hidden
"语法检查等待时间
set updatetime=100
set signcolumn=yes

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

let g:coc_last_hover_message= 1
let g:UltiSnipsSnippetDirectories = [ "~/.vim/mysnippets"]

"跳转到定义
nmap <silent> gd <Plug>(coc-definition)
"跳转到声明
nmap <silent> gc <Plug>(coc-declaration)
"跳转到类型定义
nmap <silent> gy <Plug>(coc-type-definition)
"跳转到实现
nmap <silent> gi <Plug>(coc-implementation)
"跳转到引用
nmap <silent> gr <Plug>(coc-references)
"跳转到下一个错误
nmap <silent> ge <Plug>(coc-diagnostic-next)




"按K显示document in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
command Doc call <SID>show_documentation()<CR>
command Fix call <C-U>call CocActionAsync('doQuickfix')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


"rename
nmap <leader>rn <Plug>(coc-rename)
nmap <C-t> :CocList tasks<CR>


""snippet"
"" Use <C-y> for trigger snippet expand.
"imap <C-y> <Plug>(coc-snippets-expand)
"
"" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)
"
"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'
"
"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'
"
"" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)


