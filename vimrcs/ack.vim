
if executable('ag')
	  let g:ackprg = 'ag --vimgrep'
  endif

"默认不递归搜索， 如果需要搜索整个工程，在工程根目录下的workspace.vim去掉-n
"或者使用 -r 参数
command Todo Ack! -n 'TODO|FIXME|CHANGED|BUG|HACK'
