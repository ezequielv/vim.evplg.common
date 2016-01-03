
" boiler plate -- prolog {{{

" "bare vi support" detection/forwarding
if has("eval")

" inclusion control {{{
" maybe: if exists( 'g:evplg_common_autoload_evplg_common_pvt_module_loaded' ) || ( exists( 'g:evplg_common_disable' ) && g:evplg_common_disable != 0 )
if exists( 'g:evplg_common_autoload_evplg_common_pvt_module_loaded' )
	finish
endif
let g:evplg_common_autoload_evplg_common_pvt_module_loaded = 1
" }}}

" force "compatibility" mode {{{
if &cp | set nocp | endif
" set standard compatibility options ("Vim" standard)
let s:cpo_save=&cpo
set cpo&vim
" }}}

" }}} boiler plate -- prolog

" TODO: MAYBE: update the condition parameter in call to evlib#module#ShouldSourceThisModuleWithCondition()
function evplg#common#pvt#module#ShouldSourceThisModule( module_id, ... ) abort
	" previous (no_debug_function_as_argument):
	" \		[ s:evplg_common_pvt_module_debug_message_function ] + a:000
	return evlib#module#ShouldSourceThisModuleWithCondition(
				\		'evplg_common_' . a:module_id,
				\		'evplg#common#pvt#init#CanSource_evplg_common_modules()',
				\		a:000
				\	)
endfunction

" boiler plate -- epilog {{{

" restore old "compatibility" options {{{
let &cpo=s:cpo_save
unlet s:cpo_save
" }}}

" non-eval versions would skip over the "endif"
finish
endif " "eval"
" compatible mode
echoerr "the script 'autoload/evplg/common/pvt/module.vim' needs support for the following: eval"

" }}} boiler plate -- epilog

" vim600: set filetype=vim fileformat=unix:
" vim: set noexpandtab:
" vi: set autoindent tabstop=4 shiftwidth=4:
