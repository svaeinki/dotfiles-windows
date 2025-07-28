# Set execution policy
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

Write-Host "`n🔧 Iniciando setup personalizado..." -ForegroundColor Cyan

# ░█░█░█▀▀░█▀█░█▀█░█▀▀░█░█
# Verificar si Scoop está instalado
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "📦 Instalando Scoop..." -ForegroundColor Yellow
    Invoke-RestMethod "https://get.scoop.sh" | Invoke-Expression
} else {
    Write-Host "✅ Scoop ya instalado" -ForegroundColor Green
}

# ░█▀▀░█░█░█▀█░█▀█░█▀█
# Buckets necesarios
if (-not (scoop bucket list | Select-String 'extras')) {
    scoop bucket add extras
}
if (-not (scoop bucket list | Select-String 'versions')) {
    scoop bucket add versions
}

# ░█▀▄░█▀▀░█▀█░█▀▀░█▀█
# Apps necesarias
$apps = @('git', 'neovim', 'curl', 'sudo', 'jq', 'gcc', 'fzf', 'fastfetch', 'gh', 'nodejs')
foreach ($app in $apps) {
    if (-not (scoop list $app -q)) {
        Write-Host "📥 Instalando $app..." -ForegroundColor Yellow
        scoop install $app
    } else {
        Write-Host "✅ $app ya instalado." -ForegroundColor Green
    }
}

# ░█▀▀░█▀█░█▀█░█▀█░█▀▀░▀█▀
# Instalar módulos de PowerShell
$modules = @('posh-git', 'PSReadLine', 'Terminal-Icons', 'PSFzf')
foreach ($module in $modules) {
    if (-not (Get-Module -ListAvailable -Name $module)) {
        Write-Host "📥 Instalando módulo $module..." -ForegroundColor Yellow
        Install-Module $module -Scope CurrentUser -Force
    } else {
        Write-Host "✅ Módulo $module ya instalado." -ForegroundColor Green
    }
}

# ░█▀▀░█▀█░▀█▀░█▀█░█░█░█▀▀
# Configurar perfil de PowerShell
$profilePath = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

if (-not (Test-Path -Path $profilePath)) {
    New-Item -ItemType File -Path $profilePath -Force
}

# Copiar configuración personalizada desde el repositorio
# Asegúrate de que el archivo user_profile.ps1 esté junto a este script
$userProfileCustom = "$PSScriptRoot\powershell\user_profile.ps1"

if (Test-Path $userProfileCustom) {
    Copy-Item $userProfileCustom -Destination $profilePath -Force
    Write-Host "✅ Perfil de PowerShell copiado correctamente." -ForegroundColor Green
} else {
    Write-Host "⚠️ No se encontró user_profile.ps1 en el repositorio. Saltando copia." -ForegroundColor Red
}

# Ejecutar fastfetch si existe
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch
}

Write-Host "`n✅ Setup completado correctamente." -ForegroundColor Cyan
