"----------------------------------------------
" Searching
"----------------------------------------------

inoremap jj <esc>
nnoremap JJJJ <nop>

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

map <space> /

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between buffers with Shift + arrow key...
nnoremap <Left> :bprevious<cr>
nnoremap <Right> :bnext<cr>
nnoremap <Up> :BufOnly<cr>
nnoremap <Down> :bd<cr>
nnoremap <Tab> :e #<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"----------------------------------------------
" Splits
"----------------------------------------------
" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>
nnoremap <leader>Q :q!<cr>

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"------------------------------------------------------------------------------
" Visual mode related
"------------------------------------------------------------------------------

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
vnoremap <silent> <leader>rr :call VisualSelection('replace', '')<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap < <gv
vnoremap > >gv

" Toggle paste mode on and off
map <F2> :setlocal paste!<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Move page ...
nnoremap <C-Left> <C-b>
nnoremap <C-Right> <C-f>
nnoremap <C-Up> <C-u>
nnoremap <C-Down> <C-d>

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"----------------------------------------------
" Plugin: w0rp/ale
"----------------------------------------------
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

"----------------------------------------------
" Plugin: easymotion/vim-easymotion
"----------------------------------------------
" Enable support for bidirectional motions
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader>p :BTags<cr>
nnoremap <leader>r :Rg<cr>

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
" Locate file in hierarchy quickly
nnoremap <leader>T :NERDTreeFind<cr>

" Toogle on/off
nnoremap <leader>o :NERDTreeToggle<cr>

"----------------------------------------------
" Plugin: Shougo/neosnippet
"----------------------------------------------

" Keybindings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"----------------------------------------------
" Plugin: svermeulen/vim-yoink
"----------------------------------------------
nmap <leader>l <plug>(YoinkPostPasteSwapBack)
nmap <leader>; <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)


"----------------------------------------------
" Plugin: svermeulen/vim-subversive
"----------------------------------------------
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)

nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

"----------------------------------------------
" Language: Golang
"----------------------------------------------

" Mappings
au FileType go nmap <F5> :DlvTest<cr>
au FileType go nmap <F6> :DlvToggleBreakpoint<cr>
au FileType go nmap <F8> :Neomake golangci_lint<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gi :GoImplements<cr>
au FileType go nmap <leader>gh :GoSameIdsToggle<cr>
au FileType go nmap <leader>gn :GoInfo<cr>

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python nmap <F10> :exec '!python' shellescape(@%, 1)<cr>
au FileType python nmap gd :call jedi#goto()<cr>
au FileType python nmap <leader>gu :call jedi#usages()<cr>
au FileType python nmap <leader>ga :call jedi#goto_assignments()<cr>
