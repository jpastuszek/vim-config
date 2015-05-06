call pathogen#infect()
set modeline                                                        "autoloading of this
set noexpandtab                                                       "expand tabs to spaces, when not an indent
set smarttab                                                        "let's be smart about our tabs
set shiftwidth=4                                                    "make tabs 4 spaces
set softtabstop=4                                                   "softtab value, 4 spaces
set tabstop=4                                                       "keep default for softtab compat.

" remove trailing lines
function! TrimWhiteSpace()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	%s/\t\+$//e
	call cursor(l, c)
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

"set spell
map ,s :set spell<cr>
map ,n :set nospell<cr>

set hlsearch                                                        "highlight what I find
set incsearch                                                       "show matches as I type
set ignorecase smartcase                                            "ignore case unless I type in multi-case

set nocompatible
filetype plugin indent on
syntax on

" Left and right are for switching buffers, not moving the cursor:
map <c-9> <ESC>:bn<CR>
map <c-0> <ESC>:bp<CR>

" disable search highlighting with a single keypress:
map - :nohls<cr>

" Highlight every other line
map ,<Tab> :set hls<CR>/\n.*\n/<CR>

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture
" whole line):
" Write
nmap ;w :. w! ~/.vimxfer<CR>
" Read
nmap ;r :r ~/.vimxfer<CR>
" Append
nmap ;a :. w! >>~/.vimxfer<CR>

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
"}}}
" Days of week {{{
iab monday     Monday
iab tuesday    Tuesday
iab wednesday  Wednesday
iab thursday   Thursday
iab friday     Friday
iab saturday   Saturday
iab sunday     Sunday
"}}}

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

" Viki config
let g:vikiOpenFileWith_ANY = "exec 'silent !kfmclient exec '. escape('%{FILE}', ' &!%')"
let g:vikiOpenUrlWith_http = "exec 'silent !firefox '. escape('%{URL}', ' &!%')"
au BufRead,BufNewFile *.viki set ft=viki
let g:vikiNameSuffix = ".viki"

let g:maplocalleader = "\\"

au BufRead,BufNewFile *.rb set tabstop=2
au BufRead,BufNewFile *.rb set shiftwidth=2

" On ubuntu (running Vim in gnome-terminal)
" The reason for the double-command on <C-c> is due to some weirdness with the X clipboard system.
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" sessions
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
map <c-q> :mksession! ~/.vim/.session <cr>
map <c-s> :source ~/.vim/.session <cr>

" tabs
" map tl :tabnext<CR> " use gt
" map th :tabprev<CR> " use gT
map tn :tabnew<CR>
map td :tabclose<CR>

map ;p :set paste<CR>
map ;n :set nopaste<CR>

function! Viki()
    edit ~/Misc/Viki/StartPage.viki
endfunction

nmap <silent> ;v  :call Viki()<CR>

set nobackup

set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

" put .swp and others to /tmp dir and not pwd
set dir=/tmp//

" use github markdown by default
augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" start nerdtree when no file was selected
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map <C-n> :NERDTreeToggle<CR>

" Git
map <C-l> :Git push<CR>
map <C-k> :Git commit -a<CR>

" Ignore witespace in vimdiff
set diffopt+=iwhite
set diffexpr=""

" Buffer management
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" eruby warnings in puppet templates; ruby variable shadowing warning
let g:syntastic_quiet_messages = {"regex": 'possibly useless use of a variable in void context\|shadowing outer local variable'}

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

" Ag (the_platinum_searcher)
" brew install pt
if executable('pt')
	let g:unite_source_grep_command = 'pt'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor'
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
