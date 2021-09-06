" indent/turtle.vim
setlocal indentexpr=TurtleIndent(v:lnum)

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

  if line =~ '\.$'
    return 0
  endif
  if line =~ '\[$'
    let bracketInd = match(line, '\v\[$')
    return bracketInd
  endif
  if line =~ ',$'
    return ind
  endif
  " closing bracket find opening statement
  if line =~ '\]\s*;$'
    let openingLine = search('\v\w+\s\[$', 'ncbW')
    let predInd = indent(openingLine)
    return predInd
  endif
  if line =~ ';$'
    if ind == 0
      let predInd = matchend(line, '\v\w+\s+')
      return predInd
      endif
    return ind
  endif
endfunction


let &cpo = s:cpo_save
unlet s:cpo_save
