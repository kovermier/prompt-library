# migrate_personas.ps1 - Script to migrate persona files into tasks directory
# Usage: .\migrate_personas.ps1

# Define base directories
$PERSONA_DIR = "C:\Users\kover\Documents\GitHub\prompt-library\personas"
$TASKS_DIR = "C:\Users\kover\Documents\GitHub\prompt-library\tasks"

# Create necessary directories if they don't exist
if (-not (Test-Path "$TASKS_DIR\writing\personas\experts")) { New-Item -ItemType Directory -Path "$TASKS_DIR\writing\personas\experts" -Force }
if (-not (Test-Path "$TASKS_DIR\writing\personas\characters")) { New-Item -ItemType Directory -Path "$TASKS_DIR\writing\personas\characters" -Force }
if (-not (Test-Path "$TASKS_DIR\writing\personas\styles")) { New-Item -ItemType Directory -Path "$TASKS_DIR\writing\personas\styles" -Force }
if (-not (Test-Path "$TASKS_DIR\analysis\personas\experts")) { New-Item -ItemType Directory -Path "$TASKS_DIR\analysis\personas\experts" -Force }
if (-not (Test-Path "$TASKS_DIR\analysis\personas\characters")) { New-Item -ItemType Directory -Path "$TASKS_DIR\analysis\personas\characters" -Force }
if (-not (Test-Path "$TASKS_DIR\etc\personas\experts")) { New-Item -ItemType Directory -Path "$TASKS_DIR\etc\personas\experts" -Force }
if (-not (Test-Path "$TASKS_DIR\etc\personas\characters")) { New-Item -ItemType Directory -Path "$TASKS_DIR\etc\personas\characters" -Force }

# Process experts
$expertFiles = Get-ChildItem -Path "$PERSONA_DIR\experts\*.md" -ErrorAction SilentlyContinue
foreach ($file in $expertFiles) {
  $filename = $file.Name
  $content = Get-Content -Path $file.FullName -Raw
  
  # Skip already migrated files
  if ($filename -eq "react_developer.md") { continue }
  
  # Check file content to determine category
  if ($content -match "coding|programming|developer") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\coding\personas\experts\$filename"
    $newContent = $content -replace "personas/experts", "tasks/coding/personas/experts"
    Set-Content -Path "$TASKS_DIR\coding\personas\experts\$filename" -Value $newContent
  }
  elseif ($content -match "writing|content|copywriting") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\writing\personas\experts\$filename"
    $newContent = $content -replace "personas/experts", "tasks/writing/personas/experts"
    Set-Content -Path "$TASKS_DIR\writing\personas\experts\$filename" -Value $newContent
  }
  elseif ($content -match "analysis|analytics|data") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\analysis\personas\experts\$filename"
    $newContent = $content -replace "personas/experts", "tasks/analysis/personas/experts"
    Set-Content -Path "$TASKS_DIR\analysis\personas\experts\$filename" -Value $newContent
  }
  else {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\etc\personas\experts\$filename"
    $newContent = $content -replace "personas/experts", "tasks/etc/personas/experts"
    Set-Content -Path "$TASKS_DIR\etc\personas\experts\$filename" -Value $newContent
  }
}

# Process characters
$characterFiles = Get-ChildItem -Path "$PERSONA_DIR\characters\*.md" -ErrorAction SilentlyContinue
foreach ($file in $characterFiles) {
  $filename = $file.Name
  $content = Get-Content -Path $file.FullName -Raw
  
  # Skip already migrated files
  if ($filename -eq "hackerman_code_reviewer.md") { continue }
  
  # Check file content to determine category
  if ($content -match "coding|programming|developer") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\coding\personas\characters\$filename"
    $newContent = $content -replace "personas/characters", "tasks/coding/personas/characters"
    Set-Content -Path "$TASKS_DIR\coding\personas\characters\$filename" -Value $newContent
  }
  elseif ($content -match "writing|content|copywriting") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\writing\personas\characters\$filename"
    $newContent = $content -replace "personas/characters", "tasks/writing/personas/characters"
    Set-Content -Path "$TASKS_DIR\writing\personas\characters\$filename" -Value $newContent
  }
  elseif ($content -match "analysis|analytics|data") {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\analysis\personas\characters\$filename"
    $newContent = $content -replace "personas/characters", "tasks/analysis/personas/characters"
    Set-Content -Path "$TASKS_DIR\analysis\personas\characters\$filename" -Value $newContent
  }
  else {
    Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\etc\personas\characters\$filename"
    $newContent = $content -replace "personas/characters", "tasks/etc/personas/characters"
    Set-Content -Path "$TASKS_DIR\etc\personas\characters\$filename" -Value $newContent
  }
}

# Process styles if any
$styleFiles = Get-ChildItem -Path "$PERSONA_DIR\styles\*.md" -ErrorAction SilentlyContinue
foreach ($file in $styleFiles) {
  $filename = $file.Name
  $content = Get-Content -Path $file.FullName -Raw
  
  Copy-Item -Path $file.FullName -Destination "$TASKS_DIR\writing\personas\styles\$filename"
  $newContent = $content -replace "personas/styles", "tasks/writing/personas/styles"
  Set-Content -Path "$TASKS_DIR\writing\personas\styles\$filename" -Value $newContent
}

Write-Host "Migration complete. Please review the migrated files and test functionality before removing the original personas directory."
