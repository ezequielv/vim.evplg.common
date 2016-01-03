
" FIXME: add own inclusion guard (maybe use evlib#Init() directly)

" FIXME: add all the "boilerplate" code here

function evplg#common#pvt#init#CanSource_evplg_common_modules()
	" IDEA: if this criteria gets more complicated, we could "cache" the
	"  result that we'd be returning, in a matter reminiscent of 'static'
	"  function variables (C/C++)
	"  (hint: use a
	"  's:evplg_common_pvt_init_can_source_evplg_common_modules_result'
	"  variable)
	" TODO: add support for a "disabled this plugin" boolean value
	return evlib#Init()
endfunction

function evplg#common#pvt#init#CanSource_modules_on_top_of_evplg_common()
	return evplg#common#pvt#init#CanSource_evplg_common_modules()
endfunction

" vim600: set filetype=vim fileformat=unix:
" vim: set noexpandtab:
" vi: set autoindent tabstop=4 shiftwidth=4:
