Write-Host "Starting up!"
$inputFile = Get-Content .\input.txt -Raw
$elves = $inputFile -split "`r`n`r`n"
$totalPerElf = @()
$answer = 0

foreach($elf in $elves) {

    $inventory = $elf.Split("`r`n", [StringSplitOptions]::RemoveEmptyEntries)
    
        foreach($item in $inventory) {
            $totalCals += $item
        }

    $totalPerElf += $totalCals
    $totalCals = 0
}

$sortedArray = $totalPerElf | sort -Descending | select -First 3

foreach($total in $sortedArray) {
    $answer += $total
}

Write-Host $sortedArray
Write-Host $answer