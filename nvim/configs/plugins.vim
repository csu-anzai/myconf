call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

" General plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'w0rp/ale'
Plug 'kshenoy/vim-signature'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/BufOnly.vim'
Plug 'wellle/targets.vim'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-subversive'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'

" Language support
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
Plug 'fatih/vim-go'                            " Go support
Plug 'lifepillar/pgsql.vim'                    " PostgreSQL syntax highlighting
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'davidhalter/jedi-vim'                     " Python support
Plug 'deoplete-plugins/deoplete-jedi'                     " Python auto completion
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'sheerun/vim-polyglot'

" Colorschemes
Plug 'sainnhe/gruvbox-material'

" User Interface
Plug 'tpope/vim-obsession'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'macthecadillac/lightline-gitdiff'
Plug 'maximbaz/lightline-ale'
Plug 'Palpatineli/lightline-lsc-nvim'
Plug 'godlygeek/tabular'

"Plug 'sainnhe/tmuxline.vim', {'branch': 'dev'}
"
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
call plug#end()
"----------------------------------------------
" Plug 'svermeulen/vim-cutlass'
"----------------------------------------------
nnoremap <DEL> d
xnoremap <DEL> d
nnoremap <DEL><DEL> dd

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 20,
\ })
"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\   'python': ['autopep8'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters = { 'go': ['golangci-lint'], 'python': ['flake8'] }
let g:ale_go_golangci_lint_options='-p bugs -p unused -p style'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_goimports_options = '-local gordon'
let g:ale_python_autopep8_options = '--max-line-length 120'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0

"----------------------------------------------
" Plugin: tpope/vim-repeat
"----------------------------------------------
silent! call repeat#set("\<Plug>tpope/vim-surround", v:count)

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
let g:go_auto_type_info = 0

" Highlight variable uses
let g:go_auto_sameids = 0

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"
" replace gocode
let g:go_info_mode = 'gopls'

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
