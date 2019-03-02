" Load pathogen paths
call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'inkarkat/vim-mark'
Plug 'vim-scripts/ingo-library'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'plytophogy/vim-virtualenv'

Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajmwagar/vim-dues'

Plug 'scrooloose/syntastic'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'fatih/vim-go'

call plug#end()



"------------------------------------------------------------------------------
" Custom color scheme
"------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
try
    colorscheme deus
catch
endtry

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1


" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" Toogle on/off
nmap <leader>o :NERDTreeToggle<cr>


"------------------------------------------------------------------------------
" Fugitive
"------------------------------------------------------------------------------
map ]] ]c
map [[ [c
map <leader>gdi :Gdiff<cr>
map <leader>gst :Gstatus<cr>
map <leader>dup :diffupdate<cr>

if executable('rg')
      let g:ackprg = "rg --column --vimgrep"
endif


let g:indentLine_char = '|'

silent! call repeat#set("\<Plug>tpope/vim-surround", v:count)
" ------------------------------------------------------------------------------
" Syntastic
" ------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = "--disable-all --enable=golint --enable=vetshadow  --enable=vet"
let g:syntastic_python_checkers = ['flake8']


nmap <F8> :TagbarToggle<CR>
" ------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_show_diagnostics_ui = 0
nnoremap gd :YcmCompleter GoTo<CR>


" ------------------------------------------------------------------------------
" CtrlSpace
" ------------------------------------------------------------------------------

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceGlobCommand = 'rg -l ".*"'
nnoremap <silent><C-p> :CtrlSpace O<CR>

" ------------------------------------------------------------------------------
" VimGO
" ------------------------------------------------------------------------------
let g:go_metalinter_autosave = 0
let g:go_term_enabled = 0
let g:go_term_mode = "split"
