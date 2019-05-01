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
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

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
nnoremap <leader>bo :BufOnly<cr>
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

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprevious<cr>
"
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap < <gv
vnoremap > >gv

" Toggle paste mode on and off
map <F2> :setlocal paste!<cr>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"----------------------------------------------
" Plugin: MattesGroeger/vim-bookmarks
"----------------------------------------------
" Configure key mappings
" This part also fixes conflicts with NERDTree
function! BookmarkMapKeys()
    nmap <leader>mm :BookmarkToggle<cr>
    nmap <leader>mi :BookmarkAnnotate<cr>
    nmap <leader>mn :BookmarkNext<cr>
    nmap <leader>mp :BookmarkPrev<cr>
    nmap <leader>ma :BookmarkShowAll<cr>
    nmap <leader>mc :BookmarkClear<cr>
    nmap <leader>mx :BookmarkClearAll<cr>
    nmap <leader>mkk :BookmarkMoveUp
    nmap <leader>mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap <leader>mm
    unmap <leader>mi
    unmap <leader>mn
    unmap <leader>mp
    unmap <leader>ma
    unmap <leader>mc
    unmap <leader>mx
    unmap <leader>mkk
    unmap <leader>mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

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
nnoremap <c-b> :Buffers<cr>

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <F3> :TagbarToggle<cr>

"----------------------------------------------
" Plugin: mileszs/ack.vim
"----------------------------------------------
" Open ack
nnoremap <leader>a :Ack!<space>

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
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gdt <Plug>(go-def-tab)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gi :GoImplements<cr>
au FileType go nmap <leader>gh :GoSameIdsToggle<cr>

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python nmap <F10> :exec '!python' shellescape(@%, 1)<cr>
au FileType python nmap gd :call jedi#goto()<cr>
au FileType python nmap <leader>gu :call jedi#usages()<cr>
au FileType python nmap <leader>ga :call jedi#goto_assignments()<cr>
