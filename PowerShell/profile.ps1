# PowerShell 7 profile — linked to $PROFILE by setup.ps1, so edits here apply directly.
# Edit with `prc`, reload with `. $PROFILE`

# ===== Prompt =====
# Pure-PowerShell prompt: no external process per prompt, so it's instant.
# (Oh My Posh spawns an exe per prompt and cost ~450ms on Windows.)

function Get-GitBranch {
    $dir = Get-Item -LiteralPath $PWD.ProviderPath -ErrorAction SilentlyContinue
    while ($dir) {
        $git = Join-Path $dir.FullName '.git'
        if (Test-Path -LiteralPath $git) {
            if (-not (Test-Path -LiteralPath $git -PathType Container)) {
                # worktree/submodule: .git is a file containing "gitdir: <path>"
                $git = ((Get-Content -LiteralPath $git -TotalCount 1) -replace '^gitdir:\s*', '')
                if (-not [IO.Path]::IsPathRooted($git)) { $git = Join-Path $dir.FullName $git }
            }
            $head = Get-Content -LiteralPath (Join-Path $git 'HEAD') -TotalCount 1 -ErrorAction SilentlyContinue
            if ($head -match '^ref: refs/heads/(.+)$') { return $Matches[1] }
            if ($head) { return $head.Substring(0, 7) }   # detached HEAD
            return $null
        }
        $dir = $dir.Parent
    }
}

# Branch + status from one `git status` call, e.g. " main ↑1↓2 +1 ~3 -1 ?2 !1"
#   ↑/↓ ahead/behind   + staged   ~ modified   - deleted   ? untracked   ! conflicts
function Get-GitStatus {
    $esc = [char]27
    $lines = git --no-optional-locks status --porcelain=v2 --branch 2>$null
    if ($LASTEXITCODE -ne 0) { return '' }

    $branch = ''; $ahead = 0; $behind = 0
    $staged = 0; $modified = 0; $deleted = 0; $untracked = 0; $conflicts = 0
    foreach ($l in $lines) {
        switch -Regex ($l) {
            '^# branch\.head (.+)$'          { $branch = $Matches[1] }
            '^# branch\.oid (\w{7})'         { $oid = $Matches[1] }
            '^# branch\.ab \+(\d+) -(\d+)$'  { $ahead = [int]$Matches[1]; $behind = [int]$Matches[2] }
            '^[12] (.)(.) ' {
                if ($Matches[1] -ne '.') { $staged++ }
                if ($Matches[2] -eq 'D') { $deleted++ } elseif ($Matches[2] -ne '.') { $modified++ }
            }
            '^u '  { $conflicts++ }
            '^\? ' { $untracked++ }
        }
    }
    if ($branch -eq '(detached)') { $branch = $oid }

    $s = " $esc[35m $branch$esc[0m"
    if ($ahead)     { $s += " $esc[36m↑$ahead$esc[0m" }
    if ($behind)    { $s += "$esc[36m↓$behind$esc[0m" }
    if ($staged)    { $s += " $esc[32m+$staged$esc[0m" }
    if ($modified)  { $s += " $esc[33m~$modified$esc[0m" }
    if ($deleted)   { $s += " $esc[31m-$deleted$esc[0m" }
    if ($untracked) { $s += " $esc[90m?$untracked$esc[0m" }
    if ($conflicts) { $s += " $esc[1;31m!$conflicts$esc[0m" }
    if (-not ($staged + $modified + $deleted + $untracked + $conflicts)) { $s += " $esc[32m✓$esc[0m" }
    $s
}

function prompt {
    $ok = $?
    $savedExit = $global:LASTEXITCODE   # git calls below would clobber it
    $esc = [char]27
    $path = $PWD.ProviderPath
    if ($path.StartsWith($HOME, [StringComparison]::OrdinalIgnoreCase)) { $path = '~' + $path.Substring($HOME.Length) }

    $logo = [char]0xF17A   # Nerd Font Windows logo (nf-fa-windows)
    $out = "`n$esc[94m$logo$esc[0m $esc[1;36m$path$esc[0m"
    # Cheap .git lookup first, so git.exe only runs inside repos
    if (Get-GitBranch) { $out += Get-GitStatus }

    $color = if ($ok) { '32' } else { '31' }
    $out += " $esc[${color}m❯$esc[0m "
    $global:LASTEXITCODE = $savedExit
    $out
}

Import-Module Terminal-Icons -ErrorAction SilentlyContinue        # icons in ls/Get-ChildItem
Import-Module CompletionPredictor -ErrorAction SilentlyContinue   # command/param suggestions

# ===== Autosuggestions (zsh-autosuggestions style) =====
try {
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin -ErrorAction Stop
    Set-PSReadLineOption -PredictionViewStyle InlineView   # F2 toggles ListView dropdown
} catch {}   # fails only in non-interactive/redirected hosts
Set-PSReadLineOption -HistoryNoDuplicates -MaximumHistoryCount 10000
Set-PSReadLineOption -EditMode Windows

# Right arrow / End accepts full suggestion, Ctrl+F accepts one word
Set-PSReadLineKeyHandler -Key RightArrow -Function ForwardChar
Set-PSReadLineKeyHandler -Key Ctrl+f -Function ForwardWord

# Up/Down search history by typed prefix
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# zsh-style menu completion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# ===== fzf: Ctrl+R fuzzy history, Ctrl+T fuzzy file picker =====
if (Get-Command fzf -ErrorAction SilentlyContinue) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}

# ===== zoxide: `z <partial>` jumps to frecent dirs, `zi` for interactive =====
if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    Invoke-Expression (& { (zoxide init powershell | Out-String) })
}

# ===== lf file manager: cds into the last dir you were in when you quit =====
# Calls lf.exe explicitly so the function doesn't recurse into itself
function lf { $dir = lf.exe -print-last-dir @args; if ($dir -and (Test-Path -LiteralPath $dir)) { Set-Location -LiteralPath $dir } }

if (Get-Command nvim -ErrorAction SilentlyContinue) { $env:EDITOR = 'nvim' }

# ===== Aliases =====
# like zrc: edit this file (the repo copy, even if $PROFILE is a stub).
# Can't auto-reload: dot-sourcing inside a function only defines things in the function's scope.
$ProfileSource = $PSCommandPath
function prc {
    if ($env:EDITOR) { & $env:EDITOR $ProfileSource } else { notepad $ProfileSource }
    Write-Host 'Reload with: . $PROFILE' -ForegroundColor DarkGray
}
function c { Clear-Host }
function q { exit }
function ll { Get-ChildItem -Force @args }
function which($cmd) { (Get-Command $cmd).Source }
function touch($f) { if (-not (Test-Path $f)) { New-Item -ItemType File $f | Out-Null } else { (Get-Item $f).LastWriteTime = Get-Date } }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
Remove-Item Alias:gc, Alias:gp, Alias:gl -Force -ErrorAction SilentlyContinue  # built-ins shadow functions
function gs { git status @args }
function ga { git add @args }
function gc { git commit @args }
function gp { git push @args }
function gl { git log --oneline --graph --decorate @args }

# ===== fastfetch on startup (interactive shells only, not `pwsh -c ...`) =====
$nonInteractive = [Environment]::GetCommandLineArgs() | Where-Object { $_ -match '^-(c|command|f|file|noni|noninteractive)$' }
if (-not $nonInteractive -and (Get-Command fastfetch -ErrorAction SilentlyContinue)) { fastfetch }
Remove-Variable nonInteractive
