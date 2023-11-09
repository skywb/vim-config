set hidden
"语法检查等待时间
set updatetime=300
set signcolumn=number

" autocmd CursorHold * silent call CocActionAsync('highlight')
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
command! Doc :call <SID>show_documentation()<CR>
command! Fix :call CocActionAsync('doQuickfix')<CR>

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
nmap <leader>l :CocList<Cr>

nmap <leader>ol :CocList outline<Cr>

call coc#add_extension('coc-json', 'coc-tasks', 'coc-snippets', 'coc-explorer', 'coc-pairs', 'coc-yaml', 'coc-snippets', 'coc-json', 'coc-git')
" extera extension
" call coc#add_extension('@yaegassy/coc-vitest', )
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

vmap =  <Plug>(coc-format-selected)
"nmap =  <Plug>(coc-format-selected)
nmap <leader>d :CocCommand explorer<CR>


" float scroll
nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


" for vimspector
call coc#add_command('VimspectorStop', 'call vimspector#Stop()',  'stop debuggin') 
call coc#add_command('VimspectorContinue', 'call vimspector#Continue()', 'When debugging, continue. Otherwise start debugging.')
call coc#add_command('VimspectorStop', 'call vimspector#Stop()', 'Stop debugging.')
call coc#add_command('VimpectorRestart', 'call vimspector#Restart()', 'Restart debugging with the same configuration.')
call coc#add_command('VimspectorPause', 'call vimspector#Pause()', 'Pause debuggee.')
call coc#add_command('VimspectorBreakpoints', 'call vimspector#ListBreakpoints()', 'Show/hide the breakpoints window')
call coc#add_command('VimspectorToggleBreakpoint', 'call vimspector#ToggleBreakpoint()', 'Toggle line breakpoint on the current line.')
call coc#add_command('VimspectorToggleConditionalBreakpoint', 'call vimspector#ToggleBreakpoint( { trigger expr,  hit count expr } )', 'Toggle conditional line breakpoint or logpoint on the current line.')
"call coc#add_command('VimspectorAddFunctionBreakpoint', 'call vimspector#AddFunctionBreakpoint("<cexpr>")', 'Add a function breakpoint for the expression under cursor')
call coc#add_command('VimspectorGoToCurrentLine', 'call vimspector#GoToCurrentLine()', 'Reset the current program counter to the current line')
call coc#add_command('VimspectorRunToCursor', 'call vimspector#RunToCursor()', 'Run to Cursor')
call coc#add_command('VimspectorStepOver', 'call vimspector#StepOver()', 'Step Over')
call coc#add_command('VimspectorStepInto', 'call vimspector#StepInto()', 'Step Into')
call coc#add_command('VimspectorStepOut', 'call vimspector#StepOut()', 'Step out of current function scope')
call coc#add_command('VimspectorDisassemble', 'call vimspector#ShowDisassembly()', 'Show disassembly. Enable instruction stepping')
call coc#add_command('VimspectorUpFrame', 'call vimspector#UpFrame()', 'Move up a frame in the current call stack')
call coc#add_command('VimspectorDownFrame', 'call vimspector#DownFrame()', 'Move down a frame in the current call stack')
call coc#add_command('VimspectorJumpToNextBreakpoint', 'call vimspector#JumpToNextBreakpoint()', 'Move Cursor to the next breakpoint in current file')
call coc#add_command('VimspectorJumpToPreviousBreakpoint', 'call vimspector#JumpToPreviousBreakpoint()', 'Move Cursor to the previous breakpoint in current file')
call coc#add_command('VimspectorJumpToProgramCounter', 'call vimspector#JumpToProgramCounter()', 'Move Cursor to the program counter in the current frame')
call coc#add_command('AddBreakpoint', 'call vimspector#ToggleBreakpoint()', 'Add break point')

" for coc-translator
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
