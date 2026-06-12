# Smurf Guardian v2.0 🛡️

**Seu Defensor Digital** — Gerenciador de Senhas Seguro, Intuitivo e Acessível

## ✨ Sobre o Projeto

Smurf Guardian é um gerenciador de senhas moderno desenvolvido com foco em:
- 🔒 **Segurança** — Criptografia local, autenticação 2FA
- 🎯 **Usabilidade** — Interface intuitiva e sem fricção
- ♿ **Acessibilidade** — Conformidade total WCAG 2.1

Desenvolvido como protótipo de pesquisa em Interação Humano-Computador (IHC) pela UNIFACS.

## 🚀 Novo na v2.0

### Layout com Sidebar
- Menu lateral fixo com navegação entre seções
- Conteúdo dinâmico (sem recarregar página)
- Responsive design (mobile e desktop)

### Dashboard Completo
- Visão geral: total de senhas, nível de segurança, alertas
- Estatísticas em tempo real
- Atalhos rápidos para funcionalidades

### Cofre de Senhas Avançado
- ✅ Adicionar, editar, deletar senhas
- 🔍 Busca e filtro em tempo real
- 👁️ Toggle de visibilidade
- 📋 Copiar para clipboard
- 📊 Indicador visual de força (barra de progresso)
- 💾 Exportar/Importar em JSON

### Gerador de Senhas Inteligente
- Slider para tamanho (4-32 caracteres)
- Checkboxes para tipos de caracteres
- Força exibida em tempo real
- Salvar direto no cofre
- Regenerar com um clique

### Painel de Acessibilidade
- 🌙 Modo escuro/claro
- 🎨 Alto contraste
- ⚡ Redução de animações
- 📖 Fonte para dislexia (OpenDyslexic)
- 🖱️ Cursor ampliado
- 🔤 Ajuste de tamanho de fonte (4 níveis)
- 📏 Espaçamento de linhas customizável

### Configurações Completas
- Idioma (PT-BR, EN, ES)
- Tempo de bloqueio automático
- Senha mestra obrigatória
- Exportação/Importação de dados
- Sobre o aplicativo

## 🛠️ Tecnologias

- **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
- **Storage:** localStorage (persistência local)
- **Design:** CSS Custom Properties (temas dinâmicos)
- **Accessibility:** WCAG 2.1 Level AA

## 📋 Requisitos Implementados

✅ Layout com sidebar navegável  
✅ Dashboard com estatísticas em tempo real  
✅ Cofre de senhas com CRUD completo  
✅ Gerador de senhas customizável  
✅ Painel de acessibilidade (5+ opções)  
✅ Configurações de aplicativo  
✅ Persistência de dados (localStorage)  
✅ Responsividade total (mobile/tablet/desktop)  
✅ Temas dinâmicos  
✅ Indicadores visuais de força  
✅ Busca/filtro  
✅ Import/Export  

## 🚀 Como Usar

### Local (Desenvolvimento)
```bash
# Com Python 3
python -m http.server 3000

# Acesse em http://localhost:3000
```

### Deploy no Vercel

#### Opção 1: Git (Recomendado)
```bash
# 1. Fazer push para GitHub
git add .
git commit -m "Upgrade v2.0"
git push origin main

# 2. Ir para vercel.com
# 3. Import Project → GitHub
# 4. Selecionar repositório
# 5. Deploy!
```

#### Opção 2: Drag & Drop
```bash
# 1. Abrir https://vercel.com/new
# 2. Arrastar pasta do projeto
# 3. Confirmar
# 4. Deploy automático!
```

#### Opção 3: CLI
```bash
# Instalar Vercel CLI
npm install -g vercel

# No diretório do projeto
vercel

# Seguir as instruções
```

## 🔐 Segurança

- ✅ Dados armazenados localmente (não envia para servidor)
- ✅ Sem cookie tracking
- ✅ HTTPS obrigatório no Vercel
- ✅ Headers de segurança configurados
- ✅ XSS protection
- ✅ Clickjacking protection

## ♿ Acessibilidade

- WCAG 2.1 Level AA compliant
- Compatível com leitores de tela
- Navegação por teclado (Tab, Enter, Escape)
- Alto contraste option
- Fonte amigável para dislexia
- Cursor ampliado
- Redução de animações
- Espaçamento customizável

## 📊 Estrutura do Projeto

```
smurf-guardian/
├── index.html          # Aplicativo completo (single-page)
├── package.json        # Metadados do projeto
├── vercel.json         # Configuração Vercel
├── README.md           # Este arquivo
```

## 👥 Equipe

Desenvolvido por 6 estudantes de **Análise e Desenvolvimento de Sistemas** e **Ciência da Computação** da UNIFACS:

- Isaac Machado dos Santos Araújo
- Diogo Gabriel Pope Machado
- Nadson da Conceição da Cruz
- Luís Henrique Silva Nogueira
- Arthur dos Santos Ferreira
- Gabriel Evangelista Santana

## 📈 Roadmap Futuro

- [ ] Autenticação biométrica (Face ID, fingerprint)
- [ ] Sincronização entre dispositivos
- [ ] Extensão para navegadores (Chrome, Firefox)
- [ ] Aplicativo mobile (React Native)
- [ ] 2FA com autenticador (TOTP)
- [ ] Compartilhamento seguro de senhas
- [ ] Audit trail de atividades
- [ ] Detecção de vazamentos

## 📄 Licença

MIT License — Veja LICENSE para detalhes

## 🤝 Contribuindo

Este é um projeto acadêmico. Para contribuições, abra uma issue ou PR no GitHub.

## 📞 Contato

- **GitHub:** github.com/CadmielMaciel/smurf-guardian
- **Website:** smurf-guardian.vercel.app
- **Email:** contato@smurfguardian.dev

---

**Versão:** 2.0.0  
**Última Atualização:** Junho 2026  
**Status:** ✅ Pronto para Produção
