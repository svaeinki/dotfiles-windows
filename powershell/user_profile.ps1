# Load FastFetch
Fastfetch

# Prompt
Import-Module posh-git


# Load Oh-My-Posh
oh-my-posh init pwsh --config "https://raw.githubusercontent.com/craftzdog/dotfiles-public/master/.config/powershell/takuya.omp.json" | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
# Starship Load
#$env:STARSHIP_CONFIG = "$env:USERPROFILE\.config\starship\starship.toml"

#Invoke-Expression (&starship init powershell)
