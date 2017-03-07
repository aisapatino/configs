" Less used vim functions. File can be sources as needed

func! s:GetColors()
  " echo a list of all hex color codes found in current file
  let s:pattern = '#\(\x\x\x\)\{1,2}'
  let colors = {}
  for i in range(0, line('$'))
    let line = getline(i)
    let match_count = 1 " start by checking for 1st match
    let match = matchstr(line, s:pattern, 0, match_count)

    while match != ''
      let l:match_name = match

      if has_key(colors, match)
        " mark color done
        let colors[match] += 1
      else
        let colors[match] = 1
      endif

      let match_count += 1
      let match = matchstr(line, s:pattern, 0, match_count)
    endwhile
  endfor
  for key in keys(colors)
    echo key . '    ' . colors[key]
  endfor
endf

func! s:FormatJS()
  " Make condensed JS more readable
  :%s/{\(.\+\)/{\r\1/e
  :%s/\([^ ]\+\s*\)}/\1\r}/e
  :%s/\[\s*{/[\r{/e
  :%s/}\s*\]/}\r]/e
  :%s/\s\+$/e
  exec 'normal gg=G'
endf

func! s:AlignRight() abort
  " align the right-most word of current line against 80-char column
  let line = getline('.')
  let startpos = match(line, '\S\+$')
  if startpos == -1
    echom 'No match found'
    return
  endif
  let endpos = matchend(line, '\S\+$')
  if endpos >= 79
    echom 'Text found at max column'
    return
  endif
  echom startpos . ', ' . endpos
  call cursor(0, startpos)
  exec 'normal ' . (79 - endpos) . 'i '
endf

func! s:UseArchetypeEslint()
  " use njs-archetype-compatible eslint checking for cwd
  let cwd = getcwd()
  let mid_path = cwd . '/node_modules/@walmart/'
  let arch_node =  'electrode-archetype-njs-module-dev'

  if isdirectory(mid_path . arch_node)

    let g:syntastic_javascript_eslint_exec = cwd . '/node_modules/eslint/bin/eslint.js'

    let conf_path = '--config ' . mid_path . arch_node . '/config/eslint/'

    if match(expand('%:'), '^test') > -1
      let b:syntastic_javascript_eslint_args = conf_path . '.eslintrc-test'
    else
      let b:syntastic_javascript_eslint_args = conf_path . '.eslintrc-node'
    endif
    echom 'Exec: ' . g:syntastic_javascript_eslint_exec
    echom 'Args: ' . b:syntastic_javascript_eslint_args
  else
    echoe arch_node . ' not found. Make sure cwd is root of repo and node_modules are installed'
  endif
endf

com! GetColors  call s:GetColors()
com! AlignRight call s:AlignRight()
com! FormatJS   call s:FormatJS()
com! UseArchetypeEslint   call s:UseArchetypeEslint()

echom "Extras added: :GetColors, :FormatJS, :AlignRight, :UseArchetypeEslint"
