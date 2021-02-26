set hidden
"语法检查等待时间
set updatetime=100
set signcolumn=yes

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

let g:coc_last_hover_message= 1
"let g:UltiSnipsSnippetDirectories = [ "~/.vim/snippets/vim-snippet"]

"跳转到定义
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :<C-U>call       CocActionAsync('jumpDefinition')<CR>

"跳转到声明
"nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gc :<C-U>call       CocActionAsync('jumpDeclaration')<CR>
"跳转到类型定义
"nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gy :<C-U>call       CocActionAsync('jumpReferences')<CR>
"跳转到实现
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gi :<C-U>call       CocActionAsync('jumpImplementation')<CR>
"跳转到引用
"nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr :<C-U>call       CocActionAsync('jumpReferences')<CR>
"跳转到下一个错误
"nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> ge :<C-U>call       CocActionAsync('diagnosticNext',     'error')<CR>

"按K显示document in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
command! Doc call <SID>show_documentation()<CR>
command! Fix call <C-U>call CocActionAsync('doQuickfix')<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


"rename
nmap <leader>rn <Plug>(coc-rename)
nmap <C-t> :CocList tasks<CR>
nmap <leader>c :CocCommand<Cr>


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


call coc#add_extension('coc-json', 'coc-tasks', 'coc-snippets')
call coc#add_command('doc', 'Doc',  'echo doc') 

command! -nargs=0 Format :call CocAction('format')
call coc#add_command('Format', 'Format',  'format this file code') 
call coc#add_command('TagFunction', 'LeaderfFunction',  'call LeaderfFunction') 

" 选择模式下，选中整个方法或方法内部所有内容
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" class obj
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
