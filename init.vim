" 加载vim的配置
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" === System
syntax on
syntax enable
set clipboard+=unnamedplus
" set autochdir

" === Editor behavior
set number
set relativenumber
set cursorline
set hidden
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set foldmethod=indent
set foldlevel=99
set foldenable
set showcmd
set wildmenu
set ignorecase
set smartcase
set wildmenu
set textwidth=80
set colorcolumn=+1
set updatetime=100
set lazyredraw
set nowrap
set mouse=a

" === Basic Mappings
let mapleader = ","
inoremap jk <ESC>
noremap j gj
noremap k gk
noremap <A-[> <C-o>
noremap <A-]> <C-i>

" 替换
noremap \s :%s//g<left><left>
vnoremap \s :s//g<left><left>
" Space to Tab
nnoremap <LEADER>tt :s/    /\t/<CR>:nohlsearch<CR>
vnoremap <LEADER>tt :s/    /\t/<CR>:nohlsearch<CR>

" Spell
" z= 查看拼写的备用选项
" ]s, [s查看拼写错误的
" C-x s 在写入模式检查拼写
noremap <LEADER>sc :set spell!<CR>

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap <LEADER>w :w<CR>
noremap <LEADER>q :q<CR>
noremap S :w<CR>

" Copy to system clipboard
vnoremap Y "*y
vnoremap ay "ay
vnoremap zy "zy
noremap <LEADER>ap "ap
noremap <LEADER>zp "zp
noremap <LEADER>p "0p
noremap <LEADER>P "0P
" make Y to copy till the end of the line
nnoremap Y y$

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" display
noremap <LEADER>zo :set wrap<CR>
noremap <LEADER>zc :set nowrap<CR>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

" === Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" === Window management
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap qf <C-w>o

noremap <LEADER>sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap <LEADER>sj :set splitbelow<CR>:split<CR>
noremap <LEADER>sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap <LEADER>sl :set splitright<CR>:vsplit<CR>

noremap <up> :res +1<CR>
noremap <down> :res -1<CR>
noremap <left> :vertical resize-1<CR>
noremap <right> :vertical resize+1<CR>
noremap _ :vertical resize-1<CR>
noremap + :vertical resize+1<CR>

" Place the two screens up and down
noremap <LEADER>su <C-w>t<C-w>K
" Place the ""two screens side by side
noremap <LEADER>ss <C-w>t<C-w>H

" Rotate screens
noremap <LEADER>rh <C-w>b<C-w>K
noremap <LEADER>rv <C-w>b<C-w>H

" === Buff management
" close buffer
noremap <LEADER>bo :Bdelete other<CR>
noremap <LEADER>bd :bd<CR>
noremap <LEADER>sbs :sb<Space>

" other
" Call figlet
noremap tx :r !figlet

filetype on
filetype plugin on
filetype indent on

" 如果第一次加载，则会自动下载plug.vim
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 安装插件管理先
" curl -fLo ~/.config/nvim/autoload/plug.vim \
"           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.config/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" 可以在文档中显示 git 信息
" You can jump between hunks with [c and ]c. You can preview, stage, and undo hunks with <leader>hp, <leader>hs, and <leader>hu respectively.
Plug 'airblade/vim-gitgutter'
" 可直接执行git相关的命令
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plug 'majutsushi/tagbar'

" Taglist
Plug 'liuchengxu/vista.vim'

Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite

" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'

" 包含很多snippets的定义
Plug 'honza/vim-snippets'

" 可以在 vim 中使用 tab 补全
Plug 'ervandew/supertab'

" 可以在 vim 中自动完成补全
" Plug 'Shougo/neocomplete.vim'

" go 主要插件 安装好后，要执行:GoInstallBinaries才能正常工作
Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go' }
" solidity
Plug 'tomlion/vim-solidity', { 'for': 'sol' }
Plug 'vim-syntastic/syntastic', { 'for': 'sol' }

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" 重命令当前文件名
Plug 'danro/rename.vim'

" 多光标
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-[j]Down/Ctrl-[k]Up
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" 注释
Plug 'tomtom/tcomment_vim'

" 光标查找定位
Plug 'Lokaltog/vim-easymotion'

" 配色
Plug 'ajmwagar/vim-deus'

" js JavaScript的高亮插件
Plug 'yuezk/vim-js', { 'for': ['php', 'html', 'javascript'] }

" 文件查找
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" 多文件内容的查找
" 需要在.zshrc中添加以去掉警告 export LC_ALL=C
Plug 'mileszs/ack.vim'
" 内容替换
" Plug 'brooth/far.vim'

" 快速添加和修改成对出现的符号
Plug 'tpope/vim-surround'
" <Enter>快速选择代码块
Plug 'gcmt/wildfire.vim'

" 设置status的状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ojroques/vim-scrollstatus'

" 标签管理
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
"
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>        Remove all markers
Plug 'kshenoy/vim-signature'
" Initialize plugin system

" 日历
" Press E key to view the event list, and T key to view the task list.
" Also, press ? key to view a quick help.
" You can switch between views with < and > keys.
Plug 'itchyny/calendar.vim'

" coc自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 调试代码
Plug 'puremourning/vimspector', {'do': './install_gadget.py
            \ --enable-c --enable-python --enable-go --enable-rust'}

"buf操作
Plug 'Asheq/close-buffers.vim'

"ranger
Plug 'kevinhwang91/rnvimr'

"精致的顶栏
"F5 --- change tabline mode
"N BS --- go to N tab (in tabs mode) or N buffer (in buffers mode)
Plug 'mg979/vim-xtabline'

" 复制粘贴
" Plug 'tpope/vim-repeat'
" Plug 'svermeulen/vim-easyclip'

" 翻译
" Plug 'voldikss/vim-translator'
call plug#end()


" 开始插件的配置
"==============================================================================
" vimspector 插件
"==============================================================================
"
" | Key        | Mapping                                     | Function                                                            |
" |------------|---------------------------------------------|---------------------------------------------------------------------|
" | F5         | <Plug>VimspectorContinue                    | When debugging, continue. Otherwise start debugging.                |
" | F3         | <Plug>VimspectorStop                        | Stop debugging.                                                     |
" | F4         | <Plug>VimspectorRestart                     | Restart debugging with the same configuration.                      |
" | F6         | <Plug>VimspectorPause                       | Pause debuggee.                                                     |
" | F9         | <Plug>VimspectorToggleBreakpoint            | Toggle line breakpoint on the current line.                         |
" | <leader>F9 | <Plug>VimspectorToggleConditionalBreakpoint | Toggle conditional line breakpoint or logpoint on the current line. |
" | F8         | <Plug>VimspectorAddFunctionBreakpoint       | Add a function breakpoint for the expression under cursor           |
" | <leader>F8 | <Plug>VimspectorRunToCursor                 | Run to Cursor                                                       |
" | F10        | <Plug>VimspectorStepOver                    | Step Over                                                           |
" | F11        | <Plug>VimspectorStepInto                    | Step Into                                                           |
" | F12        | <Plug>VimspectorStepOut                     | Step out of current function scope                                  |
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB' ]

"==============================================================================
" NERDTree 插件
"==============================================================================
"
" 打开和关闭NERDTree快捷键
nmap <LEADER>n :NERDTreeToggle<CR>
" 显示在右边
let g:NERDTreeWinPos = "right"
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2

"==============================================================================
"  majutsushi/tagbar 插件
"==============================================================================
"
" majutsushi/tagbar 插件打开关闭快捷键
nmap T :TagbarToggle<CR>
" 设置tagbar子窗口的位置出现在主编辑区的左边
let tagbar_left=1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"==============================================================================
"  nerdtree-git-plugin 插件
"==============================================================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeShowIgnoredStatus = 1

"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

noremap go :GoRun<CR>
noremap gb :GoBuild<CR>

"==============================================================================
" coc 插件
"==============================================================================
let g:coc_global_extensions = [
	\ 'coc-marketplace',
	\ 'coc-clangd',
	\ 'coc-rust-analyzer',
	\ 'coc-css',
	\ 'coc-gitignore',
    \ 'coc-snippets',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-vimlsp',
    \ 'coc-translator',
	\ 'coc-yaml',
	\ 'coc-yank']

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" coc-translator
nmap <leader>ts <Plug>(coc-translator-p)

let g:snips_author = 'LiuL'
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"==============================================================================
"  lazygit
"==============================================================================
"" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_use_neovim_remote = 1 " for neovim-remote support

"==============================================================================
"  rnvimr
"==============================================================================
" ranger配置
" nnoremap <LEADER>ra :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
nnoremap <LEADER>ra :RnvimrToggle<CR>

"" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Disable a border for floating window
let g:rnvimr_draw_border = 0

" Hide the files included in gitignore
let g:rnvimr_hide_gitignore = 1

" Change the border's color
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Add a shadow window, value is equal to 100 will disable shadow
let g:rnvimr_shadow_winblend = 70

" Draw border with both
let g:rnvimr_ranger_cmd = 'ranger --cmd="set draw_borders both"'

" Link CursorLine into RnvimrNormal highlight in the Floating window
highlight link RnvimrNormal CursorLine

" nnoremap <silent> <M-o> :RnvimrToggle<CR>
" tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
"
" " Resize floating window by all preset layouts
" tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
"
" " Resize floating window by special preset layouts
" tnoremap <silent> <M-l> <C-\><C-n>:RnvimrResize 1,8,9,11,5<CR>
"
" " Resize floating window by single preset layout
" tnoremap <silent> <M-y> <C-\><C-n>:RnvimrResize 6<CR>

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }

" Add views for Ranger to adapt the size of floating window
let g:rnvimr_ranger_views = [
            \ {'minwidth': 90, 'ratio': []},
            \ {'minwidth': 50, 'maxwidth': 89, 'ratio': [1,1]},
            \ {'maxwidth': 49, 'ratio': [1]}
            \ ]

" Customize the initial layout
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.7 * &columns)),
            \ 'height': float2nr(round(0.7 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
"==============================================================================
" FZF
"==============================================================================
nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-f> :Rg<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-b> :Buffers<CR>
noremap <leader>; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-w> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

"==============================================================================
" xtabline
"==============================================================================
let g:xtabline_settings = {}
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']
"==============================================================================
"  其他插件配置
"==============================================================================
" junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" markdwon 的快捷键
" map <silent> <F5> <Plug>MarkdownPreview
" map <silent> <F6> <Plug>StopMarkdownPreview
noremap <LEADER>tm :TableModeToggle<CR>

" vim-visual-multi的快捷键
map <C-j> <C-Down>
map <C-k> <C-Up>

" air-line设置
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = '%{ScrollStatus()}'

" 使用deus配色
color deus

" ack配置
noremap <LEADER>f :Ack!<Space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --nogroup --column'
endif


" supertab 配置
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

inoremap <expr> <c-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <c-k> pumvisible() ? "\<C-P>" : "k"

" 设置半透明
hi Normal ctermfg=252 ctermbg=none

" vista
noremap T :Vista!!<CR>

" suda.vim
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%
