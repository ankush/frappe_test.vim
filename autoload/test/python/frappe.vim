if !exists('g:test#python#frappe#file_pattern')
  let g:test#python#frappe#file_pattern = '\v^test.*\.py$'
endif

" Returns true if the given file belongs to your test runner
function! test#python#frappe#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#python#frappe#file_pattern
    if exists('g:test#python#runner')
      return g:test#python#runner ==# 'frappe'
    else
      return executable('bench')
    endif
  endif
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#python#frappe#build_position(type, position) abort
  let path = s:get_import_path(a:position['file'])
  let sitename = g:test#python#frappe#testsite
  let arguments = get(g:, "test#python#frappe#arguments", "")
  let module_cmd = '--site ' . sitename . ' run-tests '. arguments . ' --module ' . path

  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let test_cmd = module_cmd . ' --test ' . name
      return [test_cmd]
    else
      return [module_cmd]
    endif
  elseif a:type ==# 'file'
    return [module_cmd]
  else
    return []
  endif
endfunction

" Returns processed args (if you need to do any processing)
function! test#python#frappe#build_args(args) abort
  return a:args
endfunction

function! s:get_import_path(filepath) abort
  " Get path to file from cwd and without extension. rooter required for correct root.
  let path = fnamemodify(a:filepath, ':.:r')
  let path = substitute(path, '\/', '.', 'g')
  return path
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#python#patterns)
  return join(name['test'], '.')
endfunction


" Returns the executable of your test runner
function! test#python#frappe#executable() abort
  return 'bench'
endfunction
