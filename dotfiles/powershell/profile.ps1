function prompt {
    $esc = "$([char]27)"
    $promptString = "┌[$esc[32m$Env:USERNAME$esc[32m$Env:COMPUTERNAME$esc[0m:"
    $regex = "$([regex]::Escape($HOME))(\\?.*)$"
    $path = $($executionContext.SessionState.Path.CurrentLocation.Path -replace $regex, '~$1')
    $path = $path.Replace('\', '/')
    $promptString += "$esc[34m$path$esc[0m $esc[35mpwsh$esc[0m"
    if (git rev-parse --git-dir 2> $null == ".git") {
        $promptString += " $esc[33m$(git rev-parse --abbrev-ref HEAD)$esc[0m"
    }
    $promptString += "]`n└─> "
    $promptString
}

function gh {
    param([string]$searchString)
    Select-String -Path (Get-PSReadlineOption).HistorySavePath -Pattern $searchString | ForEach-Object { $_.Line }
}

clear

