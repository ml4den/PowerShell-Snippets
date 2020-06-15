$Dir = "C:\Temp"
$Daysback = "-30"
 
$CurrentDate = Get-Date
$DateToDelete = $CurrentDate.AddDays($Daysback)
Get-ChildItem $Dir\*.txt | Where-Object { $_.LastWriteTime -lt $DateToDelete } | Remove-Item
