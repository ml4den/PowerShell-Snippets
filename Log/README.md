# Log.ps1
## Usage
### Set the log location
Example using a folder where the script is located:
```PowerShell
$scriptDir = $(Split-Path $Script:MyInvocation.MyCommand.Path -Parent)
$LogFile = $scriptDir + "\logs\$($MyInvocation.MyCommand.Name).txt"
```
Or just provide any path:
```PowerShell
$LogFile = C:\logs\log.txt"
```
### Log events
#### Start
```PowerShell
Log "$($MyInvocation.MyCommand.Name) starting..." Green
```
#### Events
```PowerShell
Log -Message "something happened" -Colour "Green"
```
or
```PowerShell
Log "something happened" Green
```
