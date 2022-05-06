set nocompatible
filetype plugin indent on
set smartindent
syntax on

" :map command creates a key map that works in normal, visual, select and operator pending modes
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode
" Xnoremap are like map but do not expand the mapping they are pointing to

" copy and paste - https://stackoverflow.com/questions/2861627/paste-in-insert-mode
inoremap <C-v> <C-r>+
cnoremap <C-v> <C-r>+
nnoremap <C-v> "+p
vnoremap <C-c> "+y
vnoremap <C-x> "+d
" in alactritty C-c will also sent C-t as a workaround to trigger copy in vim
vnoremap <C-t> "+y
" nnoremap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
" vnoremap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

" load all plugins from bundle dir
execute pathogen#infect()

set modeline                                                        "autoloading of this
set softtabstop=0 noexpandtab                                       "expand tabs to spaces, when not an indent
set smarttab                                                        "let's be smart about our tabs
set shiftwidth=4                                                    "make tabs 4 spaces
set softtabstop=4                                                   "softtab value, 4 spaces
set tabstop=4                                                       "keep default for softtab compat.

set encoding=utf-8

" remove trailing lines
function! TrimWhiteSpace()
	let l = line(".")
	let c = col(".")
	:silent! %s/\s\+$//e
	:silent! %s/\t\+$//e
	:silent! %s#\($\n\s*\)\+\%$##
	call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" set spell
map ,s :set spell<cr>
map ,n :set nospell<cr>

set hlsearch                                                        "highlight what I find
set incsearch                                                       "show matches as I type
set ignorecase smartcase                                            "ignore case unless I type in multi-case

" Left and right are for switching buffers, not moving the cursor:
map <c-9> <ESC>:bn<CR>
map <c-0> <ESC>:bp<CR>

" disable search highlighting with a single keypress:
map - <ESC>:nohls<cr>:GitGutterAll<cr>

" Highlight every other line
map ,<Tab> <ESC>:set hls<CR>/\n.*\n/<CR>

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture
" whole line):
" Write
nmap ;w :. w! ~/.vimxfer<CR>
" Read
nmap ;r :r ~/.vimxfer<CR>
" Append
nmap ;a :. w! >>~/.vimxfer<CR>

colorscheme codedark

if has('gui_running')
    set columns=9999
    set lines=9999
    set guitablabel=%t                                                  "tabs display file name

    "kick it old school, no gui needed.
    set guioptions-=T                                                   "kill toolbar
    set guioptions-=m                                                   "kill menu
    set guioptions-=r                                                   "kill right scrollbar
    set guioptions-=l                                                   "kill left scrollbar
    set guioptions-=L                                                   "kill left scrollbar with multiple buffers
endif

if $TERM == 'st-256color'
	nnoremap <C-z> :echo 'st!'<cr>
endif

" English {{{
iab beacuse    because
iab becuase    because
iab acn        can
iab cna        can
iab centre     center
iab chnage     change
iab chnages    changes
iab chnaged    changed
iab chnagelog  changelog
iab Chnage     Change
iab Chnages    Changes
iab ChnageLog  ChangeLog
iab debain     debian
iab Debain     Debian
iab defualt    default
iab Defualt    Default
iab differnt   different
iab diffrent   different
iab emial      email
iab Emial      Email
iab figth      fight
iab figther    fighter
iab fro        for
iab fucntion   function
iab ahve       have
iab homepgae   homepage
iab logifle    logfile
iab lokk       look
iab lokking    looking
iab mial       mail
iab Mial       Mail
iab miantainer maintainer
iab amke       make
iab mroe       more
iab nwe        new
iab recieve    receive
iab recieved   received
iab erturn     return
iab retrun     return
iab retunr     return
iab seperate   separate
iab shoudl     should
iab soem       some
iab taht       that
iab thta       that
iab teh        the
iab tehy       they
iab truely     truly
iab waht       what
iab wiht       with
iab whic       which
iab whihc      which
iab yuo        you
iab databse    database
iab versnio    version
iab obnsolete  obsolete
iab flase      false
iab recrusive  recursive
iab Recrusive  Recursive
" }}}
" Days of week {{{
iab monday     Monday
iab tuesday    Tuesday
iab wednesday  Wednesday
iab thursday   Thursday
iab friday     Friday
iab saturday   Saturday
iab sunday     Sunday
" }}}

" have <F1> prompt for a help topic, rather than displaying the introduction
" page, and have it do this from any mode:
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

set number                    " line numbers
set undolevels=1000           " 1000 undos

set tags+=tags;/

set updatetime=400

let g:maplocalleader = "\\"

map ;p :set paste<CR>
map ;n :set nopaste<CR>

set nobackup

set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

" put .swp and others to /tmp dir and not pwd
set dir=/tmp//

" Ignore witespace in vimdiff
"set diffopt+=iwhite
set diffexpr=""

" Butane buffer management
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.

" NERD Commenter
" <C-_> is <C-\>!!!!
map <C-_> <plug>NERDCommenterToggle

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" eruby warnings in puppet templates; ruby variable shadowing warning
let g:syntastic_quiet_messages = {"regex": '.*ambiguous first argument.*\|possibly useless use of a variable in void context\|shadowing outer local variable'}

" Disabled by default
let g:syntastic_mode_map = { 'mode': 'passive' }

" vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>
nnoremap <leader>g :<C-u>Unite -no-split -buffer-name=grep	  grep:.<cr>
nnoremap <Leader>s :<C-u>Unite -no-split -buffer-name=grep    grep:.::<C-R><C-w><CR>

if executable('rg')
	" cargo install ripgrep
	let g:unite_source_grep_command = 'rg'
	let g:unite_source_grep_default_opts = '--vimgrep --color never'
	let g:unite_source_grep_recursive_opt = ''
	let g:unite_source_grep_encoding = 'utf-8'
endif

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
	" Play nice with supertab
	let b:SuperTabDisabled=1
	" Enable navigation with control-j and control-k in insert mode
	imap <buffer> <C-j>   <Plug>(unite_select_next_line)
	imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" vim-gitgutter
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1
highlight clear SignColumn

" vim-ruby
let g:ruby_spellcheck_strings = 1

" CamelCaseMotion
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,b <Plug>CamelCaseMotion_b
map <silent> ,e <Plug>CamelCaseMotion_e
map <silent> ,ge <Plug>CamelCaseMotion_ge

" FT Detect
" use github markdown by default
augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

au BufRead,BufNewFile *.pp setfiletype puppet
au BufRead,BufNewFile *.rb set tabstop=2
au BufRead,BufNewFile *.rb set shiftwidth=2

" netrw (neovim builtin)
let g:netrw_fastbrowse = 0

" load nvim configs and plugins
if has('nvim')
	execute pathogen#infect('bundle-nvim/{}')
	luafile ~/.vim/nvim.lua

	" Code navigation shortcuts
	" as found in :help lsp
	nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
	nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
	nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
	nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
	nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

	" Quick-fix
	nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

	" Goto previous/next diagnostic warning/error
	nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
	nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

	" have a fixed column for the diagnostics to appear in
	set signcolumn=yes
endif
