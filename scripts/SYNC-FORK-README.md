# Fork Synchronization Scripts

Scripts para manter seu fork (`genesishenrique-ai/aios-core`) sincronizado com o repositório original (`SynkraAI/aios-core`).

## 📋 O que fazem

Os scripts automatizam o processo de sincronização:

1. **Busca atualizações** do repositório original (`upstream`)
2. **Sincroniza** a branch `main` com `upstream/main`
3. **Envia** as mudanças para seu fork (`origin`)

## 🚀 Como usar

### Windows (PowerShell)

```powershell
.\scripts\sync-fork.ps1
```

### macOS / Linux (Bash)

```bash
bash scripts/sync-fork.sh
```

## 📊 Exemplo de execução

```
🔄 Sincronizando fork com repositório original...

📥 Buscando atualizações do upstream...
From https://github.com/SynkraAI/aios-core
   6eaa7aa9..03c52557  main       -> upstream/main

🔗 Sincronizando com upstream/main...
Merge made by the 'recursive' strategy.
 package.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

📤 Enviando para seu fork...
To https://github.com/genesishenrique-ai/aios-core.git
   6eaa7aa9..03c52557  main -> main

✅ Fork sincronizado com sucesso!
```

## ⚙️ Configuração (primeira vez)

Se ainda não configurou upstream, execute:

```bash
git remote add upstream https://github.com/SynkraAI/aios-core.git
```

Verifique com:

```bash
git remote -v
```

Deve mostrar:
```
origin    https://github.com/genesishenrique-ai/aios-core.git (fetch)
origin    https://github.com/genesishenrique-ai/aios-core.git (push)
upstream  https://github.com/SynkraAI/aios-core.git (fetch)
upstream  https://github.com/SynkraAI/aios-core.git (push)
```

## 🔧 Resolver conflitos

Se houver conflitos durante o merge:

```bash
# Ver conflitos
git status

# Editar os arquivos para resolver
# Depois fazer commit
git add .
git commit -m "Resolve merge conflicts from upstream"

# Continuar com o push manualmente
git push origin main
```

## 📅 Recomendação

Execute regularmente para manter seu fork atualizado:

- **Diariamente** se trabalha ativamente no projeto
- **Semanalmente** para sincronizações periódicas
- **Antes de criar PRs** para evitar conflitos

## 💡 Dicas

- Use `git log --oneline -10` para ver histórico recente
- Use `git status` para verificar o estado atual
- Use `git diff upstream/main` para ver o que mudou

---

**Mantido por:** Claude Code
**Última atualização:** 2026-02-17
