# Enable -Verbose option
[CmdletBinding()]

# Set a flag to force verbose as a default
$VerbosePreference ='Continue' # equiv to -verbose

if (Test-Path "$env:ChocolateyInstall\log") 
{
    Copy-Item -Path "$env:ChocolateyInstall\log" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse
}

if (Test-Path "$env:TEMP\chocolatey") 
{
    Copy-Item -Path "$env:TEMP\chocolatey" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse
}

if (Test-Path "$env:ChocolateyInstall\config") 
{
    Copy-Item -Path "$env:ChocolateyInstall\config" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse
}