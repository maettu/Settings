:" Vim color file
" Name:       maettu_colors
" Maintainer: :m) <matthias@puffin.ch>
" Homepage:   --

" looks like gvim theme is not autoloaded at startup without this (?!)
let colors_name = "maettu_colors"

let b_01 = "#86B4CF"
let b_05 = "#49708A"

"~ exe 'hi Comment guibg='b_01'guifg='b_05

hi normal                                               gui=NONE guifg=#ffffff guibg=#000000
hi Comment      cterm=NONE ctermfg=25 ctermbg=NONE    gui=NONE guifg=#6792AB guibg=NONE
hi Statement    cterm=BOLD ctermfg=75  ctermbg=NONE     gui=BOLD guifg=#73A2BD guibg=NONE
hi Label        cterm=NONE ctermfg=0   ctermbg=190      gui=NONE guifg=#86B4CF guibg=NONE
hi Identifier   cterm=NONE ctermfg=75  ctermbg=0        gui=NONE guifg=#9FC2D6 guibg=NONE
hi PreProc      cterm=NONE ctermfg=208 ctermbg=0        gui=NONE guiFG=#49708A guibg=NONE
hi Number       cterm=NONE ctermfg=231 ctermbg=NONE     gui=NONE guifg=#6792AB guibg=NONE

" unsure if I am doing something wrong here but it needs the NONEs or shows yellow background
hi Search       cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE

hi Cursor       cterm=NONE ctermfg=160 ctermbg=184      gui=none guifg=#000000 guibg=#ffffff
hi CursorIM     cterm=underline ctermfg=160 ctermbg=184 gui=underline guifg=#000000 guibg=#ffffff
hi CursorLine   cterm=NONE ctermbg=234                  gui=NONE               guibg=#232323
hi CursorColumn cterm=NONE ctermbg=234                  gui=NONE               guibg=#232323
hi CursorLineNr cterm=NONE ctermfg=yellow ctermbg=234   gui=NONE guifg=#ffffff guibg=#202020



hi String       cterm=NONE ctermfg=231 ctermbg=NONE     gui=NONE guifg=#ffffff guibg=#000000
hi LineNr       cterm=NONE ctermfg=31  ctermbg=234      gui=NONE guifg=#505050 guibg=#202020
hi MatchParen   cterm=NONE ctermfg=0   ctermbg=190      gui=NONE guifg=#000000 guibg=#F0C27B

" needs 'reverse' to see TODO when cursor is on line (CursorLine)
hi Todo                                                 gui=reverse guifg=#B8D0DE guibg=#000000

hi perlSpecialString                                    gui=NONE  guifg=#B8D0DE   guibg=#000000
hi p6VarStorage                                         gui=BOLD guifg=#73A2BD    guibg=NONE
hi p6FlowControl                                        gui=BOLD guifg=#73A2BD    guibg=NONE
hi p6Quote                                              gui=NONE guifg=#ffffff    guibg=NONE
hi p6RxAnchor                                           gui=NONE guifg=#ffffff    guibg=NONE
hi perlPackageDecl  cterm=NONE ctermfg=75 ctermbg=NONE

hi vimHiGroup                                                     guifg=#86B4CF
hi vimGroup                                                       guifg=#86B4CF
hi vimOption        cterm=NONE ctermfg=75 ctermbg=NONE
hi vimCommentTitle  cterm=NONE ctermfg=25 ctermbg=NONE
hi vimHiCTerm       cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiCTermFgBg   cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiCTermFgBg   cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiGui         cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiGuiFgBg     cterm=NONE ctermfg=231 ctermbg=NONE
hi Type                                                           guifg=#86B4CF

hi htmlArg          cterm=NONE ctermfg=75 ctermbg=NONE
hi htmlError        cterm=NONE ctermfg=75 ctermbg=NONE

" tabs: annoy the eye on purpose.
hi Tabs                                ctermbg=17                 guifg=#0B108C   guibg=NONE
