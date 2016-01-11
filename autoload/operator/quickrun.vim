" vim: set et fdm=marker ft=vim sts=2 sw=2 ts=2 :


scriptencoding utf-8


let s:save_cpo = &cpo
set cpo&vim


function! operator#quickrun#_make_quickrun_config(motion_wise, contextualize) "{{{
  let config = {
        \   'region' : {
        \     'first' : getpos("'[")[1 : ],
        \     'last' : getpos("']")[1 : ],
        \     'wise' : {'line' : 'V',
        \               'char' : 'v',
        \               'block' : "\<C-v>"}[a:motion_wise],
        \     'selection' : 'inclusive',
        \   }
        \ }
  if a:contextualize
    let filetype = context_filetype#get_filetype()
    if !empty(filetype)
      call extend(config, {'type' : filetype})
    endif
  endif
  return config
endfunction "}}}


function! operator#quickrun#run(motion_wise) "{{{
  call quickrun#run(operator#quickrun#_make_quickrun_config(a:motion_wise, 0))
endfunction "}}}


function! operator#quickrun#run_contextually(motion_wise) "{{{
  call quickrun#run(operator#quickrun#_make_quickrun_config(a:motion_wise, 1))
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
