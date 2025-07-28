# Load FastFetch
Fastfetch

# Prompt
Import-Module posh-git

# Load Oh-My-Posh
oh-my-posh init pwsh --config 'amro' | Invoke-Expression

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
function wich ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

