$valid_number = $false

while(-not $valid_number)
{
    try{
        $input = Read-Host -Prompt 'Insert time in hours'
        $input = $input.replace(',','.')
        [int]$time = [math]::Truncate($input)*60 + ($input-[math]::Truncate($input))*60
        if(!$input){
            throw "Empty input"
            }
        if(($time -le 0) -or ($input -le 0)){
            throw "Negative input"
            }
        $valid_number = $true
        echo ""
    }
    catch{
        echo "`n--- Please insert a valid number. ---`n"
    }
}

try{
    $myShell = New-Object -com "Wscript.Shell"

    for ($i = $time; $i -gt 0; $i--) {
        [int]$hours = [math]::Truncate($i/60)
        [int]$minutes = $i%60
        $zero = ""
        if($minutes -lt 10){
            $zero = "0"
        }

        echo "staying awake for ${hours}h ${zero}${minutes}m"

        for ($k=1; $k -le 10; $k++) {
            Start-Sleep -Seconds 6
            $myShell.sendkeys("{F13}")
        }
    }
}
finally{
    $CurrentTime = Get-Date -format "t"
    echo "`n`nScript stopped running at $CurrentTime"
    Read-Host -Prompt "`nPress Enter to exit"
}
