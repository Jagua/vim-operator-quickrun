" vim: set et fdm=marker ft=vim sts=2 sw=2 ts=2 :


scriptencoding utf-8


if exists('g:loaded_operator_quickrun')
  finish
endif


call operator#user#define('quickrun-run', 'operator#quickrun#run')
call operator#user#define('quickrun-run-contextually', 'operator#quickrun#run_contextually')


let g:loaded_operator_quickrun = 1
