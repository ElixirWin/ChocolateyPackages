$package = 'erlang'
$version = '23.3'
$erl_version = '11.2'

Start-Process -Wait "$env:ProgramFiles\erl-$version\uninstall.exe" -ArgumentList "/S"

#And remove the shim files as well.
$baseErlangPath = "$env:ProgramFiles\erl-$version\erts-$erl_version\bin"

Remove-BinFile "ct_run" -path "$baseErlangPath\ct_run.exe"
Remove-BinFile "erl" -path "$baseErlangPath\erl.exe"
Remove-BinFile "werl" -path "$baseErlangPath\werl.exe"
Remove-BinFile "erlc" -path "$baseErlangPath\erlc.exe"
Remove-BinFile "escript" -path "$baseErlangPath\escript.exe"
Remove-BinFile "dialyzer" -path "$baseErlangPath\dialyzer.exe"
Remove-BinFile "typer" -path "$baseErlangPath\typer.exe"

