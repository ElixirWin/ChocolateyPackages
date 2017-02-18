$package = 'erlang'
$version = '19.2'
$erl_version = '8.2'

start-process -wait "C:\Program Files\erl$erl_version\uninstall.exe"

#And remove the shim files as well.
Remove-BinFile "erl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/erl.exe"
Remove-BinFile "werl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/werl.exe"
Remove-BinFile "erlc" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/erlc.exe"
Remove-BinFile "escript" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/escript.exe"
Remove-BinFile "dialyzer" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/dialyzer.exe"
