$package = 'rebar3'
$version = '3.9.0'

$toolsDir = $(Split-Path -Parent $MyInvocation.MyCommand.Definition)
Get-ChocolateyWebFile -packageName $package -fileFullPath $toolsDir/$package -url "https://github.com/erlang/$package/releases/download/$version/rebar3" -Checksum '6bfe8a0ec4b0e615c244bf678577a2583224dc9ede57f6c1b3d1bc12bfe1ec05' -Checksumtype 'sha256'

Install-BinFile "rebar3" -path "$toolsDir/rebar3.cmd"
