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
