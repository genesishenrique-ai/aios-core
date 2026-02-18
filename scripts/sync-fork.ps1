# Sync fork with upstream repository
# Usage: ./sync-fork.ps1

Write-Host "🔄 Sincronizando fork com repositório original..." -ForegroundColor Cyan

# Check if we're in a git repository
if (-not (Test-Path .git)) {
    Write-Host "❌ Erro: Não estamos em um repositório Git" -ForegroundColor Red
    exit 1
}

# Fetch from upstream
Write-Host "`n📥 Buscando atualizações do upstream..." -ForegroundColor Yellow
git fetch upstream
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao fazer fetch do upstream" -ForegroundColor Red
    exit 1
}

# Merge upstream/main into local main
Write-Host "`n🔗 Sincronizando com upstream/main..." -ForegroundColor Yellow
git merge upstream/main
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  Conflito detectado. Resolva manualmente e commit." -ForegroundColor Yellow
    exit 1
}

# Push to origin
Write-Host "`n📤 Enviando para seu fork..." -ForegroundColor Yellow
git push origin main
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao fazer push para origin" -ForegroundColor Red
    exit 1
}

Write-Host "`n✅ Fork sincronizado com sucesso!" -ForegroundColor Green
Write-Host "📊 Status:" -ForegroundColor Cyan
git log --oneline -3
