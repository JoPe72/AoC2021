$diagnostics = Get-Content "C:\Users\JohanPersson\OneDrive\Github\AoC2021\Day 3\test-input-day3.txt"


[array]$Ones = foreach ($i in (1..$($diagnostics[0]).length)) {
    # Return the item on it's own row passing it to $Array.
    0
}

[array]$GammaRate = foreach ($i in (1..$($diagnostics[0]).length)) {
    # Return the item on it's own row passing it to $Array.
    0
}

[array]$EpsilonRate = foreach ($i in (1..$($diagnostics[0]).length)) {
    # Return the item on it's own row passing it to $Array.
    0
}

for ($y = 0; $y -lt $diagnostics.count; $y++) {
    for ($x = 0; $x -lt $($diagnostics[$y]).length; $x++) {
        if ($($diagnostics[$y])[$x] -eq "1") {$Ones[$x]++}
    }
}

for ($q = 0; $q -lt $ones.Length; $q++) {
    if ([int]$ones[$q] -gt ($diagnostics.count / 2)) {
        $gammarate[$q] = 1
        $epsilonrate[$q] = 0
    }
    else {
        $gammarate[$q] = 0
        $epsilonrate[$q] = 1
    }
}

[convert]::ToInt32($($gammarate -join ""),2) * [convert]::ToInt32($($epsilonrate -join ""),2)

## Part 2

$diagnostics2 = Get-Content "C:\Users\JohanPersson\OneDrive\Github\AoC2021\Day 3\test-input-day3.txt"

[System.Collections.ArrayList]$OxyGenFact = $diagnostics2
[System.Collections.ArrayList]$CO2ScruRat = $diagnostics2

for ($x = 0; $x -lt $($diagnostics2[0]).Length; $x++) {
    $OxyOnes = 0
    $CO2Ones = 0
    for ($y = 0; $y -lt $OxyGenFact.Count; $y++) {
        if ($($OxyGenFact[$y])[$x] -eq "1") {
            $OxyOnes++
        }
    }

    for ($z = 0; $z -lt $CO2ScruRat.Count; $z++) {
        if ($($OxyGenFact[$z])[$x] -eq "1") {
            $CO2Ones++
        }
    } 
    write-host "OXY $OxyOnes in pos $x"
    write-host "CO2 $CO2Ones in pos $x"

    for ($y = 0; $y -lt $OxyGenFact.Count; $y++) {
        if ($OxyOnes -ge $($y/2)) {
            if (($($OxyGenFact[$y])[$x] -eq 1) -and ($OxyGenFact.Count -gt 1)){
                write-host "True"
                $OxyGenFact.Remove($OxyGenFact[$y])
                $y--
            }       
        }
        else {
            if (($($OxyGenFact[$y])[$x] -eq 0) -and ($OxyGenFact.Count -gt 1)){
                $OxyGenFact.Remove($OxyGenFact[$y])
                $y--
            } 
        }
        $OxyGenFact.Count
    }

#    $OxyGenFact
}
#     if ($ones -gt $($y/2)) {
#         $OxyGenRateBitPattern[$x] = 1
#         $CO2ScrubRatingBitPattern[$x] = 0
#     }
#     if ($ones -lt $($y/2)) {
#         $CO2ScrubRatingBitPattern[$x] = 1
#         $OxyGenRateBitPattern[$x] = 0
#     }
#     if ($ones -eq $($y/2)) {
#         $OxyGenRateBitPattern[$x] = 1
#         $CO2ScrubRatingBitPattern[$x] = 0
#     }
# }

# [System.Collections.ArrayList]$OxyGenFact = $diagnostics2
# [System.Collections.ArrayList]$CO2ScruRat = $diagnostics2

# for ($x = 0; $x -lt $($diagnostics2[0]).Length; $x++) {

#     for ($y = 0; $y -lt $OxyGenFact.Count; $y++) {
#         if (($($OxyGenRateBitPattern[$x]).ToString() -ne $($($OxyGenFact[$y])[$x]).ToString()) -and ($OxyGenFact.Count -gt 1)) {
#              #write-host "Removing OXY " $x $y $OxyGenFact[$y] $OxyGenFact.Count
#              $OxyGenFact.Remove($OxyGenFact[$y])
#              $y--
#         }
#     }
#     for ($z = 0; $z -lt $CO2ScruRat.Count; $z++) {
#         Write-Host "Line $z"
#         if (($($CO2ScrubRatingBitPattern[$x]).ToString() -ne $($($CO2ScruRat[$z])[$x]).ToString()) -and ($CO2ScruRat.Count -gt 1)) {
#            write-host "Removing CO2 " $x $z $CO2ScruRat[$z] $CO2ScruRat.Count
#            $CO2ScruRat
#             $CO2ScruRat.Remove($CO2ScruRat[$z])
#             $z--
#         }

#     }
# }

# write-host "DONE"

# $OxyGenFact -join ""
# $CO2ScruRat -join ""

# [convert]::ToInt32($($OxyGenFact -join ""),2)
# [convert]::ToInt32($($CO2ScruRat -join ""),2)

# #[convert]::ToInt32($($CO2ScruRat -join ""),2) * [convert]::ToInt32($($OxyGenFact -join ""),2)