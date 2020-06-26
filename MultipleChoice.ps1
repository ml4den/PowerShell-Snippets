$fruit = $null
function Main-Menu {
do {
    cls
    Write-Host "Select your smoothie choice:"
    Write-Host "1. Apple Smoothie `n2. Orange Fresh `n3. Banana Smoothie"
    $menuresponse = read-host [Enter Selection]
    Switch ($menuresponse) {
        "1" {Write-Host "`nYou selected 1"
                $global:fruit = "apple"}
        "2" {Write-Host "`nYou selected 2"
                $global:fruit = "orange"}
        "3" {Write-Host "`nYou selected 3"
                $global:fruit = "banana"}
                            }
    }
    until (1..3 -contains $menuresponse) 
}

Main-Menu

Write-Host $fruit
