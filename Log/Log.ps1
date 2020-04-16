[string]$LogFile = ""
#$script:ScriptVersion = "1.0.2"

function Log([string]$Message, [ConsoleColor]$Colour)
{
    if ($Colour -eq $null)
    {
        $Colour = [ConsoleColor]::White
    }
    Write-Host $Message -ForegroundColor $Colour
	if ( $LogFile -eq "" ) { return }
	"$([DateTime]::Now.ToShortDateString()) $([DateTime]::Now.ToLongTimeString())`t$Message" | Out-File $LogFile -Append
}

#Log "$($MyInvocation.MyCommand.Name) version $($script:ScriptVersion) starting" Green
