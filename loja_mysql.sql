USE loja;

-- Pergunta 1: produtos com preco acima de 100
SELECT nome, preco
FROM produto
WHERE preco > 100
ORDER BY preco DESC;

-- Pergunta 2: clientes com nome iniciando em A ou da cidade Sao Paulo
SELECT nome, cidade
FROM cliente
WHERE nome LIKE 'A%' OR cidade = 'Sao Paulo';

-- Pergunta 3: produtos com preco entre 50 e 200
SELECT nome, preco
FROM produto
WHERE preco BETWEEN 50 AND 200
ORDER BY preco;

-- Pergunta 4: cidades dos clientes, sem repetir
SELECT DISTINCT cidade
FROM cliente;

-- Pergunta 5: os 3 produtos mais caros
SELECT nome, preco
FROM produto
ORDER BY preco DESC
LIMIT 3;

-- Pergunta 6: quantos clientes existem
SELECT COUNT(*) AS total_clientes
FROM cliente;

-- Pergunta 7: total em estoque e preco medio
SELECT SUM(estoque) AS total_em_estoque,
       ROUND(AVG(preco), 2) AS preco_medio
FROM produto;

-- Pergunta 8: quantos clientes por cidade
SELECT cidade, COUNT(*) AS total_clientes
FROM cliente
GROUP BY cidade
ORDER BY total_clientes DESC, cidade;

-- Pergunta 9: cidades com 2 ou mais clientes
SELECT cidade, COUNT(*) AS total_clientes
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- Pergunta 10: quem fez cada pedido (JOIN)
SELECT pedido.id, cliente.nome, pedido.data_pedido
FROM pedido
JOIN cliente ON pedido.id_cliente = cliente.id
ORDER BY pedido.id;