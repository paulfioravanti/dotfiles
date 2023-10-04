" Define highlighting for names, roles, bylines, Q, A, and set command
syntax match qandaName /\v(MR\.|MRS\.|MS\.)\s+[A-Z][A-Za-z\.]+\ze:/
syntax match qandaCourtRole /\vTHE\s+[A-Z][A-Za-z\. ]+\ze:/
syntax match qandaCourt /\vTHE COURT\ze:/
syntax match qandaWitness /\vTHE WITNESS\ze:/
syntax match qandaByline /\vBY(\s+[A-Z][A-Za-z\.]+)+:/
syntax match qandaQ /\v\tQ\t/
syntax match qandaA /\v\tA\t/
syntax match SetPart /Set \(PLAINTIFF_\d\+\|DEFENSE_\d\+\)/
syntax match LawyerPart /\(_1 \|_2 \)\@<=\((\zs[^)]*\ze)\)/
syntax match ArrowPart /=>/

" Highlighting settings for names, roles, and bylines
highlight qandaName ctermfg=darkyellow cterm=bold
highlight qandaCourtRole ctermfg=darkcyan cterm=bold
highlight qandaCourt ctermfg=darkgreen cterm=bold
highlight qandaWitness ctermfg=darkblue cterm=bold
highlight qandaByline ctermfg=white ctermbg=red cterm=bold
highlight qandaQ ctermfg=red cterm=bold
highlight qandaA ctermfg=darkblue cterm=bold
highlight SetPart cterm=bold ctermfg=darkcyan
highlight LawyerPart ctermfg=darkyellow cterm=bold
highlight ArrowPart cterm=bold ctermfg=darkmagenta
