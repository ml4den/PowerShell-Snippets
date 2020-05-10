$list = New-Object "System.Collections.Generic.List [PSCustomObject]"

$entry = [PSCustomObject] @{
    Name = 'Alice'
    Age = 31
}

$list.Add($entry)

$list.GetType()
$entry.GetType()
