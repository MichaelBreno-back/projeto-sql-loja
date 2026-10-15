-- ============================================================
-- Projeto: Banco de dados de uma loja (MySQL 8)
-- Este script cria o banco, as 4 tabelas e insere os dados.
-- ============================================================

CREATE DATABASE IF NOT EXISTS loja;
USE loja;

-- Tabelas -----------------------------------------------------
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE,
    cidade VARCHAR(50),
    telefone VARCHAR(20)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE item_pedido (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- Dados -------------------------------------------------------
INSERT INTO cliente (nome, email, cidade, telefone) VALUES
    ('Ana Souza',   'ana@email.com',   'Maua',        '11 99999-0000'),
    ('Bruno Lima',  'bruno@email.com', 'Santo Andre', NULL),
    ('Carla Dias',  'carla@email.com', 'Maua',        NULL),
    ('Diego Rocha', 'diego@email.com', 'Sao Paulo',   NULL),
    ('Elisa Nunes', 'elisa@email.com', 'Santo Andre', NULL);

INSERT INTO produto (nome, preco, estoque) VALUES
    ('Mouse',      54.90, 100),
    ('Teclado',   129.90,  50),
    ('Monitor',   899.00,  20),
    ('Headset',   199.90,  35),
    ('Webcam',    249.90,  15),
    ('Cabo HDMI',  29.90, 200);

INSERT INTO pedido (id_cliente, data_pedido) VALUES
    (1, '2026-09-01'),
    (2, '2026-09-03'),
    (1, '2026-09-10'),
    (3, '2026-09-12'),
    (4, '2026-09-15'),
    (1, '2026-09-20'),
    (3, '2026-09-25');

INSERT INTO item_pedido (id_pedido, id_produto, quantidade) VALUES
    (1, 1, 2), (1, 2, 1),
    (2, 3, 1),
    (3, 4, 1), (3, 6, 3),
    (4, 1, 1), (4, 5, 1),
    (5, 3, 2),
    (6, 2, 1),
    (7, 6, 5), (7, 1, 2);
