" indent/turtle.vim
setlocal indentexpr=TurtleIndent(v:lnum)

let s:cpo_save = &cpo
set cpo&vim


function! TurtleIndent(lnum)
  let clnum = a:lnum
  let plnum = prevnonblank(a:lnum - 1)
  if plnum == 0
    return 0
  endif

  " get previous line indent and content
  let ind = indent(plnum)
  let line = getline(plnum)
  let cline = getline(clnum)

  echo ind
  echo line
  ech cline

  " dot at the end, that's a block, go back to 0
  if line =~ '\.$'
    return 0
  endif

  " opening parenthesis
  if line =~ '($'
    let nextInd = ind + 2
    echo nextInd
    return nextInd
  endif

  " opening bracket, add 2
  if line =~ '\[$'
    let bracketInd = ind + 2
    return bracketInd
  endif

  " line ends with a comma, 
  if line =~ ',$'
    return ind
  endif
  
  " closing bracket
  if cline =~ '\]'
    let [openingLine, openingPos] = searchpos('\[', 'b')
    return openingPos - 1
  endif
  
  " closing parenthesis
  if cline =~ ')'
    let [openingLine, openingPos] = searchpos(')', 'b')
    echo openingLine
    return openingPos - 1
  endif

  " line finish with ; add 8 if first level
  if line =~ ';$'
    if ind == 0
      " let predInd = matchend(line, '\v\w+\s+')
      let predInd = 8
      return predInd
      endif
    return ind
  endif

  " default return same
  return ind
endfunction



function! OldTurtleIndent(lnum)
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
