" indent/turtle.vim
if exists("TurtleIndent")
  finish
endif
   
" setlocal indentexpr=TurtleIndent(v:lnum)

let s:cpo_save = &cpo
set cpo&vim

function! TurtleIndent(lnum)
  let lnum = prevnonblank(a:lnum - 1)
  if lnum == 0
    return 0
  endif

  " get previous line indent and content
  let ind = indent(lnum)
  let line = getline(lnum)

  " dot, end of block
  if line =~ '\.$'
    return 0
  endif
  " opening bracket, add a tabstop
  "if line =~ '\[$'
  "  return ind + &tabstop
  "endif
  " closing bracket, remove tabstop and also move current line
  "if line =~ '\v^\s*\]\s*,$'
    " call timer_start(0, {-> setline(lnum, line[&tabstop:])})
  "  return ind - &tabstop
  "endif
  " comma, stay at same level
  " if line =~ ',$'
  "  return ind
  " endif
  " closing bracket and semi-column find opening statement
  "if line =~ '\v^\s*\]\s*;$'
  "  let openingLine = search('\v\w+\s*\[$', 'ncbW')
  "  let predInd = indent(openingLine)
  "  return predInd
  "endif
  " semi column, keep indent
  if line =~ ';$'
    return ind;
  endif
  return ind
  
  " semi column find predicate
  "if line =~ ';$'
  "  if ind == 0
  "    let predInd = matchend(line, '\v\w+\s+')
  "    return predInd
  "    endif
  "  return ind
  "endif
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save
