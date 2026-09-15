# dotfiles
My dotfiles

## Debian

`apt install bash-completion`

### Bash
```bash
wget https://raw.githubusercontent.com/joestr/dotfiles/master/bash/.bashrc -O ~/.bashrc
wget https://raw.githubusercontent.com/joestr/dotfiles/master/bash/.bash_login -O ~/.bash_login
wget https://raw.githubusercontent.com/joestr/dotfiles/master/bash/.bash_aliases -O ~/.bash_aliases
wget https://raw.githubusercontent.com/joestr/dotfiles/master/bash/.bash_logout -O ~/.bash_logout
```

### CodeWhale
```bash
mkdir -p ~/.codewhale
wget https://raw.githubusercontent.com/joestr/dotfiles/master/codewhale/config.toml -O ~/.codewhale/config.toml
```

### Nano
`wget https://raw.githubusercontent.com/joestr/dotfiles/master/nano/.nanorc -O ~/.nanorc`

### Vim
`wget https://raw.githubusercontent.com/joestr/dotfiles/master/vim/.vimrc -O ~/.vimrc`

For `skel`use `cd /etc/skel` first.

## Windows 11

* Install PowerShell 7 from [here](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows?view=powershell-7.5).
* `Install-Module -Name "posh-git"`

### PowerShell 7

```powershell
New-Item -ItemType Directory -Path "${env:USERPROFILE}\Documents\PowerShell\" -ErrorAction Ignore
Invoke-WebRequest -Method Get `
 -Uri "https://raw.githubusercontent.com/joestr/dotfiles/master/powershell/Microsoft.PowerShell_profile.ps1" `
 -OutFile "${env:USERPROFILE}\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```
