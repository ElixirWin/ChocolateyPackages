$package = 'Elixir'

$version = '1.7.0'
$params = @{
  PackageName = $package
  FileType = 'zip'
  CheckSum = '19863a565875f4aaebb73de09f85c22d07b45d0e61d1e6bf5eb4b8e632569665'
  CheckSumType = 'sha256'
  Url = "https://github.com/elixir-lang/elixir/releases/download/v$version/Precompiled.zip"

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
