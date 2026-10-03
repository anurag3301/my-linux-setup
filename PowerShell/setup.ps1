# Fresh-Windows PowerShell setup. Safe to re-run.
# Run from this folder:  powershell -ExecutionPolicy Bypass -File .\setup.ps1
# (Kept ASCII-only and 5.1-compatible: on a fresh install it starts in Windows PowerShell.)

$ErrorActionPreference = 'Stop'

function Step($msg) { Write-Host "==> $msg" -ForegroundColor Cyan }
function Refresh-Path {
    $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
                [Environment]::GetEnvironmentVariable('Path', 'User')
}

# ----- 1. Ensure PowerShell 7, then re-run this script inside it -----
if ($PSVersionTable.PSVersion.Major -lt 7) {
    Step 'Installing PowerShell 7'
    winget install --id Microsoft.PowerShell -e --source winget --accept-package-agreements --accept-source-agreements
    Refresh-Path
    Step 'Re-running setup in PowerShell 7'
    pwsh -NoProfile -ExecutionPolicy Bypass -File $PSCommandPath
    exit $LASTEXITCODE
}

# ----- 2. CLI tools -----
$packages = @(
    'Git.Git',              # git (prompt shows branch/status)
    'ajeetdsouza.zoxide',   # z / zi  (autojump replacement)
    'junegunn.fzf',         # Ctrl+R / Ctrl+T fuzzy search
    'gokcehan.lf',          # lf file manager
    # Neovim helpers (all portable zips, no admin)
    'tree-sitter.tree-sitter-cli',   # builds treesitter parsers (also needs gcc/clang)
    'BurntSushi.ripgrep.MSVC',       # Telescope live_grep
    'sharkdp.fd',                    # Telescope find_files
    'JesseDuffield.lazygit'          # :LazyGit
)
foreach ($id in $packages) {
    Step "Installing $id"
    # Skip installed ones: winget would otherwise try upgrading, which can need admin
    winget list --id $id -e --accept-source-agreements | Out-Null
    if ($LASTEXITCODE -eq 0) { Write-Host '    already installed'; continue }
    winget install --id $id -e --source winget --silent --accept-package-agreements --accept-source-agreements |
        Select-Object -Last 1
}
Refresh-Path

# ----- 3. PowerShell modules -----
Step 'Installing PowerShell modules'
Set-PSRepository PSGallery -InstallationPolicy Trusted
foreach ($m in 'Terminal-Icons', 'PSFzf', 'CompletionPredictor') {
    if (Get-Module -ListAvailable $m) { Write-Host "    $m already installed" }
    else { Install-Module $m -Scope CurrentUser -Force; Write-Host "    $m installed" }
}

# ----- 4. Nerd Font (Meslo Mono: icons fit in one cell, no clipping) -----
Step 'Installing MesloLGM Nerd Font Mono'
$fontDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
if (Test-Path "$fontDir\MesloLGMNerdFontMono-Regular.ttf") {
    Write-Host '    already installed'
} else {
    $zip = Join-Path $env:TEMP 'Meslo.zip'
    $tmp = Join-Path $env:TEMP 'Meslo'
    Invoke-WebRequest 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip' -OutFile $zip
    Expand-Archive $zip $tmp -Force
    New-Item -ItemType Directory -Force $fontDir | Out-Null
    $reg = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts'
    foreach ($f in Get-ChildItem $tmp -Filter 'MesloLGMNerdFontMono-*.ttf') {
        Copy-Item $f.FullName $fontDir -Force
        $name = ($f.BaseName -replace 'MesloLGMNerdFontMono-', 'MesloLGM Nerd Font Mono ') + ' (TrueType)'
        Set-ItemProperty $reg -Name $name -Value (Join-Path $fontDir $f.Name)
    }
    Remove-Item $zip, $tmp -Recurse -Force
    Write-Host '    installed'
}

# ----- 5. Link $PROFILE to profile.ps1 in this repo -----
Step 'Linking $PROFILE to this repo'
$source = Join-Path $PSScriptRoot 'profile.ps1'
New-Item -ItemType Directory -Force (Split-Path $PROFILE) | Out-Null
$existing = Get-Item $PROFILE -ErrorAction SilentlyContinue
if ($existing -and -not $existing.LinkType -and -not (Select-String -Path $PROFILE -SimpleMatch $source -Quiet)) {
    Copy-Item $PROFILE "$PROFILE.bak" -Force
    Write-Host "    backed up existing profile to $PROFILE.bak"
}
Remove-Item $PROFILE -Force -ErrorAction SilentlyContinue
try {
    # Needs admin or Developer Mode (Settings > System > For developers).
    # (A junction won't do: those are folder-only, and Documents\PowerShell also holds Modules.)
    New-Item -ItemType SymbolicLink -Path $PROFILE -Target $source -ErrorAction Stop | Out-Null
    Write-Host "    symlinked $PROFILE -> $source"
} catch {
    # Fallback: a one-line stub that loads the repo file - same effect, no admin needed
    Set-Content $PROFILE ". '$source'" -Encoding utf8
    Write-Host "    symlink not permitted; wrote stub that loads $source"
}

# ----- 6. Link Neovim config (%LOCALAPPDATA%\nvim) to ..\config\nvim -----
# Directory junction: a real link for folders that needs no admin / Developer Mode
Step 'Linking Neovim config'
$nvimLink   = Join-Path $env:LOCALAPPDATA 'nvim'
$nvimSource = Join-Path (Split-Path $PSScriptRoot) 'config\nvim'
$existing = Get-Item $nvimLink -Force -ErrorAction SilentlyContinue
if ($existing -and $existing.LinkType) {
    $existing.Delete()   # removes only the link, never the target's contents
} elseif ($existing) {
    $bak = "$nvimLink.bak"
    Move-Item $nvimLink $bak -Force
    Write-Host "    backed up existing config to $bak"
}
New-Item -ItemType Junction -Path $nvimLink -Target $nvimSource | Out-Null
Write-Host "    junction $nvimLink -> $nvimSource"

# ----- 7. Windows Terminal: default to PowerShell 7 + Nerd Font -----
Step 'Configuring Windows Terminal'
$wtPaths = @(
    "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json",
    "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
)
$wt = $wtPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $wt) {
    Write-Host '    settings.json not found - open Windows Terminal once, then re-run this script' -ForegroundColor Yellow
} else {
    if (-not (Test-Path "$wt.bak")) { Copy-Item $wt "$wt.bak" }   # keep the original, not a re-run's
    $j = Get-Content $wt -Raw | ConvertFrom-Json
    $pwshProfile = $j.profiles.list | Where-Object { $_.source -eq 'Windows.Terminal.PowershellCore' } | Select-Object -First 1
    if ($pwshProfile) { $j.defaultProfile = $pwshProfile.guid }
    if (-not $j.profiles.defaults) { $j.profiles | Add-Member defaults ([pscustomobject]@{}) -Force }
    $j.profiles.defaults | Add-Member font ([pscustomobject]@{ face = 'MesloLGM Nerd Font Mono' }) -Force
    [IO.File]::WriteAllText($wt, ($j | ConvertTo-Json -Depth 32))
    Write-Host "    default profile: PowerShell 7, font: MesloLGM Nerd Font Mono (backup: $wt.bak)"
}

Step 'Setup completed!!! Restart Windows Terminal.'
