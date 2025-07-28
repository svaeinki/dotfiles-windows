Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Verificar si Scoop ya está instalado
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

scoop install git neovim curl sudo jq gcc

scoop install fastfetch oh-my-posh terminal-icons fzf
