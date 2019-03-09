$package = 'rebar3'
$version = '3.9.0'

#Note that this process will _not_ uninstall Erlang.
#Remove the shim file.
$toolsDir = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
Remove-BinFile "rebar3" -path "$toolsDir/rebar3.cmd"
