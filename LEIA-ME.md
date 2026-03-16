# 🌽 Milhonários — Guia de Instalação

## O que você vai ter no final
- App funcionando no celular de vocês dois
- Dados sincronizados em tempo real
- Totalmente gratuito

---

## PASSO 1 — Criar o banco de dados (Supabase)

1. Acesse **https://supabase.com** e crie uma conta gratuita
2. Clique em **"New project"**
   - Name: `milhonarios`
   - Region: `South America (São Paulo)`
3. Aguarde ~2 minutos
4. Vá em **SQL Editor → New query**
5. Cole o conteúdo do arquivo `schema.sql` e clique em **Run**
6. Vá em **Project Settings → API** e copie:
   - **Project URL**
   - **anon public** key

---

## PASSO 2 — Hospedar o app (grátis)

### Opção A: Netlify (recomendado, mais fácil)
1. Acesse **https://netlify.com** e crie uma conta
2. Arraste a pasta `milhonarios` para o site deles
3. Pronto! Vai gerar um link tipo `https://xyz.netlify.app`

### Opção B: Vercel
1. Acesse **https://vercel.com**
2. Faça upload da pasta ou conecte ao GitHub
3. Gera um link tipo `https://xyz.vercel.app`

### Opção C: GitHub Pages (gratuito)
1. Crie um repositório no GitHub
2. Suba os arquivos
3. Vá em Settings → Pages → Branch: main

---

## PASSO 3 — Abrir no celular como app

### Android:
1. Abra o link no **Chrome**
2. Toque nos 3 pontinhos (**⋮**) → **"Adicionar à tela inicial"**
3. Confirme — vira um ícone igual a app nativo! 🎉

### iPhone:
1. Abra o link no **Safari**
2. Toque no ícone de compartilhar (⬆️)
3. Role e toque em **"Adicionar à Tela de Início"**
4. Confirme — vira um ícone! 🎉

---

## PASSO 4 — Configurar o app

Na primeira vez que abrir o app:
1. Cole a **URL do Supabase**
2. Cole a **Anon Key**
3. Digite seu nome e o nome do cônjuge
4. Clique em **"Começar!"**

Faça isso nos dois celulares com os mesmos dados do Supabase — aí tudo sincroniza! 🌽

---

## Funcionalidades

| Tela | O que faz |
|------|-----------|
| 🏠 Início | Saldo, resumo, alertas de orçamento |
| 📋 Transações | Gastos e receitas com filtros |
| 🎯 Metas | Metas de economia com progresso |
| 👫 Divisão | Racha contas, mostra quem deve pra quem |
| 📈 Gráficos | Gráficos por categoria e pessoa |
