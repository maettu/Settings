:" Vim color file
" Name:       maettu_colors_light
" Maintainer: :m) <matthias@puffin.ch>
" Homepage:   --

" looks like gvim theme is not autoloaded at startup without this (?!)
let colors_name = "maettu_colors_light"

hi normal       cterm=NONE ctermfg=17  ctermbg=NONE
hi Comment      cterm=NONE ctermfg=17  ctermbg=NONE
hi Statement    cterm=BOLD ctermfg=20  ctermbg=NONE
hi Label        cterm=NONE ctermfg=0   ctermbg=NONE
hi Identifier   cterm=NONE ctermfg=20  ctermbg=NONE
hi PreProc      cterm=NONE ctermfg=19  ctermbg=NONE
hi Number       cterm=NONE ctermfg=238 ctermbg=NONE
hi Error        cterm=NONE ctermfg=124 ctermbg=NONE

hi confTodo     cterm=NONE ctermfg=238 ctermbg=NONE

" unsure if I am doing something wrong here but it needs the NONEs or shows yellow background
hi Search       cterm=reverse ctermfg=NONE ctermbg=NONE

hi Cursor       cterm=NONE      ctermfg=160 ctermbg=184
hi CursorIM     cterm=underline ctermfg=160 ctermbg=184
hi CursorLine   cterm=NONE      ctermbg=253
hi CursorColumn cterm=NONE      ctermbg=253
hi CursorLineNr cterm=NONE      ctermfg=yellow ctermbg=238



hi String       cterm=NONE ctermfg=17  ctermbg=NONE
hi LineNr       cterm=NONE ctermfg=31  ctermbg=253
hi MatchParen   cterm=NONE ctermfg=0   ctermbg=190

hi Todo         cterm=NONE ctermfg=17  ctermbg=NONE

hi perlPackageDecl  cterm=NONE ctermfg=17 ctermbg=NONE
hi perlMatch        cterm=NONE ctermfg=17 ctermbg=NONE

hi vimHiGroup       cterm=NONE ctermfg=17 ctermbg=NONE
hi vimGroup         cterm=NONE ctermfg=17 ctermbg=NONE
hi vimOption        cterm=NONE ctermfg=75 ctermbg=NONE
hi vimCommentTitle  cterm=NONE ctermfg=25 ctermbg=NONE
hi vimHiAttrib      cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiCTerm       cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiCTermFgBg   cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiCTermFgBg   cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiGui         cterm=NONE ctermfg=75 ctermbg=NONE
hi vimHiGuiFgBg     cterm=NONE ctermfg=17 ctermbg=NONE

hi htmlArg          cterm=NONE ctermfg=75 ctermbg=NONE
hi htmlError        cterm=NONE ctermfg=75 ctermbg=NONE

" tabs: annoy the eye on purpose.
hi Tabs                                ctermbg=17

hi yamlKeyValueDelimiter        cterm=NONE ctermfg=17  ctermbg=NONE
hi yamlBlockCollectionItemStart cterm=NONE ctermfg=17  ctermbg=NONE
hi yamlBool                     cterm=NONE ctermfg=75 ctermbg=NONE
hi yamlNodeTag                  cterm=NONE ctermfg=75 ctermbg=NONE
