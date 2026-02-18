#!/bin/bash
# Sync fork with upstream repository
# Usage: ./sync-fork.sh

echo "🔄 Sincronizando fork com repositório original..."

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Erro: Não estamos em um repositório Git"
    exit 1
fi

# Fetch from upstream
echo ""
echo "📥 Buscando atualizações do upstream..."
git fetch upstream
if [ $? -ne 0 ]; then
    echo "❌ Erro ao fazer fetch do upstream"
    exit 1
fi

# Merge upstream/main into local main
echo ""
echo "🔗 Sincronizando com upstream/main..."
git merge upstream/main
if [ $? -ne 0 ]; then
    echo "⚠️  Conflito detectado. Resolva manualmente e commit."
    exit 1
fi

# Push to origin
echo ""
echo "📤 Enviando para seu fork..."
git push origin main
if [ $? -ne 0 ]; then
    echo "❌ Erro ao fazer push para origin"
    exit 1
fi

echo ""
echo "✅ Fork sincronizado com sucesso!"
echo "📊 Status:"
git log --oneline -3
