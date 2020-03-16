
"配置文件
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'


let g:ycm_confirm_extra_conf=0
"let max_diagnostics_to_display=0

"补全菜单设置为灰色
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black


"设置选择候选项的按键
"let g:ycm_key_list_select_completion = ['<c-n>', 'Down']
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
"let g:ycm_key_list_previous_completion = ['<Tab>', '\<Tab>']
let g:ycm_key_invoke_completion = '<C-b>'

nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>



"完成补全之后自动关闭函数声明的窗口
let g:ycm_autoclose_preview_window_after_completion=1

" warning标记
let g:ycm_warning_symbol = 'U'
" 错误标记
let g:ycm_error_symbol = 'X'

" turn off YCM
nnoremap <leader>y :let g:ycm_auto_trigger=0<CR>
"turn on YCM
nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }





