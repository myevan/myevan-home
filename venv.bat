@echo off
if not exist %~dp0.venv (
    python -m venv %~dp0.venv
)

if not "%1" == "" (
    %~dp0.venv\Scripts\%*
)