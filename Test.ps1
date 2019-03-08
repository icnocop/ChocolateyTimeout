# Enable -Verbose option
[CmdletBinding()]

# Set a flag to force verbose as a default
$VerbosePreference ='Continue' # equiv to -verbose

. "$Env:BUILD_SOURCESDIRECTORY\ProcessRunner.ps1"

$exitCode = Run-Process -FilePath "choco.exe" -ArgumentList "config"
if ($exitCode -ne 0)
{  
    throw "Command failed with exit code $exitCode."  
}  

$exitCode = Run-Process -FilePath "choco.exe" -ArgumentList "config get commandExecutionTimeoutSeconds"
if ($exitCode -ne 0)
{  
    throw "Command failed with exit code $exitCode."  
}  

# Microsoft Visual Studio 2015 Enterprise Update 3  
# https://chocolatey.org/packages/VisualStudio2015Enterprise
Write-Host "Installing Microsoft Visual Studio 2015 Enterprise Update 3..."  
$exitCode = Run-Process -FilePath "choco.exe" -ArgumentList "install --execution-timeout=0 --debug --verbose -y VisualStudio2015Enterprise  -packageParameters ""--Features VC_MFC_Libraries,WebTools,SilverLight_Developer_Kit"""
if (($exitCode -ne 3010) -and ($exitCode -ne 0))  
{  
    throw "Command failed with exit code $exitCode."  
}  
Write-Host "Microsoft Visual Studio 2015 Enterprise Update 3 successfully installed" -ForegroundColor Green  