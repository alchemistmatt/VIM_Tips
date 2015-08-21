" Vim .fasta syntax file
" Language:     fasta 1.0 
" Maintainer:   Matthew Monroe <matt@alchemistmatt.com>
" Last change:  20 August 2015
"
" This syntax file is for highlighting protein-based FASTA files used in
" proteomics
"
" Changelog:
" 1.0 (2015-08-20)	Initial release 
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

" Error, non-uppercase letter
syn match InvalidCharacters "[^A-Z]"

" Protein residues
syn region Residues oneline start="\v^[A-Z]" end="[A-Z]$" end=" $" contains=InvalidCharacters

" Protein description
syn match ProteinDescription excludenl "\v(^\>[^ ]+)@<= .+"

" Protein name
syn match ProteinName "\v(^\>)@1<=[^ ]+"

" Protein name line start char 
syn match ProteinNameLineStart "^>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version < 508
  command -nargs=+ HiLink hi link <args>
else
  command -nargs=+ HiLink hi def link <args>
endif

HiLink ProteinDescription     Function
HiLink ProteinName            Define
HiLink ProteinNameLineStart   PreProc
HiLink Residues               Normal
HiLink InvalidCharacters      Error

delcommand HiLink

let b:current_syntax = "fasta"
