
"********** CREDIT: https://github.com/grvxs/nvim   **********************"

""" Commands
"" Start a terminal in a new buffer with a command
function! s:StartTerminal(command)
    " If the command isn't empty
    if a:command != ''
        " Save the file
        exec 'w'
        " Be able to insert text
        exec 'startinsert'
        " New floaterm
        exec 'FloatermNew ' . a:command
    endif
endfunction

"" Start a terminal in a new buffer with a command and hold
function! s:StartTerminalHold(command)
    " If the command isn't empty
    if a:command != ''
        " Save the file
        exec 'w'
        " Be able to insert text
        exec 'startinsert'
        " New floaterm
        exec 'FloatermNew --autoclose=0 ' . a:command
    endif
endfunction

"" Runs the code in the file using the filetype
function! g:CompileAndRun()
    let l:file = expand('%:p') " The absolute path to the file
    let l:noext = expand('%:p:r') " The path to the file without the extension
    let l:path = expand('%:p:h') " The absolute path to the file without the name
    let l:name = expand('%:t:r') " The file name without the extension
    " The possible commands
    let l:commandMap = {
        \'haxe'      : 'haxe --main ' . l:file . ' --interp',
        \'dart'      : 'dart run ' . l:file,
        \'java'      : 'javac ' . l:file . ' && java -cp ' . l:path . ' ' . l:name . ' && find ' . l:path . ' -regex "' . l:noext . '\.class" -delete -or -regex "' . l:noext . '$.+\.class" -delete',
        \'kotlin'    : 'kotlinc ' . l:file . ' -include-runtime -d ' . l:name . '.jar && java -jar ' . l:noext . '.jar && rm ' . l:noext . '.jar',
        \'scala'     : 'scalac ' . l:file . ' && scala -classpath ' . l:path . ' ' . l:name . ' && find ' . l:path . ' -regex "' . l:noext . '\.class" -delete -or -regex "' . l:noext . '$.+\.class" -delete',
        \'groovy'    : 'groovy -classpath ' . l:path . ' ' . l:name,
        \'clojure'   : 'clojure ' . l:file,
        \'lisp'      : 'clisp ' . l:file,
        \'hy'        : 'hy ' . l:file,
        \'python'    : 'python3 ' . l:file,
        \'r'         : 'Rscript ' . l:file,
        \'julia'     : 'julia ' . l:file,
        \'nim'       : 'nim compile -p:' . l:path . ' ' . l:name . '.nim && ' . l:noext . ' && rm ' . l:noext,
        \'c'         : 'gcc ' . l:file . ' -o ' . l:noext . ' && ' . l:noext . ' && rm ' . l:noext,
        \'asm'       : 'nasm -f elf64 ' . l:file . ' && ' . 'ld -s ' . l:name . '.o && ./a.out && rm ' . l:name . '.o a.out',
        \'cpp'       : 'g++ -std=c++17 ' . l:file . ' && ' . './a.out',
        \'cs'        : 'mcs ' . l:file . ' && mono ' . l:noext . '.exe && rm ' . l:noext . '.exe',
        \'d'         : 'dmd ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.o && rm ' . l:noext,
        \'rust'      : 'cargo run',
        \'go'        : 'go run ' . l:file,
        \'fortran'   : 'f95 ' . l:file . ' -o ' . l:name . ' && ' . l:noext . ' && rm ' . l:noext,
        \'pascal'    : 'fpc ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.o && rm ' . l:noext,
        \'haskell'   : 'ghc -dynamic ' . l:file . ' && ' . l:noext . ' && rm ' . l:noext . '.hi && rm ' . l:noext . '.o && rm ' . l:noext,
        \'ocaml'     : 'ocaml ' . l:file,
        \'lua'       : 'lua ' . l:file,
        \'sh'        : 'bash ' . l:file,
        \'perl'      : 'perl ' . l:file,
        \'php'       : 'php ' . l:file,
        \'javascript': 'node ' . l:file,
        \'typescript': 'tsc ' . l:file . ' && node ' . l:noext . '.js && rm ' . l:noext . '.js',
        \'coffee'    : 'coffee ' . l:file,
        \'ruby'      : 'ruby ' . l:file,
        \'crystal'   : 'crystal ' . l:file,
        \'elixir'    : 'elixir -r ' . l:file . ' -e ''' . l:name . '.main''',
        \'erlang'    : 'erlc ' . l:file . ' && erl -pa ' . l:path . ' -s ' . l:name . ' main -s init stop && rm ' . l:noext . '.beam',
        \'st'        : 'gst ' . l:file
    \}

    " Get the command
    let l:command = get(l:commandMap, &filetype, '')
    " Start a terminal
    call s:StartTerminalHold(l:command)
endfunction

"" Runs a REPL using the filetype
function! g:StartREPL()
    " The possible commands
     let l:file = expand('%:p') " The absolute path to the file
     let l:noext = expand('%:p:r') " The path to the file without the extension
     let l:path = expand('%:p:h') " The absolute path to the file without the name
     let l:name = expand('%:t:r') " The file name without the extension
     let l:commandMap = {
        \'haxe'      : 'npx haxe-repl',
        \'dart'      : '',
        \'java'      : 'jshell',
        \'kotlin'    : 'kotlin',
        \'scala'     : 'scala',
        \'groovy'    : 'groovysh',
        \'clojure'   : 'clojure',
        \'lisp'      : 'clisp',
        \'hy'        : 'hy',
        \'python'    : 'python3',
        \'r'         : 'R',
        \'julia'     : 'julia',
        \'nim'       : '',
        \'c'         : '',
        \'cpp'       : '',
        \'cs'        : '',
        \'d'         : '',
        \'rust'      : 'papyrus',
        \'go'        : 'igo',
        \'fortran'   : '',
        \'pascal'    : '',
        \'haskell'   : 'ghci ' . l:file,
        \'ocaml'     : 'ocaml',
        \'lua'       : 'lua',
        \'sh'        : 'bash',
        \'perl'      : 'perl -de1',
        \'php'       : 'php -a',
        \'javascript': 'node',
        \'typescript': 'ts-node',
        \'coffee'    : 'coffee',
        \'ruby'      : 'irb',
        \'crystal'   : 'icr',
        \'elixir'    : 'iex',
        \'erlang'    : 'erl',
        \'st'        : 'gst'
    \}

    " Get the command
    let l:command = get(l:commandMap, &filetype, '')
    " Start a terminal
    call s:StartTerminal(l:command)
endfunction
