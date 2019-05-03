call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

" General plugins
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'rbgrouleff/bclose.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/BufOnly.vim'
Plug 'wellle/targets.vim'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'mbbill/undotree'
Plug 'qpkorr/vim-bufkill'
Plug 'majutsushi/tagbar'

" Language support
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
Plug 'fatih/vim-go'                            " Go support
Plug 'lifepillar/pgsql.vim'                    " PostgreSQL syntax highlighting
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } " Go auto completion
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'davidhalter/jedi-vim'                     " Python support
Plug 'deoplete-plugins/deoplete-jedi'                     " Python auto completion

" Colorschemes
Plug 'ajmwagar/vim-dues'

call plug#end()

"----------------------------------------------
" Plugin: MattesGroeger/vim-bookmarks
"----------------------------------------------
" Auto save bookmarks
let g:bookmark_auto_save = 1

" Store the bookmarks in the projects
let g:bookmark_save_per_working_dir = 1

" Disable the default key mappings
let g:bookmark_no_default_key_mappings = 1

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = { 'go': ['golangci-lint'], 'python': ['flake8'] }
let g:ale_go_golangci_lint_options='-p bugs -p unused -p style'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_goimports_options = '-local gordon'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_python_black_options = '-l 120 -S'

"----------------------------------------------
" Plugin: tpope/vim-repeat
"----------------------------------------------
silent! call repeat#set("\<Plug>tpope/vim-surround", v:count)

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 0

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '|'
let g:airline_symbols.maxlinenr = '|'

"----------------------------------------------
" Plugin: mileszs/ack.vim
"----------------------------------------------
if executable('rg')
      let g:ackprg = "rg --column --vimgrep"
endif

"----------------------------------------------
" Plugin: neomake/neomake
"----------------------------------------------
" Configure signs.
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_open_list = 2

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 35
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

"----------------------------------------------
" Plugin: Shougo/neosnippet
"----------------------------------------------
" Disable the default snippets (needed since we do not install
" Shougo/neosnippet-snippets).
"
" Below you can disable default snippets for specific languages. If you set the
" language to _ it sets the default for all languages.
let g:neosnippet#disable_runtime_snippets = {
    \ 'go': 1
\}

" Set the path to our snippets
let g:neosnippet#snippets_directory='~/myconf/nvim/snippets'


"----------------------------------------------
" Plugin: 'terryma/vim-multiple-cursors'
"----------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-b>'
let g:multi_cursor_quit_key='<Esc>'

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

" Enable autocomplete of unimported packages
let g:deoplete#sources#go#unimported_packages = 0
"----------------------------------------------
" Plugin: svermeulen/vim-yoink
"----------------------------------------------

let g:yoinkIncludeDeleteOperations = 1

"----------------------------------------------
" Plugin: davidhalter/jedi-vim
"----------------------------------------------
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""

"----------------------------------------------
" Plugin 'junegunn/fzf.vim'
"----------------------------------------------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Language: Go
" Tagbar configuration for Golang
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

"----------------------------------------------
" Language: Golang
"----------------------------------------------
" Run goimports when running gofmt
let g:go_fmt_options = '-s'

" Set neosnippet as snippet engine
let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 0

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
let g:neomake_go_enabled_makers = [ 'go', 'golangci-lint' ]
let g:neomake_go_golangci_lint_maker = {
  \ 'exe': 'golangci-lint',
  \ 'args': [
  \   'run',
  \   '--out-format=line-number',
  \   '--print-issued-lines=false',
  \   '--enable-all',
  \ ],
  \ 'append_file': 0,
  \ 'output_stream': 'stdout',
  \ 'cwd': '%:h',
  \ 'errorformat':
  \ '%f:%l:%c: %m'
  \ }
