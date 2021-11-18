

nmap <leader>ff :Leaderf file --popup<CR>
let g:Lf_DefaultMode='NameOnly'

let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg', '.ccls-cache'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.ccls', '.workspace', '.project']
let g:Lf_UseCache = 0
