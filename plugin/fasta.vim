" Author:  Bjorn Winckler
" Version: 0.0
" License: (c) 2014 Bjorn Winckler.  Licensed under the same terms as Vim.
"
" Summary:
"
" Tools for processing FASTA files.
"

if exists("g:loaded_fasta") || &cp || v:version < 700 | finish | endif
let g:loaded_fasta = 1


" Supports IUPAC-IUB codes (nb. S, W, N are their own complement)
function FastaComplement()
    call setline(".", tr(getline("."), "GATCRYMKHBVDgatcrymkhbvd", "CTAGYRKMDVBHctagyrkmdvbh"))
endfunction

function FastaReverse()
    call setline(".", join(reverse(split(getline("."), '\zs')),""))
endfunction

function FastaReverseComplement()
    call FastaReverse()
    call FastaComplement()
endfunction

command! FastaReverseComplement call FastaReverseComplement()
