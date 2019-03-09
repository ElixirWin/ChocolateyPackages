$package = 'erlang'
$version = '21.2'
$erl_version = '10.2'

start-process -wait "C:\Program Files\erl$erl_version\uninstall.exe"

#And remove the shim files as well.
$baseErlangPath = "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin"
Remove-BinFile "erl" -path "$baseErlangPath/erl.exe"
Remove-BinFile "werl" -path "$baseErlangPath/werl.exe"
Remove-BinFile "erlc" -path "$baseErlangPath/erlc.exe"
Remove-BinFile  "escript" -path "$baseErlangPath/escript.exe"
Remove-BinFile "dialyzer" -path "$baseErlangPath/dialyzer.exe"
