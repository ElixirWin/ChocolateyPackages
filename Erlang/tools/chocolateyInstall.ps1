<#
.SYNOPSIS
An install script for installing Erlang silently on the machine via ChocolateyNuGet

.NOTES
Author: Onorio Catenacci - catenacci@ieee.org
Version: 19.2
#>

$package = 'erlang'
$version = '19.2'
$erl_version = '8.2'

$params = @{
  PackageName = $package
  FileType = 'exe'
  SilentArgs = '/S'
  Url = "http://www.erlang.org/download/otp_win32_$version.exe"
  CheckSum = 'ab4e5e79448e24551cc752b09af9c76824695d41d73574cf990c633085c94213'
  CheckSumType = 'sha256'
  Url64 = "http://www.erlang.org/download/otp_win64_$version.exe"
  CheckSum64 = 'ce819d2936af1157aed27aed49719c64f4134f714322f096cb5538d9ad627814'
  CheckSumType64 = 'sha256'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @params


Generate-BinFile "erl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/erl.exe"
Generate-BinFile "werl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/werl.exe"
Generate-BinFile "werl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/erlc.exe"
Generate-BinFile "werl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/escript.exe"
Generate-BinFile "werl" -path "$env:ProgramFiles/erl$erl_version/erts-$erl_version/bin/dialyzer.exe"

