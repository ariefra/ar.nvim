" Vim syntax file
" Language: STAAD.pro Input File (*.std)
" Maintainer: Gemini
" Last Change: 2025-07-31
" Version: 1.0

" Clear existing syntax
if exists("b:current_syntax")
  finish
endif

" Case insensitive matching
syn case ignore

" Comments
syn match   staadComment   /^\*.*$/

" Main commands and keywords
syn keyword staadCommand STAAD FINISH UNIT JOINT COORDINATES MEMBER INCIDENCES ELEMENT INCIDENCES
syn keyword staadCommand MEMBER PROPERTY ELEMENT PROPERTY DEFINE MATERIAL CONSTANTS SUPPORTS
syn keyword staadCommand LOAD LOADING PERFORM ANALYSIS PRINT DESIGN CODE PARAMETER
syn keyword staadCommand LOAD COMBINATION JOINT LOAD MEMBER LOAD AREA LOAD FLOOR LOAD
syn keyword staadCommand REPEAT ALL
syn keyword staadCommand DEFINE WIND LOAD DEFINE TIME HISTORY
syn keyword staadCommand PERFORM DIRECT ANALYSIS PERFORM BUCKLING ANALYSIS
syn keyword staadCommand CHECK CODE STEEL DESIGN CONCRETE DESIGN
syn keyword staadCommand PRINT ANALYSIS RESULTS PRINT FORCES PRINT STRESSES

" Structure types
syn keyword staadStructureType SPACE PLANE TRUSS FLOOR

" Material keywords
syn keyword staadMaterial STEEL CONCRETE ALUMINUM

" Support types
syn keyword staadSupport PINNED FIXED ENFORCED

" Load types
syn keyword staadLoadType UNI CONC MOM ACCE TEMP

" Numbers (integers and floats)
syn match   staadNumber   /\<-\=\d\+\(\.\d*\)\=\>\|\.\d\+/

" Highlight links
hi def link staadComment        Comment
hi def link staadCommand        Statement
hi def link staadStructureType  Type
hi def link staadMaterial       Identifier
hi def link staadSupport        Keyword
hi def link staadLoadType       Keyword
hi def link staadNumber         Number

let b:current_syntax = "staad"

" --- End of syntax file ---
