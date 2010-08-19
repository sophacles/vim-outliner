" Syntax highlighting for outliner.
" Maintainer: Ned Konz <vim@bike-nomad.com>
" $Id: otl.vim 120 2006-05-16 00:59:52Z ned $
"
syn cluster vikiHyperLinks contains=vikiLink,vikiExtendedLink,vikiURL,vikiInexistentLink

syn match otlText /^\t*|.*/               contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef,otlTextLeader display nextgroup=otlText
syn match otlTab9 /^\t\{9}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab9,otlTab8,otlText
syn match otlTab8 /^\t\{8}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab8,otlTab9,otlTab7,otlText
syn match otlTab7 /^\t\{7}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab7,otlTab8,otlTab6,otlText
syn match otlTab6 /^\t\{6}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab6,otlTab7,otlTab5,otlText
syn match otlTab5 /^\t\{5}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab5,otlTab6,otlTab4,otlText
syn match otlTab4 /^\t\{4}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab4,otlTab5,otlTab3,otlText
syn match otlTab3 /^\t\{3}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab3,otlTab4,otlTab2,otlText
syn match otlTab2 /^\t\{2}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab2,otlTab3,otlTab1,otlText
syn match otlTab1 /^\t\{1}[^\t|].*/       contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab1,otlTab2,otlTab0,otlText
syn match otlTab0 /^[^\t|].*/             contains=@vikiHyperLinks,otlTodo,otlTagDef,otlTagRef display nextgroup=otlTab0,otlTab1,otlText
" CHANGE: tagstuff can be in text too, and the text should all be highlighted,
" that later bit will prolly be contraversial, so it should prolly have a
" conditional and variable around it.
syn match otlTextLeader /^\t*|.*/   contained contains=otlTagRef,otlTagDef

if exists("g:otl_use_viki") && g:otl_use_viki
  syn match otlTagRef  /<[Uu][Rr][Ll]:[^>]\+>/     contained
  syn match otlTagDef  /\<[Ii][Dd]=\w\+>/          contained
else
  syn match otlTagRef  /<[Uu][Rr][Ll]:[^>]\+>\|\[[^]]*]/    contained
  syn match otlTagDef  /\<[Ii][Dd]=\w\+>\|\[\[[^]]*]]/      contained
end

if exists("g:otl_highlight_extensions") && g:otl_highlight_extensions
  syn match otlTodo /\<\(TODO\|XXX\|NOTE\)\>\|\*\*\s*[^*]\+\s*\*\*/    contained
else
  syn match otlTodo /\<\(TODO\|XXX\|NOTE\)\>/    contained
end
"
"Change: make the highlight colors work better with colorshcemes. Change from
"a set color list, to use syntax types. This is a bit wierd, as it the names
"have not syntactic or semantic relevance to the color, i mean they are all
"headings... just different levels.
"Anyway, the cool trick here is to use main heading names, then, cycle down to
"the #2 option in the heading. This keeps things relatively far away from each
"other.
"

"ORIGINAL:
"if &background == "dark"
"" hi def otlLeadingSpaces ctermbg=darkred guibg=#500000
"  hi def otlTodo ctermbg=3 guibg=lightyellow guifg=red
"  hi def otlTagRef ctermbg=3 ctermfg=4 cterm=bold guibg=lightred guifg=blue
"  hi def otlTagDef ctermbg=3 ctermfg=4 cterm=bold guibg=lightgreen guifg=lightblue
"  hi def otlTextLeader guifg=darkgrey ctermfg=7
"else
"" hi def otlLeadingSpaces ctermbg=lightred guibg=#ffdddd
"  hi def otlTodo ctermbg=3 guibg=lightyellow
"  hi def otlTagRef ctermbg=3 ctermfg=4 cterm=bold guibg=lightred
"  hi def otlTagDef ctermbg=3 ctermfg=4 cterm=bold guibg=lightgreen
"  hi def otlTextLeader guifg=darkgrey ctermfg=7
"endif
"
"" default is to have bold headers
"if !exists("g:otl_bold_headers")
"  let g:otl_bold_headers = 1
"endif
"
"if g:otl_bold_headers
"  hi def otltab0 ctermfg=1 cterm=bold gui=bold guifg=red term=reverse
"  hi def otltab1 ctermfg=4 cterm=bold gui=bold guifg=blue term=reverse
"  hi def otltab2 ctermfg=2 cterm=bold gui=bold guifg=darkgreen term=reverse
"  hi def otltab3 ctermfg=3 cterm=bold gui=bold guifg=brown term=reverse
"  hi def otltab4 ctermfg=5 cterm=bold gui=bold guifg=darkmagenta term=reverse
"  hi def otltab5 ctermfg=6 cterm=bold gui=bold guifg=darkcyan term=reverse
"  hi def otltab6 ctermfg=1 cterm=bold gui=bold guifg=red term=reverse
"  hi def otltab7 ctermfg=4 cterm=bold gui=bold guifg=blue term=reverse
"  hi def otltab8 ctermfg=2 cterm=bold gui=bold guifg=darkgreen term=reverse
"  hi def otlTab9 ctermfg=3 cterm=bold gui=bold guifg=brown term=reverse
"else
"  hi def otlTab0 ctermfg=1 cterm=NONE guifg=red
"  hi def otlTab1 ctermfg=4 cterm=NONE guifg=blue
"  hi def otlTab2 ctermfg=2 cterm=NONE guifg=darkgreen
"  hi def otlTab3 ctermfg=3 cterm=NONE guifg=brown
"  hi def otlTab4 ctermfg=5 cterm=NONE guifg=darkmagenta
"  hi def otlTab5 ctermfg=6 cterm=NONE guifg=darkcyan
"  hi def otlTab6 ctermfg=1 cterm=NONE guifg=red
"  hi def otlTab7 ctermfg=4 cterm=NONE guifg=blue
"  hi def otlTab8 ctermfg=2 cterm=NONE guifg=darkgreen
"  hi def otlTab9 ctermfg=3 cterm=NONE guifg=brown
"  hi def otlTodo ctermbg=3 cterm=NONE guibg=lightyellow
"endif
"/ORIGINAL
"MINE:
" hi def otlLeadingSpaces ctermbg=darkred guibg=#500000
  hi link otlTodo Todo
  hi link otlTagRef Tag
  hi link otlTagDef SpecialComment
  hi link otlTextLeader Comment

  hi link otlTab0 Constant
  hi link otlTab1 Identifier
  hi link otlTab2 PreProc
  hi link otlTab3 Type
  hi link otlTab4 Statement
  hi link otlTab5 Number
  hi link otlTab6 Function
  hi link otlTab7 Include
  hi link otlTab8 Structure
  hi link otlTab9 Conditional

" vim: ts=2 sw=2 et
