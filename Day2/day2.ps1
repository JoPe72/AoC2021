$horizontal = 0
$depth = 0


$directions = Get-Content C:\Users\JohanPersson\OneDrive\Github\AoC2021\Day2\Input-day2.txt

for ($i = 0; $i -lt $directions.Count; $i++) {
    switch  -wildcard ($directions[$i]) {
        "forward*" {$horizontal = $horizontal + $directions[$i].Substring($directions[$i].get_length()-1)}
        "up*" {$depth = $depth - $directions[$i].Substring($directions[$i].get_length()-1)}
        "down*" {$depth = $depth + $directions[$i].Substring($directions[$i].get_length()-1)}
        Default {}
    } 
}

$oldtotal = ([int]$depth*[int]$horizontal)
write-host OLD total: $oldtotal

#part 2

$horizontal = 0
$depth = 0
$aim = 0

for ($i = 0; $i -lt $directions.Count; $i++) {
    switch  -wildcard ($directions[$i]) {
        "forward*" {$horizontal = $horizontal + $directions[$i].Substring($directions[$i].get_length()-1)
                    $depth = $depth + ($aim * $directions[$i].Substring($directions[$i].get_length()-1))}
        "up*" {$aim = $aim - $directions[$i].Substring($directions[$i].get_length()-1)}
        "down*" {$aim = $aim + $directions[$i].Substring($directions[$i].get_length()-1)}
        Default {}
    } 

    write-host $depth $aim $horizontal
}
write-host $depth $horizontal
$newtotal = ([int]$depth*[int]$horizontal)
write-host NEW total: $newtotal
