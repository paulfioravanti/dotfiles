" Define highlighting for names, roles, bylines, Q, A
syntax match qandaName /\v(MR\.|MRS\.|MS\.)\s+[A-Z][A-Za-z\.]+\ze:/
syntax match qandaCourtRole /\vTHE\s+[A-Z][A-Za-z\. ]+\ze:/
syntax match qandaCourt /\vTHE COURT\ze:/
syntax match qandaWitness /\vTHE WITNESS\ze:/
syntax match qandaByline /\vBY(\s+[A-Z][A-Za-z\.]+)+:/
syntax match qandaQ /\v\tQ\t/
syntax match qandaA /\v\tA\t/

" Highlighting settings for names, roles, and bylines
highlight qandaName ctermfg=darkyellow
highlight qandaCourtRole ctermfg=darkcyan
highlight qandaCourt ctermfg=darkgreen
highlight qandaWitness ctermfg=darkblue
highlight qandaByline ctermfg=white ctermbg=red
highlight qandaQ ctermfg=red
highlight qandaA ctermfg=darkblue
