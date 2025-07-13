@echo off
REM ADHD Prompt Optimizer - Windows Batch Script

echo.
echo 🚀 ADHD Prompt Optimizer
echo ========================
echo.

if "%1"=="" goto interactive
if "%1"=="-h" goto help
if "%1"=="--help" goto help

REM Run with provided arguments
python optimize.py %*
goto end

:interactive
echo Running in interactive mode...
echo.
python optimize.py -i
goto end

:help
echo Usage:
echo   optimize.bat "Your prompt here"
echo   optimize.bat -f prompt.txt
echo   optimize.bat -i  (Interactive mode)
echo.
echo Options:
echo   -s, --style     Style: auto, technical, debug, learning, creative
echo   -o, --output    Save to file
echo   -j, --json      Output as JSON
echo   -m, --metrics   Show detailed metrics
echo   -q, --quiet     Only show optimized prompt
echo.
echo Examples:
echo   optimize.bat "Create a REST API for user management"
echo   optimize.bat -f long_prompt.txt -o optimized.txt -m
echo   optimize.bat "Debug my code" -s debug
goto end

:end
echo.