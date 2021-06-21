$package = 'Elixir'
 
$version = '1.9.4'
$params = @{
  PackageName = $package
  FileType = 'zip'
  CheckSum = '10405B5E63549DC65C6A6AB83FAF0EC94BDAF5CC3ED5E71EBA3432D882BAAF8B'
  CheckSumType = 'sha256'
  Url = "https://repo.hex.pm/builds/elixir/v$version-otp-22.zip"
 
  UnzipLocation = $env:chocolateyPackageFolder;
}
 
if (!(Test-Path($params.UnzipLocation)))
{
  New-Item $params.UnzipLocation -Type Directory | Out-Null
}
 
Install-ChocolateyZipPackage @params
 
$elixirPath = "$env:ChocolateyPackageFolder/bin"
if (![System.IO.Directory]::Exists($elixirPath)) {$elixirPath = "$env:ChocolateyPackageFolder/bin";}
 
$machine_path = [Environment]::GetEnvironmentVariable('Path', 'Machine') 
Install-ChocolateyEnvironmentVariable "Path" "$($machine_path);$elixirPath" Machine
Update-SessionEnvironment
 
Write-Host @'
The Elixir commands have been added to your path.
 
Please restart your current shell session to access Elixir commands:
elixir
elixirc
mix
iex.bat
'@
