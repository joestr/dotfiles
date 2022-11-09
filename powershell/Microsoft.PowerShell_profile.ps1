$host.ui.rawui.windowtitle="$env:username@$($env:computername):$PWD"
function Global:prompt {"$([char]27)[0m$([char]27)[37m[PS] $([char]27)[95m$env:username$([char]27)[37m@$([char]27)[92m$env:computername$([char]27)[37m:$([char]27)[94m$PWD$(if (Test-Path -Path $PWD/.git) { " $([char]27)[0m$([char]27)[33m[Git branch: $(git branch --show-current)]" })$([char]27)[0m $([char]27)[37m> "}
