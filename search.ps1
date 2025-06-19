# PowerShell convenience script for prompt search
# Usage: .\search.ps1 "your query"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
python3 "$ScriptDir\tools\search-prompts.py" $args