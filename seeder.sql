-- Popula a tabela USUARIO
INSERT INTO public.usuario (nome, provider, access_token, refresh_token, numero_telefone, email)
VALUES
('João da Silva', 'facebook', '1234567890', '9876543210', '1234567890', 'joao.silva@email.com'),
('Maria das Dores', 'google', '9876543210', '8765432109', '9876543210', 'maria.dores@email.com');

-- Popula a tabela CONTA
INSERT INTO public.conta (id_usuario, limite_credito, limite_disponivel, limite_ocupado, saldo_atual)
VALUES
(1, 10000, 10000, 0, 10000),
(2, 20000, 20000, 0, 20000);

-- Popula a tabela DESPESA
INSERT INTO public.despesa (id_usuario, valor, quitado, fixa_ou_recorrente, recorrencia)
VALUES
(1, 100, true, true, 1),
(1, 200, false, true, 1),
(2, 300, true, false, null),
(2, 400, false, false, null);

-- Popula a tabela RECEITA
INSERT INTO public.receita (id_usuario, valor, fixa_ou_recorrente, recorrencia)
VALUES
(1, 500, true, 1),
(1, 600, true, 1),
(2, 700, false, null),
(2, 800, false, null);

-- Popula a tabela CARTAO_DE_CREDITO
INSERT INTO public.cartao_de_credito (id_usuario, id_conta, limite, limite_disponivel, limite_ocupado, vencimento)
VALUES
(1, 1, 5000, 5000, 0, '2024-08-01'),
(2, null, 10000, 10000, 0, '2024-09-01');

-- Popula a tabela OBJETIVO
INSERT INTO public.objetivo (id_usuario, nome, prazo_final, data_inicial, valor_acumulado_ate_o_momento, valor_final, fixa_ou_recorrente, recorrencia)
VALUES
(1, 'Comprar um carro', '2025-08-01', '2024-01-01', 0, 50000, true, 1),
(2, 'Viajar para o exterior', '2026-08-01', '2024-01-01', 0, 100000, false, null);