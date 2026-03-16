$env:LC_ALL="C.UTF-8"
$env:LESSCHARSET="UTF-8"

$host.ui.rawui.windowtitle="$env:username@$($env:computername):$PWD"
function Global:prompt {
    $result = "$([char]27)[0m$([char]27)[37m[PS]"
    $result += " $([char]27)[95m$env:username$([char]27)[37m"
    $result += "@"
    $result += "$([char]27)[92m$env:computername"
    $result += "$([char]27)[37m:"
    $result +=  "$([char]27)[94m$PWD"
    $result += "$(Write-VcsStatus)"
    $result += "$([char]27)[0m$([char]27)[37m$('>' * ($nestedPromptLevel + 1))"
    return $result
}

Import-Module posh-git
