function Get-RPSScores($turns, $mode) {

$youWinHands = @("A Y","B Z","C X")
$elfWinsHands = @("A Z","B X","C Y")
$drawHands = @("A X","B Y","C Z")
$yourRunningScore = 0

for($i=0; $i -lt $turns.Length; $i++) {

$elfPlays = $turns[$i][0]
$youPlay = $turns[$i][2]
$youActuallyPlay = $youPlay

if($mode -eq "part2") {
    if($youPlay -eq "X") {
        switch($elfPlays) {
        "A" {$youActuallyPlay = "Z"}
        "B" {$youActuallyPlay = "X"}
        "C" {$youActuallyPlay = "Y"}
        }
    }
    if($youPlay -eq "Y") {
        switch($elfPlays) {
        "A" {$youActuallyPlay = "X"}
        "B" {$youActuallyPlay = "Y"}
        "C" {$youActuallyPlay = "Z"}
        }
    }
    if($youPlay -eq "Z") {
        switch($elfPlays) {
        "A" {$youActuallyPlay = "Y"}
        "B" {$youActuallyPlay = "Z"}
        "C" {$youActuallyPlay = "X"}
        }
    }
}

switch($youActuallyPlay) {
    "X" { $playValue = 1 }
    "Y" { $playValue = 2 }
    "Z" { $playValue = 3 }
}

$turn = $elfPlays + " " + $youActuallyPlay

if($turn -in $youWinHands) {
    $totalScore = $playValue + 6
    $yourRunningScore += $totalScore
}

elseif($turn -in $elfWinsHands) {
    $totalScore = $playValue + 0
    $yourRunningScore += $totalScore
}

elseif($turn -in $drawHands) {
    $totalScore = $playValue + 3
    $yourRunningScore += $totalScore
}

}

return $yourRunningScore

}

$turnFile = Get-Content .\input.txt
Get-RPSScores $turnFile part1
Get-RPSScores $turnFile part2