# Enable -Verbose option
[CmdletBinding()]

# Set a flag to force verbose as a default
$VerbosePreference ='Continue' # equiv to -verbose

Copy-Item -Path "$env:ChocolateyInstall\log" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse
Copy-Item -Path "$env:TEMP\chocolatey" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse
Copy-Item -Path "$env:ChocolateyInstall\config" -Destination "$env:BUILD_ARTIFACTSTAGINGDIRECTORY" –Recurse