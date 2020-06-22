$Dir = "C:\Temp"
$DaysBack = "-30"
 
$CurrentDate = Get-Date
$DateToDelete = $CurrentDate.AddDays($DaysBack)
Get-ChildItem $Dir\*.txt | Where-Object { $_.LastWriteTime -lt $DateToDelete } | Remove-Item
