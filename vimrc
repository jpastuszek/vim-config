set modeline                                                        "autoloading of this # vim: settings from edited files
set expandtab                                                       "expand tabs to spaces, when not an indent
set smarttab                                                        "let's be smart about our tabs
set shiftwidth=4                                                    "make tabs 4 spaces
set softtabstop=4                                                   "softtab value, 4 spaces
set tabstop=4                                                       "keep default for softtab compat.

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
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>

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
    " set columns=300                                                     "set width of window off open
    " set lines=50                                                        "height of window off open
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

map pa :set paste<CR>

function! Viki()
    edit ~/Misc/Viki/StartPage.viki
endfunction

nmap <silent> ;v  :call Viki()<CR>

set nobackup

