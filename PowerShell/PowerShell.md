# PowerShell Installation and configuration (Windows)
oh-my-zsh–style setup for PowerShell 7: history autosuggestions, fuzzy search, `z` jumping,
icons, a fast git-aware prompt, and `lf`. Everything lives in one file: [`profile.ps1`](./profile.ps1).

## Fresh Windows install
```powershell
# 1. install git and clone this repo (https, since ssh keys aren't set up yet)
winget install --id Git.Git -e --source winget
# reopen the terminal so git is on PATH, then:
git clone https://github.com/anurag3301/my-linux-setup.git $HOME\Documents\my-linux-setup

# 2. open Windows Terminal once (creates its settings.json), then run the setup
cd $HOME\Documents\my-linux-setup\PowerShell
powershell -ExecutionPolicy Bypass -File .\setup.ps1

# 3. restart Windows Terminal
```
If `winget` isn't found on a brand-new install, update **App Installer** from the Microsoft Store first.

### What `setup.ps1` does
| Step | What |
|---|---|
| PowerShell 7 | Installs `pwsh` and re-runs itself in it (fresh Windows only has 5.1) |
| CLI tools | `git`, `zoxide`, `fzf`, `lf`, plus for Neovim: `tree-sitter`, `rg`, `fd`, `lazygit` (winget) |
| Modules | `Terminal-Icons`, `PSFzf`, `CompletionPredictor` from PSGallery |
| Font | MesloLGM Nerd Font **Mono** (non-Mono icons clip in Windows Terminal) |
| Profile | Links `$PROFILE` → `profile.ps1` in this repo, backing up any existing profile |
| Neovim | Junctions `%LOCALAPPDATA%\nvim` → [`config/nvim`](../config/nvim) (backs up an existing config to `nvim.bak`) |
| Terminal | Sets PowerShell 7 as default profile and the Nerd Font (backs up `settings.json`) |

Nothing needs admin. Already-installed winget packages are skipped (an upgrade attempt can need admin).

### Linking
Neovim's config is a folder, so it uses a **directory junction** — a real link that needs no admin.

`setup.ps1` tries a real symlink, which needs **admin** or **Developer Mode**
(Settings → System → For developers). Otherwise it writes a one-line stub to `$PROFILE`:
```powershell
. 'C:\Users\<you>\Documents\my-linux-setup\PowerShell\profile.ps1'
```
Either way, editing `profile.ps1` in the repo is what the shell uses — `git pull` and reload.

## Neovim on Windows
Install Neovim yourself (e.g. the `nvim-win64` zip, or `winget install Neovim.Neovim`), then
the config in [`config/nvim`](../config/nvim) works as-is. Windows-specific handling:
- [`lua/windows.lua`](../config/nvim/lua/windows.lua) (loaded only on Windows) sets `$HOME` and
  makes `pwsh` the shell, so `:Run` (F5) commands and toggleterm (F1) work.
- Treesitter parsers need a C compiler on PATH (e.g. MinGW `gcc`) besides the `tree-sitter` CLI;
  without them nvim still starts, just with regex highlighting.
- Plugins whose tools are missing are skipped instead of erroring: platformio (needs `pio`),
  luarocks.nvim (needs `lua`), jdtls (Linux path), LuaSnip's `make` build, markdown-preview
  downloads a prebuilt app when `yarn` is missing.

## Usage
| Key / command | Does |
|---|---|
| typing | grey history suggestion (zsh-autosuggestions) |
| `→` / `End` | accept suggestion · `Ctrl+F` accepts one word |
| `F2` | toggle inline ↔ list view of suggestions |
| `↑` / `↓` | history search by typed prefix |
| `Tab` | zsh-style completion menu |
| `Ctrl+R` / `Ctrl+T` | fzf history / file picker |
| `z foo` / `zi` | jump to frecent dir / pick interactively |
| `lf` | file manager; cds to last dir on quit (`lf.exe` for plain lf) |
| `prc` | edit profile (like `zrc`), then reload with `. $PROFILE` |
| `c`, `q`, `ll`, `which`, `touch`, `..`, `...` | the usual |
| `gs` `ga` `gc` `gp` `gl` | git status/add/commit/push/log (`gc`/`gp`/`gl` replace built-in aliases) |

## Prompt
```
~\projects\myapp  main ↑1 +1 ~2 -1 ?3 ❯
```
`↑↓` ahead/behind · `+` staged · `~` modified · `-` deleted · `?` untracked · `!` conflicts · `✓` clean ·
duration shown for commands ≥ 2s · `❯` red after a failed command.

It's written in plain PowerShell instead of Oh My Posh: Oh My Posh launches an exe on
every prompt (~450ms on Windows); this is ~20ms, plus one `git status` inside repos.
