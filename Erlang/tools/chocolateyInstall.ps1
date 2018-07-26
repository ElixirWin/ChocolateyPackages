<#
.SYNOPSIS
An install script for installing Erlang silently on the machine via ChocolateyNuGet

.NOTES
Author: Onorio Catenacci - catenacci@ieee.org
Version: 20.2
#>

$package = 'erlang'
$version = '21.0.1'
$erl_version = '10.0.1'

$params = @{
  PackageName = $package
  FileType = 'exe'
  SilentArgs = '/S'
  Url = "http://www.erlang.org/download/otp_win32_$version.exe"
  CheckSum = 'b2dc656040905215b6e412569f55a97d30f6a8e7ad2eff0d9bc106a95c692106'
  CheckSumType = 'sha256'
  Url64 = "http://www.erlang.org/download/otp_win64_$version.exe"
  CheckSum64 = '6eea3ab310cec9ec72002d555ce0f9213bc1424a86a221f1c70411dc6b73f28f'
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

