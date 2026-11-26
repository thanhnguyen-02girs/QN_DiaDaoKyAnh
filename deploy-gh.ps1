param(
    [string]$RepoUrl = "",
    [string]$Message = "Update project"
)

if (-not (Test-Path ".nojekyll")) {
    New-Item -Path ".nojekyll" -ItemType File -Force | Out-Null
}

if (-not (Test-Path ".git")) {
    if (-not $RepoUrl) {
        $RepoUrl = Read-Host "Nhap URL repo GitHub (.git)"
    }
    git init -b main
    git config user.name "thanhnguyen-02girs"
    git config user.email "thanhnguyen-02girs@users.noreply.github.com"
    git remote add origin $RepoUrl
    $Message = "Initial commit"
}

git add -A
git commit -m $Message
git push -u origin main
