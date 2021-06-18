<#
.SYNOPSIS
An install script for installing Erlang silently on the machine via ChocolateyNuGet

.NOTES
Author: Onorio Catenacci - catenacci@ieee.org
Version: 23.3
#>

$package = 'erlang'
$version = '23.3'
$erl_version = '11.2'

$params = @{
  PackageName = $package
  FileType = 'exe'
  SilentArgs = '/S'
  Url = "https://erlang.org/download/otp_win32_$version.exe"
  CheckSum = '5cf5b08a40b874f605050dee5df39fab375cb949503621a6360106d00bd5cff7'
  CheckSumType = 'sha256'
  Url64 = "https://erlang.org/download/otp_win64_$version.exe"
  CheckSum64 = '1a05661a881e55be69bfcc7faefb7cda9f7552369a08695e18a1433e249f3c0f'
  CheckSumType64 = 'sha256'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @params

$baseErlangPath = "$env:ProgramFiles\erl-$version\erts-$erl_version\bin"

Generate-BinFile "ct_run" -path "$baseErlangPath\ct_run.exe"
Generate-BinFile "erl" -path "$baseErlangPath\erl.exe"
Generate-BinFile "werl" -path "$baseErlangPath\werl.exe"
Generate-BinFile "erlc" -path "$baseErlangPath\erlc.exe"
Generate-BinFile "escript" -path "$baseErlangPath\escript.exe"
Generate-BinFile "dialyzer" -path "$baseErlangPath\dialyzer.exe"
Generate-BinFile "typer" -path "$baseErlangPath\typer.exe"
