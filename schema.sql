-- =============================================
-- MILHONÁRIOS 🌽 — SCHEMA DO SUPABASE
-- Cole este SQL no SQL Editor do Supabase e clique em "Run"
-- =============================================

CREATE TABLE transactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  descricao TEXT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  tipo TEXT NOT NULL CHECK (tipo IN ('gasto','receita')),
  categoria TEXT NOT NULL,
  pessoa TEXT NOT NULL CHECK (pessoa IN ('eu','conjuge','casal')),
  data DATE NOT NULL,
  observacao TEXT
);

CREATE TABLE metas (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  nome TEXT NOT NULL,
  valor_alvo DECIMAL(10,2) NOT NULL,
  valor_atual DECIMAL(10,2) DEFAULT 0,
  data_limite DATE,
  cor TEXT DEFAULT '#f5c518',
  concluida BOOLEAN DEFAULT FALSE
);

CREATE TABLE divisoes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  descricao TEXT NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  pago_por TEXT NOT NULL CHECK (pago_por IN ('eu','conjuge')),
  data DATE NOT NULL,
  quitado BOOLEAN DEFAULT FALSE
);

CREATE TABLE orcamentos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  categoria TEXT NOT NULL UNIQUE,
  limite_mensal DECIMAL(10,2) NOT NULL,
  ativo BOOLEAN DEFAULT TRUE
);

-- Habilitar acesso público (app privado do casal)
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE metas ENABLE ROW LEVEL SECURITY;
ALTER TABLE divisoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE orcamentos ENABLE ROW LEVEL SECURITY;

CREATE POLICY "publico" ON transactions FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "publico" ON metas FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "publico" ON divisoes FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "publico" ON orcamentos FOR ALL USING (true) WITH CHECK (true);
