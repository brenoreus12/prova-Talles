-- GERENCIAMENTO DE LOJA

-- CRIAÇÃO

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    data_nascimento DATE
);

CREATE TABLE Endereco (
    endereco_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    rua VARCHAR(150) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    descricao VARCHAR(255),
    UNIQUE(nome),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id)
);

CREATE TABLE Categoria (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE ItemPedido (
    item_pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Estoque (
    produto_id INT PRIMARY KEY,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Funcionario (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    departamento_id INT,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    salario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(departamento_id)
);

CREATE TABLE Departamento (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT UNIQUE,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

CREATE TABLE AvaliacaoProduto (
    avaliacao_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    produto_id INT,
    avaliacao INT NOT NULL CHECK (avaliacao BETWEEN 1 AND 5),
    comentario VARCHAR(255),
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- INSERÇÃO

INSERT INTO Cliente (nome, email, telefone, data_nascimento)
VALUES
('Antonio', 'antonio123@mopa.com', '87123456789', '2003-05-10');

INSERT INTO Endereco (cliente_id, rua, cidade, estado, cep)
VALUES 
(1, 'Rua A, 123', 'São Paulo', 'SP', '12345-678'),
(2, 'Rua B, 456', 'Rio de Janeiro', 'RJ', '87654-321');

INSERT INTO Categoria (nome)
VALUES ('Eletrônicos'), ('Eletrodomésticos'), ('Móveis');

INSERT INTO Fornecedor (nome, telefone, email)
VALUES 
('Fornecedor A', '1123456789', 'contato@fornecedora.com'),
('Fornecedor B', '1134567890', 'contato@fornecedorb.com');

INSERT INTO Produto (nome, preco, categoria_id, fornecedor_id, descricao)
VALUES 
('Televisão', 1200.00, 1, 1, 'TV 42 polegadas LED'),
('Geladeira', 2000.00, 2, 2, 'Geladeira duplex frost free');

INSERT INTO Departamento (nome)
VALUES ('Vendas'), ('Logística');

INSERT INTO Funcionario (nome, departamento_id, email, telefone, salario)
VALUES 
('Carlos Alberto', 1, 'carlos.alberto@loja.com', '11997777777', 3000.00),
('Ana Beatriz', 2, 'ana.beatriz@loja.com', '11996666666', 3200.00);

INSERT INTO Pedido (cliente_id, data_pedido, status, total)
VALUES 
(1, '2024-10-01', 'Em Processamento', 3200.00);

INSERT INTO ItemPedido (pedido_id, produto_id, quantidade, preco)
VALUES 
(1, 1, 1, 1200.00),
(1, 2, 1, 2000.00);

INSERT INTO Estoque (produto_id, quantidade)
VALUES 
(1, 50),
(2, 20);

INSERT INTO Pagamento (pedido_id, forma_pagamento, valor, data_pagamento)
VALUES 
(1, 'Cartão de Crédito', 3200.00, '2024-10-02');

INSERT INTO AvaliacaoProduto (cliente_id, produto_id, avaliacao, comentario, data_avaliacao)
VALUES 
(1, 1, 5, 'Ótima qualidade!', '2024-10-02');

-- LISTAGEM

SELECT * FROM Cliente;

SELECT p.nome AS produto, f.nome AS fornecedor
FROM Produto p
JOIN Fornecedor f ON p.fornecedor_id = f.fornecedor_id;

SELECT * FROM Pedido WHERE cliente_id = 1;

SELECT p.nome, e.quantidade
FROM Produto p
JOIN Estoque e ON p.produto_id = e.produto_id;

SELECT f.nome, d.nome AS departamento
FROM Funcionario f
JOIN Departamento d ON f.departamento_id = d.departamento_id;

SELECT total FROM Pedido WHERE pedido_id = 1;

SELECT * FROM AvaliacaoProduto WHERE produto_id = 1;

SELECT status, COUNT(*) AS quantidade
FROM Pedido
GROUP BY status;

SELECT p.nome, e.quantidade
FROM Produto p
JOIN Estoque e ON p.produto_id = e.produto_id
WHERE e.quantidade > 10;

UPDATE Cliente
SET telefone = '87995615138'
WHERE cliente_id = 1;

DELETE FROM Pedido
WHERE status = 'Cancelado';

SELECT DISTINCT c.nome
FROM Cliente c
JOIN Pedido p ON c.cliente_id = p.cliente_id
WHERE p.total > 2000.00;

SELECT * FROM Produto WHERE preco > 1500.00;

SELECT c.nome, COUNT(p.produto_id) AS quantidade
FROM Categoria c
LEFT JOIN Produto p ON c.categoria_id = p.categoria_id
GROUP BY c.nome;

SELECT c.nome, pg.valor
FROM Cliente c
JOIN Pedido p ON c.cliente_id = p.cliente_id
JOIN Pagamento pg ON p.pedido_id = pg.pedido_id;

SELECT f.nome AS fornecedor, p.nome AS produto
FROM Fornecedor f
JOIN Produto p ON f.fornecedor_id = p.fornecedor_id;

UPDATE Funcionario
SET salario = salario * 1.10
WHERE funcionario_id = 1;

SELECT * FROM Pedido
ORDER BY data_pedido DESC;

SELECT d.nome, COUNT(f.funcionario_id) AS quantidade
FROM Departamento d
LEFT JOIN Funcionario f ON d.departamento_id = f.departamento_id
GROUP BY d.nome;

SELECT p.pedido_id, i.produto_id, i.quantidade, i.preco
FROM Pedido p
JOIN ItemPedido i ON p.pedido_id = i.pedido_id;

SELECT p.nome
FROM Produto p
JOIN AvaliacaoProduto a ON p.produto_id = a.produto_id
WHERE a.avaliacao = 5;

SELECT * FROM Pagamento
WHERE data_pagamento BETWEEN '2024-10-01' AND '2024-10-10';

SELECT * FROM Cliente c
WHERE NOT EXISTS (SELECT 1 FROM Pedido p WHERE p.cliente_id = c.cliente_id);

SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM Produto p
JOIN ItemPedido i ON p.produto_id = i.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC;

SELECT DISTINCT c.nome
FROM Categoria c
JOIN Produto p ON c.categoria_id = p.categoria_id;
