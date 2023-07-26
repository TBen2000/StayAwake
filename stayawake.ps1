cls
$validNumber = $false
while(-not $validNumber)
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
        $validNumber = $true
    }
    catch{
        cls
        echo "--- Please insert a valid number. ---`n"
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

        cls
        echo "staying awake for ${hours}h ${zero}${minutes}m"

        for ($k=1; $k -le 10; $k++) {
            Start-Sleep -Seconds 6
            $myShell.sendkeys("{F13}")
        }
    }
}

finally{
    $currentTime = Get-Date -Format "t"
    cls
    echo "Script stopped running at $CurrentTime"
    Read-Host -Prompt "`nPress Enter to exit"
    exit
}
