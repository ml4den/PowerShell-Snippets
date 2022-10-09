#region README
# 
# Set 'SPLITWISE_API_KEY' and 'group_id' below, run the script and browse to a Lloyds statement CSV export.
#
#endregion README

#region File selection and import
# Define a function that allows the user to select files.
function FileSelector {
# This function lets the user interractively select a CSV file.
# Credit: https://4sysops.com/archives/how-to-create-an-open-file-folder-dialog-box-with-powershell/
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
        InitialDirectory = "$scriptDir\data\" #[Environment]::GetFolderPath('Desktop') 
        Filter = 'Comma Separated Value (*.csv)|*.csv|Text File (*.txt)|*.txt'
    }
    $null = $FileBrowser.ShowDialog()
    return $FileBrowser
}

$selectedFile = FileSelector
if (-Not ($selectedFile.FileName)) {break}
$selectedFileAsItem = Get-Item $selectedFile.FileName
$csv = Import-Csv $selectedFile.FileName
#endregion File selection and import

$SPLITWISE_API_KEY = ''

$headers = @{}
$headers.Add("Authorization", "Bearer $SPLITWISE_API_KEY")

foreach ($item in $csv){
    if (
        $item.'Transaction Description' -eq "APPLES" -or `
        $item.'Transaction Description' -eq "PEARS" `
        ){
            Write-Host $item.'Transaction Description'
            $DateParsed = [datetime]::parseexact($item.'Transaction Date', 'dd/MM/yyyy', $null)
            $DateISO8601 = Get-Date ($DateParsed).ToUniversalTime().AddHours(3) -UFormat '+%Y-%m-%dT%H:%M:%S.000Z'

            $cost = $item.'Debit Amount'
            $description = $item.'Transaction Description'
            $group_id = 0
            $date = $DateISO8601

            $reqUrl = "https://secure.splitwise.com/api/v3.0/create_expense?cost=$cost&description=$description&currency_code=GBP&group_id=$group_id&split_equally=true&date=$date"
            $response = Invoke-RestMethod -Uri $reqUrl -Method Get -Headers $headers
            #$response | ConvertTo-Json
            if ($response.expenses.id) {
                Write-Host 'OK'
            } else { Write-Host 'ERROR' }
          }
}
