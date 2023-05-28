" Overrides and additions to python.vim

" Check if option is enabled
function! s:Enabled(name)
    return exists(a:name) && {a:name}
endfunction

" Enable option if it's not defined
function! s:EnableByDefault(name)
    if !exists(a:name)
        let {a:name} = 1
    endif
endfunction

if s:Enabled('g:python_highlight_all')
    call s:EnableByDefault('g:python_highlight_class_names')
endif

if s:Enabled('g:python_highlight_class_names')
    syn keyword pythonStatement     class nextgroup=pythonClassDef skipwhite
    syn match   pythonClassDef    '\%([[:upper:]][^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*' display contained
endif

if v:version >= 508 || !exists('did_python_syn_inits')
    if v:version <= 508
        let did_python_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink pythonClassName Structure
    delcommand HiLink
endif


"if s:Enabled('g:python_highlight_builtins')
    "call s:EnableByDefault('g:python_highlight_builtin_objs')
    "call s:EnableByDefault('g:python_highlight_builtin_types')
    "call s:EnableByDefault('g:python_highlight_builtin_funcs')
"endif
