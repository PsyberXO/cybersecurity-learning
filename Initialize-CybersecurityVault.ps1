# Initialize-CybersecurityVault.ps1
$Vault = "C:\projects\cybersecurity-learning"

$folders=@(
"00 Management","00 Management\Dashboard","00 Management\Learning Roadmap","00 Management\Weekly Planner","00 Management\Daily Notes","00 Management\Templates","00 Management\Progress Tracker",
"10 Core Knowledge","10 Core Knowledge\Networking","10 Core Knowledge\Linux","10 Core Knowledge\Windows","10 Core Knowledge\Git & GitHub","10 Core Knowledge\Markdown","10 Core Knowledge\PowerShell","10 Core Knowledge\Python","10 Core Knowledge\Active Directory","10 Core Knowledge\SIEM","10 Core Knowledge\Detection Engineering","10 Core Knowledge\Threat Hunting","10 Core Knowledge\Malware Analysis","10 Core Knowledge\Cloud Security","10 Core Knowledge\Cryptography","10 Core Knowledge\Commands","10 Core Knowledge\Cheatsheets",
"20 Hands-on Labs","20 Hands-on Labs\TryHackMe","20 Hands-on Labs\Hack The Box","20 Hands-on Labs\Home Lab","20 Hands-on Labs\Blue Team Labs","20 Hands-on Labs\Windows Labs","20 Hands-on Labs\Linux Labs","20 Hands-on Labs\Network Labs","20 Hands-on Labs\Lab Reports",
"30 Projects","30 Projects\GitHub Projects","30 Projects\Automation Scripts","30 Projects\Detection Rules","30 Projects\Portfolio","30 Projects\Write-ups",
"40 Career Development","40 Career Development\Certifications","40 Career Development\Interview Questions","40 Career Development\Revision Notes","40 Career Development\CV","40 Career Development\Learning Reflections","40 Career Development\Career Planning",
"90 Resources","90 Resources\Books","90 Resources\PDFs","90 Resources\References","90 Resources\Websites","90 Resources\Cheat Sheets")
New-Item -ItemType Directory -Force -Path $Vault|Out-Null
foreach($f in $folders){
$p=Join-Path $Vault $f
New-Item -ItemType Directory -Force -Path $p|Out-Null
New-Item -ItemType File -Force -Path (Join-Path $p ".gitkeep")|Out-Null
}
$topics=@("Networking","Linux","Windows","Git & GitHub","Markdown","PowerShell","Python","Active Directory","SIEM","Detection Engineering","Threat Hunting","Malware Analysis","Cloud Security","Cryptography")
foreach($t in $topics){
$dir=Join-Path (Join-Path $Vault "10 Core Knowledge") $t
@"
# $t

## Overview

## Concepts

## Commands

## Labs

## Notes

## References

## Revision
"@ | Set-Content (Join-Path $dir "$t.md")
}
@"
# Cybersecurity Vault

See Home.md to begin.
"@|Set-Content (Join-Path $Vault "README.md")
@"
.obsidian/workspace.json
.obsidian/cache
Thumbs.db
.DS_Store
*.tmp
*.bak
"@|Set-Content (Join-Path $Vault ".gitignore")
@"
# Cybersecurity Vault

- [[Dashboard]]
- [[Learning Roadmap]]
- [[Weekly Planner]]
- [[Networking]]
- [[Linux]]
- [[Windows]]
- [[PowerShell]]
- [[Python]]
"@|Set-Content (Join-Path $Vault "Home.md")
$tpl=Join-Path $Vault "00 Management\Templates"
@"
# Lab Report

## Objective
## Environment
## Procedure
## Findings
## Lessons Learned
"@|Set-Content (Join-Path $tpl "Lab Report Template.md")
@"
# Project

## Objective
## Implementation
## Lessons Learned
"@|Set-Content (Join-Path $tpl "Project Template.md")
@"
# Incident Report

## Summary
## Timeline
## Root Cause
## Recovery
"@|Set-Content (Join-Path $tpl "Incident Report.md")
@"
# Detection Rule

## Name
## Logic
## Test Results
"@|Set-Content (Join-Path $tpl "Detection Rule Template.md")
@"
# Learning Note
"@|Set-Content (Join-Path $tpl "Learning Note.md")
@"
# Daily Note
"@|Set-Content (Join-Path $tpl "Daily Note.md")
@"
# Weekly Review
"@|Set-Content (Join-Path $tpl "Weekly Review.md")
@"
# Cheat Sheet
"@|Set-Content (Join-Path $tpl "Cheatsheet Template.md")
"Done."
