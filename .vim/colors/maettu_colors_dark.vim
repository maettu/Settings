:" Vim color file
" Name:       maettu_colors_dark
" Maintainer: :m) <matthias@puffin.ch>
" Homepage:   --

" looks like a gvim theme is not autoloaded at startup without this (?!)
let colors_name = "maettu_colors_dark"

" Define some colors that work well together, use them
" below.
" Note: Have to use `exe 'hi foo' variable_name`
let comment    = "cterm=NONE ctermfg=249 ctermbg=NONE"
let identifier = "cterm=NONE ctermfg=229 ctermbg=NONE"
let normal     = "cterm=NONE ctermfg=255 ctermbg=NONE"
let special    = "cterm=NONE ctermfg=220 ctermbg=NONE"
let statement  = "cterm=NONE ctermfg=227 ctermbg=NONE"
let type       = "cterm=NONE ctermfg=186 ctermbg=NONE"

exe 'hi Normal    ' normal
exe 'hi Comment   ' comment
exe 'hi Statement ' statement
exe 'hi Label     ' normal
exe 'hi Identifier' identifier
exe 'hi PreProc   ' statement
exe 'hi Number    ' normal
exe 'hi Special   ' special
exe 'hi String    ' normal
exe 'hi Type      ' type

exe 'hi VimHiGroup' statement
exe 'hi VimGroup  ' statement

hi Search       cterm=reverse ctermfg=NONE ctermbg=NONE
hi Todo         cterm=NONE ctermfg=249   ctermbg=0
hi MatchParen   cterm=NONE ctermfg=0   ctermbg=190

hi CursorLine   cterm=NONE ctermbg=234
hi CursorColumn cterm=NONE ctermbg=234
hi CursorLineNr cterm=NONE ctermfg=016 ctermbg=250
hi LineNr       cterm=NONE ctermfg=255 ctermbg=234

" tabs: annoy the eye on purpose.
hi Tabs                                ctermbg=17

exe 'hi Constant ' identifier


exe 'hi perlPackageDecl ' statement
exe 'hi perlMatch ' normal
exe 'hi perlSubPrototypeError' identifier

exe 'hi p6Type       ' type
exe 'hi p6Twigil     ' identifier
exe 'hi p6Identifier ' statement

exe 'hi phpType      ' type

exe 'hi vimOption      ' identifier
exe 'hi vimHiAttrib    ' identifier
exe 'hi vimHiCTerm     ' statement
exe 'hi vimHiCTermFgBg ' identifier
exe 'hi vimHiCTermFgBg ' identifier

exe 'hi yamlKeyValueDelimiter        ' special
exe 'hi yamlBlockCollectionItemStart ' special
exe 'hi yamlBool                     ' type
exe 'hi yamlNodeTag                  ' special
