" Set Proper Tabs for PEP 8
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=100
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

" ALE Configuration
let b:ale_linters = ['pylint']
let b:ale_fixers = ['isort', 'black']

let b:ale_python_black_executable = GetEnvPath('black')
let b:ale_python_black_use_global = 1

let b:ale_python_isort_executable = GetEnvPath('isort')
let b:ale_python_isort_use_global = 1

let b:ale_python_pylint_executable = GetEnvPath('pylint')
let b:ale_python_pylint_use_global = 1
