
" FIXME: add own inclusion guard (maybe use evlib#module#ShouldSourceThisModuleWithCondition() itself)

" FIXME: add all the "boilerplate" code here

" FIXME: MAYBE: try to initialise evlib (so the autoloaded functions are available)
"  IDEA: do this as part of the inclusion guard, above?

" no_debug_function_as_argument: function s:DebugMessage_local( msg )
" no_debug_function_as_argument: 	echomsg '[DEBUG] evplg: ' . a:msg
" no_debug_function_as_argument: endfunction
" no_debug_function_as_argument: 
" no_debug_function_as_argument: let s:evplg_common_pvt_module_debug_message_function = ( exists( '*evlib#debug#DebugMessage' ) ? function( 'evlib#debug#DebugMessage' ) : function( 's:DebugMessage_local' ) )
" no_debug_function_as_argument: 
" no_debug_function_as_argument: function s:DebugMessage( msg )
" no_debug_function_as_argument: 	call s:evplg_common_pvt_module_debug_message_function( a:msg )
" no_debug_function_as_argument: endfunction

" FIXME: update the condition parameter in call to evlib#module#ShouldSourceThisModuleWithCondition()
function evplg#common#pvt#module#ShouldSourceThisModule( module_id, ... ) abort
	" previous (no_debug_function_as_argument):
	" \		[ s:evplg_common_pvt_module_debug_message_function ] + a:000
	return evlib#module#ShouldSourceThisModuleWithCondition(
				\		'evplg_common_' . a:module_id,
				\		'evplg#common#pvt#init#CanSource_evplg_common_modules()',
				\		a:000
				\	)
endfunction

" vim600: set filetype=vim fileformat=unix:
" vim: set noexpandtab:
" vi: set autoindent tabstop=4 shiftwidth=4:
