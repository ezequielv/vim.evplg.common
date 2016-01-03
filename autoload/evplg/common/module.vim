
" boiler plate -- prolog {{{

" "bare vi support" detection/forwarding
if has("eval")

" inclusion control {{{
" TODO: add own inclusion guard (maybe use evlib#module#ShouldSourceThisModuleWithCondition() itself)
if exists( 'g:evplg_common_module_loaded' ) || ( exists( 'g:evplg_common_module_disable' ) && g:evplg_common_module_disable != 0 )
	finish
endif
let g:evplg_common_module_loaded = 1
" }}}

" force "compatibility" mode {{{
if &cp | set nocp | endif
" set standard compatibility options ("Vim" standard)
let s:cpo_save=&cpo
set cpo&vim
" }}}

" }}} boiler plate -- prolog

function evplg#common#module#ShouldSourceThisModule( module_id, condition, ... )
	return evlib#module#ShouldSourceThisModuleWithCondition(
				\		a:module_id,
				\		'evplg#common#pvt#init#CanSource_modules_on_top_of_evplg_common() && ( ' . a:condition . ')',
				\		( ( a:0 > 0 ) ? a:1 : !0 )
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
echoerr "the script 'autoload/evplg/common/module.vim' needs support for the following: eval"

" }}} boiler plate -- epilog

" vim600: set filetype=vim fileformat=unix:
" vim: set noexpandtab:
" vi: set autoindent tabstop=4 shiftwidth=4:
