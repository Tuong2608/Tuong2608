# Refresh Contribution Snake SVGs locally and push to GitHub
$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = (gh auth token)
Set-Location (Split-Path -Parent $PSScriptRoot)

npx --yes generate-snake-animation@3.5.0 `
  --github_user Tuong2608 `
  --output "assets/github-contribution-grid-snake.svg" `
  --output "assets/github-contribution-grid-snake-dark.svg?palette=github-dark"

git add assets/github-contribution-grid-snake*.svg
if (git status --porcelain) {
  git commit -m "chore: update contribution snake animation"
  git push
  Write-Host "Updated and pushed snake animation!" -ForegroundColor Green
} else {
  Write-Host "Snake animation is already up to date." -ForegroundColor Cyan
}
