

nmap <leader>f :Leaderf file --popup<CR>
let g:Lf_DefaultMode='NameOnly'

let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg', '.ccls-cache', '.cache', 'external', 'bazel-*'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.ccls', '.workspace', '.project']
let g:Lf_UseCache = 1
let g:Lf_RecurseSubmodules = 1
let g:Lf_DefaultExternalTool = "rg"
let g:Lf_PreviewResult = {
        \ 'File': 1,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 1,
        \ 'Gtags': 0
        \}
let g:Lf_GtagsAutoGenerate = 0
" 是否搜索软链指向的目录
let g:Lf_FollowLinks = 1   
" 禁止搜索哪些文件
let g:Lf_MruFileExclude = ['*.so', '*.a']
" 是否跳转到已打开的buffer
let g:Lf_JumpToExistingWindow = 0
