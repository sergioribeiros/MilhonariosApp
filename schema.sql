-- MILHONÁRIOS 🌽 - SCHEMA v2
-- Cole no SQL Editor do Supabase e clique Run

-- Apaga tabelas antigas se existirem
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS metas CASCADE;
DROP TABLE IF EXISTS divisoes CASCADE;
DROP TABLE IF EXISTS orcamentos CASCADE;
DROP TABLE IF EXISTS contas_fixas CASCADE;

-- Transações (gastos e receitas)
-- divisao: 'nao' = sem divisão | '50-50' = divide meio a meio | 'total' = quem pagou cobrou tudo do outro
CREATE TABLE transactions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  descricao TEXT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  tipo TEXT NOT NULL CHECK (tipo IN ('gasto','receita')),
  categoria TEXT NOT NULL,
  pago_por TEXT NOT NULL CHECK (pago_por IN ('sergio','brenda','casal')),
  divisao TEXT NOT NULL DEFAULT 'nao' CHECK (divisao IN ('nao','50-50','total')),
  data DATE NOT NULL,
  observacao TEXT,
  conta_fixa_id UUID
);

-- Metas de economia
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

-- Orçamentos mensais por categoria
CREATE TABLE orcamentos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  categoria TEXT NOT NULL UNIQUE,
  limite_mensal DECIMAL(10,2) NOT NULL,
  ativo BOOLEAN DEFAULT TRUE
);

-- Contas fixas recorrentes
CREATE TABLE contas_fixas (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  descricao TEXT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  categoria TEXT NOT NULL,
  pago_por TEXT NOT NULL CHECK (pago_por IN ('sergio','brenda','casal')),
  divisao TEXT NOT NULL DEFAULT 'nao' CHECK (divisao IN ('nao','50-50','total')),
  dia_vencimento INTEGER DEFAULT 1,
  repetir_meses INTEGER DEFAULT 0,
  meses_restantes INTEGER DEFAULT 0,
  ativa BOOLEAN DEFAULT TRUE,
  mes_inicio TEXT NOT NULL
);

-- RLS público
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE metas ENABLE ROW LEVEL SECURITY;
ALTER TABLE orcamentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE contas_fixas ENABLE ROW LEVEL SECURITY;

CREATE POLICY "pub" ON transactions FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "pub" ON metas FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "pub" ON orcamentos FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "pub" ON contas_fixas FOR ALL USING (true) WITH CHECK (true);
