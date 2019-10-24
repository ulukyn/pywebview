$RootPath = Split-Path $PSScriptRoot
${env:PYTHONPATH='$RootPath'}
${env:PYWEBVIEW_LOG='debug'}

$tests=@(
  "test_http_server.py"
)

rm -r __pycache__

$errors = 0
foreach ($test in $tests) {
  pytest $test -s
  $errors = $errors + $LASTEXITCODE
}

exit $errors

