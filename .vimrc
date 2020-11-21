"vimrc :m)
"---------

"~ syn match Oddlines "^.*$" contains=ALL nextgroup=Evenlines skipnl
"~ syn match Evenlines "^.*$" contains=ALL nextgroup=Oddlines skipnl
"~ hi OddLines     cterm=NONE ctermbg=234
"~ hi Evenlines ctermbg=magenta guibg=#FFCCFF

" C-N : completion
" C-G : file info

set spell

" no bells at all
set visualbell
set t_vb=

" enable backspacing everywhere
set backspace=indent,eol,start
" enable left/right over newlines
set whichwrap+=<,>,h,l,[,]

set encoding=utf-8

" splits
" ------
set splitright
set splitbelow

" ctrl-moves to switch between splits
nmap <C-h>       <C-w>h
nmap <C-l>       <C-w>l
nmap <C-j>       <C-w>j
nmap <C-k>       <C-w>k

" ctrl  to resize splits, only make bigger, vertically, then horizontally
" really just out of ideas, currently :-)
nmap <C-n>     <C-w>5+
nmap <C-m>     <C-w>5>

" Scroll when 2 lines from top/bottom
set scrolloff=2

" shift-moves to switch between tabs (and ctrl-g to show filename :-)
nmap <S-h>       gT<C-g>
nmap <S-l>       gt<C-g>

" use space to scroll
nmap <Space> <C-D>

" syntax highlighting on
syntax enable

" highlight searches
:set hlsearch

" incremental search
set incsearch

" show Normal mode commands as they are entered
:set showcmd

" colorscheme
if has("gui_running")
    " macvim does its own style of definition..
    set guifont=Ubuntu\ Mono:h22
    " X11 style:
    " set guifont=Ubuntu\ Mono\ 17
    " turn off menu, toolbar, and scrollbar
    set go-=T
    set go-=r
    set go-=l
    set go-=m
    " stop cursor from blinking
    set guicursor=a:blinkon0
endif

set t_Co=256
colorscheme maettu_colors_dark
nmap csl :colorscheme maettu_colors_light<CR>
nmap csd :colorscheme maettu_colors_dark<CR>

" use an orange cursor in insert mode
" let &t_SI = "\<Esc>]12;orange\x7"
" use a red cursor otherwise
" let &t_EI = "\<Esc>]12;red\x7"
" silent !echo -ne "\033]12;red\007"
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"

" tabs
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
"Convert all tabs that are typed into spaces
"but don't expand in makefiles..
let _curfile = expand("%:t")
if _curfile =~ ".*\.am$" || _curfile =~ ".*\.ac$"
    set noexpandtab
else
    set expandtab
endif
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else

" autoindent
set autoindent      "Retain indentation on next line
set smartindent     "Turn on autoindenting of blocks
inoremap # X<C-H>#| "And no magic outdent for comments
nnoremap <silent> >> :call ShiftLine()<CR>| "And no shift magic on comments

function! ShiftLine()
    set nosmartindent
    normal! >>
    set smartindent
endfunction

" json files: tabstops 2 chars
au FileType json setl sw=2 sts=2 et

" cursor position and ruler
set number
set ruler
" cursor crosshair
set cursorline
set cursorcolumn
set colorcolumn=100

" show (trailing) whitespace
match Tabs /\t/
set listchars=tab:→\ ,trail:·
set list

" remove trailing whitespace on save
function! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col (".")
    let _s = @/  "save last search..
    %s/\s\+$//e
    " had some issues with inserted 'non-breaking space': replace with regular space
    %s/\%xa0/ /e
    call cursor(l,c)
    let @/ = _s  "and restore it
endfunction

" TODO make this a function, not automatic on file write
autocmd Filetype * autocmd BufWritePre <buffer> :call<SID>StripTrailingWhitespace()

" Perl stuff
inoremap #p<CR> #!/usr/bin/perl<CR>use 5.10.1;<CR>use strict;<CR>use warnings;<CR><CR>

" experimental: when writing 'method' parens and curly block is auto-added
imap #m method (){<CR>}<UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>


" shortcuts. I am using a Swiss german keyboard which has curlies and brakets in uncomfy places.
" But I do have äöü (which I never use for programming which happens in English).
" type first pair and edit inside
inoremap ää {}<left>
inoremap üü []<left>
inoremap öö ()<left>
" empty parens / curlies and edit after
inoremap ö<space> ()
inoremap ä<space> {}
inoremap ü<space> []

" open a new block and edit inside
inoremap ö<CR> (<CR>);<Esc>O<space><space><space><space>
inoremap ä<CR> {<CR>}<Esc>O
inoremap ü<CR> [<CR>]<Esc>O

" mouse support
" set mouse=a
" turn off mouse support due to copy-paste issues in tmux etc
set ttymouse=xterm2
set mouse=a

set foldmethod=indent       "fold on indent..
set foldlevel =20           "open all folds when opening a file

" to not stay in normal mode after safe, use <C-O> instead of <Esc>
imap <C-S> <Esc>:w<CR>

" ctrl-c and ctrl-v to copy-and-paste
map <C-C> "+y
imap <C-C> <C-O>"+y<CR>
map <C-V> "+gP
imap <C-V> <C-O>"+gP<CR>

" smooth scrolling :-)
"~ function! SmoothScroll(up)
"~     if a:up
"~         let scroll_action = ""
"~     else
"~         let scroll_action = ""
"~     endif

"~     exec "norm " . scroll_action
"~     redraw
"~     let counter=1
"~     while counter < &scroll
"~         let counter += 1
"~         sleep 5m
"~         redraw
"~         exec "norm" . scroll_action
"~     endwhile
"~ endfunction

"~ nnoremap <C-U> :call SmoothScroll(1)<CR>
"~ nnoremap <C-D> :call SmoothScroll(0)<CR>
"~ inoremap <C-U> <Esc>:call SmoothScroll(1)<CR>i
"~ inoremap <D-D> <Esc>:call SmoothScroll(0)<CR>i

"comment out in visual mode using <alt>-#
autocmd BufNewFile,BufRead * let b:cmt = exists('b:cmt') ? b:cmt : '#->'
autocmd FileType *sh,awk,python,perl,perl6,ruby,yaml let b:cmt = exists('b:cmt') ? b:cmt : '#\~'
autocmd FileType vim let b:cmt = exists('b:cmt') ? b:cmt : '"\~'
autocmd FileType c,cpp,javascript  let b:cmt = exists('b:cmt') ? b:cmt : '\/\/\~'

function! Block_comment(comment)
    "let comment = a:comment
    let comment = exists('b:cmt') ? b:cmt : '#~'
    "echo comment
    let line = getline('.')
    if (line =~# '^\s*$')
        " leave as is
    elseif (line =~# '^'.comment.' ')
        let replacement = substitute(line, comment.' ', '', 'g')
        call setline ('.', replacement)
    elseif (line =~# '^'.comment)
        " also replace bare comments (empty out-commented line after
        " trailing whitespace removed, e.g.)
        let replacement = substitute(line, comment, '', 'g')
        call setline ('.', replacement)
    else
        let replacement = substitute(line, '^', comment.' ', 'g')
        call setline('.', replacement)
    endif
endfunction
vmap <silent># :call Block_comment('#\~')<CR>
vmap <silent>// :call Block_comment('\/\/\~')<CR>

" Like tabdo but restore the current tab.
function! TabDo(command)
  let currTab=tabpagenr()
  execute 'tabdo ' . a:command
  execute 'tabn ' . currTab
endfunction

com! -nargs=+ -complete=command TD call TabDo(<q-args>)
" Use perl compiler for all *.pl and *.pm files.
autocmd BufNewFile,BufRead *.p? compiler perl

" enable autocomplete for html, xml, css (otherwise editing/deleting is terribly slow)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" hit ! and show color groups under cursor
map ! :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\                 . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\       . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

