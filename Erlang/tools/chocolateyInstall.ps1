<#
.SYNOPSIS
An install script for installing Erlang silently on the machine via ChocolateyNuGet

.NOTES
Author: Onorio Catenacci - catenacci@ieee.org
Version: 21.2
#>

$package = 'erlang'
$version = '21.2'
$erl_version = '10.2'

$params = @{
  PackageName = $package
  FileType = 'exe'
  SilentArgs = '/S'
  Url = "http://www.erlang.org/download/otp_win32_$version.exe"
  CheckSum = 'f1e8153530ef91c9cdc4a73593fe0fe41755412244370060bd8e4b80572ba242'
  CheckSumType = 'sha256'
  Url64 = "http://www.erlang.org/download/otp_win64_$version.exe"
  CheckSum64 = '468f50caa643bbed484be475419d200d47c87597efd4057142bdb000e1accb72'
  CheckSumType64 = 'sha256'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @params

$baseErlangPath = "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin"

Generate-BinFile "erl" -path "$baseErlangPath/erl.exe"
Generate-BinFile "werl" -path "$baseErlangPath/werl.exe"
Generate-BinFile "erlc" -path "$baseErlangPath/erlc.exe"
Generate-BinFile  "escript" -path "$baseErlangPath/escript.exe"
Generate-BinFile "dialyzer" -path "$baseErlangPath/dialyzer.exe"

