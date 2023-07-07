

nmap <leader>f :Leaderf file --popup<CR>
let g:Lf_DefaultMode='NameOnly'

let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg', '.ccls-cache', '.cache'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.ccls', '.workspace', '.project']
let g:Lf_UseCache = 1
let g:Lf_RecurseSubmodules = 1
let g:Lf_DefaultExternalTool = "rg"
let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 0,
        \ 'Function': 0,
        \ 'Line': 0,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}
