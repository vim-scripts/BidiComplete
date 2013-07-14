" BidiComplete.vim: Insert mode completion that considers text before AND AFTER
" the cursor.
"
" DEPENDENCIES:
"   - BidiComplete.vim autoload script
"
" Copyright: (C) 2008-2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
" Credits: Original idea by Laszlo Kozma in his paper "Reverse autocomplete"
"	   (http://www.lkozma.net/autocomplete.html)
"
" REVISION	DATE		REMARKS
"   1.00.006	03-Sep-2012	Add value "b" (other listed buffers) to the
"				plugin's 'complete' option offered by
"				CompleteHelper.vim 1.20.
"	005	21-Jan-2012	Split off functions into separate autoload
"				script and documentation into dedicated help
"				file.
"			    	Using a map-expr instead of i_CTRL-O to set
"				'completefunc', as the temporary leave of insert
"				mode caused a later repeat via '.' to only
"				insert the completed fragment, not the entire
"				inserted text. (Which in this completion mostly
"				is the completion base + completed fragment,
"				anyway, since more text than the completion base
"				is seldomly inserted beforehand, as text
"				insertion is left-to-right, but completion is
"				right-to-left.)
"	004	30-Sep-2011	Add <silent> to <Plug>-mapping.
"	003	10-Jun-2009	Changed default mapping to <C-x><C-b>; this
"				isn't used enough to warrant such a short
"				mapping, and it's less mentally taxing because
"				most completions start with <C-x>.
"	002	15-Aug-2008	Completed implementation.
"	001	13-Aug-2008	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_BidiComplete') || (v:version < 700)
    finish
endif
let g:loaded_BidiComplete = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:BidiComplete_complete')
    let g:BidiComplete_complete = '.,w,b'
endif


"- mappings --------------------------------------------------------------------

inoremap <silent> <expr> <Plug>(BidiComplete) BidiComplete#Expr()
if ! hasmapto('<Plug>(BidiComplete)', 'i')
    imap <C-x><C-b> <Plug>(BidiComplete)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
