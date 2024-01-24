-- Cria o banco de dados
CREATE DATABASE BASE_DEV;

-- Cria o esquema public
CREATE SCHEMA public;

-- Migra a tabela USUARIO
CREATE TABLE public.usuario (
  id serial PRIMARY KEY,
  nome text NOT NULL,
  provider text NOT NULL,
  access_token text,
  refresh_token text,
  numero_telefone text NOT NULL,
  email text NOT NULL
);

-- Migra a tabela CONTA
CREATE TABLE public.conta (
  id serial PRIMARY KEY,
  id_usuario integer NOT NULL,
  limite_credito numeric(10,2) NOT NULL,
  limite_disponivel numeric(10,2) NOT NULL,
  limite_ocupado numeric(10,2) NOT NULL,
  saldo_atual numeric(10,2) NOT NULL,
  CONSTRAINT fk_conta_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id)
);

-- Migra a tabela DESPESA
CREATE TABLE public.despesa (
  id serial PRIMARY KEY,
  id_usuario integer NOT NULL,
  valor numeric(10,2) NOT NULL,
  quitado boolean NOT NULL,
  fixa_ou_recorrente boolean NOT NULL,
  recorrencia integer NOT NULL,
  CONSTRAINT fk_despesa_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id)
);

-- Migra a tabela RECEITA
CREATE TABLE public.receita (
  id serial PRIMARY KEY,
  id_usuario integer NOT NULL,
  valor numeric(10,2) NOT NULL,
  fixa_ou_recorrente boolean NOT NULL,
  recorrencia integer NOT NULL,
  CONSTRAINT fk_receita_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id)
);

-- Migra a tabela CARTAO_DE_CREDITO
CREATE TABLE public.cartao_de_credito (
  id serial PRIMARY KEY,
  id_usuario integer NOT NULL,
  id_conta integer,
  limite numeric(10,2) NOT NULL,
  limite_disponivel numeric(10,2) NOT NULL,
  limite_ocupado numeric(10,2) NOT NULL,
  vencimento date NOT NULL,
  CONSTRAINT fk_cartao_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id),
  CONSTRAINT fk_cartao_conta
    FOREIGN KEY (id_conta)
    REFERENCES public.conta (id)
);

-- Migra a tabela OBJETIVO
CREATE TABLE public.objetivo (
  id serial PRIMARY KEY,
  id_usuario integer NOT NULL,
  nome text NOT NULL,
  prazo_final date NOT NULL,
  data_inicial date NOT NULL,
  valor_acumulado_ate_o_momento numeric(10,2) NOT NULL,
  valor_final numeric(10,2) NOT NULL,
  valor_inicial numeric(10,2) DEFAULT 0,
  fixa_ou_recorrente boolean NOT NULL,
  recorrencia integer NOT NULL,
  CONSTRAINT fk_objetivo_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES public.usuario (id)
);