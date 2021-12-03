$Larger = 0

$numbers = Get-Content C:\Users\JohanPersson\OneDrive\Github\AoC2021\Day1\Input-day1.txt

for ($i = 0; $i -lt $numbers.Count; $i++) {
   if ($i -ne 0) {
        $trend = "less or eq"
        if ([int]$numbers[$i] -gt [int]$numbers[$i-1]) {
            $Larger++
            $trend = "larger"
        }
   }    
}

write-host "Number of larger measurements: "$Larger  $numbers.Count

## Part 2

for ($i = 0; $i -lt $numbers.Count; $i++) {
    if ($i -le ($numbers.count -3)) {
        Write-Host ([int]$numbers[$i] + [int]$numbers[$i + 1] + [int]$numbers[$i + 2]) "|" ([int]$numbers[$i + 1] + [int]$numbers[$i + 2] + [int]$numbers[$i + 3])
        if (([int]$numbers[$i] + [int]$numbers[$i + 1] + [int]$numbers[$i + 2]) -lt ([int]$numbers[$i + 1] + [int]$numbers[$i + 2] + [int]$numbers[$i + 3])) {
            $largersum++
        }
    }
}

Write-Host "Antal Större Summor: " $largersum