-- Tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    status ENUM('ativo', 'inativo', 'cancelado') NOT NULL DEFAULT 'ativo',
    motivo_cancelamento TEXT,
    INDEX idx_email (email)
);

-- Tabela viagens
CREATE TABLE viagens (
    id_viagem INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    destino VARCHAR(100) NOT NULL,
    data_partida DATE NOT NULL,
    data_retorno DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    status ENUM('realizada', 'cancelada', 'reservada') NOT NULL DEFAULT 'reservada',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT,
    INDEX idx_id_cliente (id_cliente),
    CHECK (data_retorno >= data_partida),
    CHECK (preco >= 0)
);

-- Tabela pagamentos
CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_viagem INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_viagem) REFERENCES viagens(id_viagem) ON DELETE RESTRICT,
    INDEX idx_id_viagem (id_viagem),
    CHECK (valor >= 0)
);

-- Tabela interacoes
CREATE TABLE interacoes (
    id_interacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_interacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo ENUM('reclamacao', 'elogio', 'duvida', 'outro') NOT NULL,
    descricao TEXT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT,
    INDEX idx_id_cliente (id_cliente)
);

-- Tabela cancelamentos
CREATE TABLE cancelamentos (
    id_cancelamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_cancelamento DATE NOT NULL,
    motivo TEXT NOT NULL,
    via_cancelamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE RESTRICT,
    INDEX idx_id_cliente (id_cliente)
);

INSERT INTO clientes 
(nome, email, telefone, data_cadastro, status, motivo_cancelamento) VALUES
('Ana Clara Silva', 'ana.silva@gmail.com', '(11) 91234-5678', '2024-01-15', 'ativo', NULL),
('Bruno Almeida Santos', 'bruno.almeida@outlook.com', '(21) 99876-5432', '2024-02-20', 'ativo', NULL),
('Carla Beatriz Costa', 'carla.costa@yahoo.com', '(31) 98765-4321', '2024-03-10', 'inativo', 'Mudança de planos pessoais'),
('Diego Ferreira Lima', 'diego.lima@gmail.com', '(41) 97654-3210', '2024-04-05', 'ativo', NULL),
('Elisa Souza Mendes', 'elisa.mendes@hotmail.com', '(51) 96543-2109', '2024-05-12', 'cancelado', 'Insatisfação com o serviço'),
('Fábio Henrique Oliveira', 'fabio.oliveira@protonmail.com', '(61) 95432-1098', '2024-06-18', 'ativo', NULL),
('Gabriela Torres Lima', 'gabriela.torres@gmail.com', '(71) 94321-0987', '2024-07-25', 'ativo', NULL),
('Henrique Castro Silva', 'henrique.silva@icloud.com', '(81) 93210-9876', '2024-08-30', 'inativo', 'Problemas financeiros'),
('Isabela Cristina Rocha', 'isabela.rocha@yahoo.com', '(91) 92109-8765', '2024-09-14', 'ativo', NULL),
('João Pedro Almeida', 'joao.almeida@gmail.com', '(11) 91098-7654', '2024-10-22', 'ativo', NULL),
('Karina Lopes Ferreira', 'karina.ferreira@outlook.com', '(21) 90987-6543', '2024-11-05', 'cancelado', 'Mudança para outro país'),
('Lucas Gabriel Santos', 'lucas.santos@gmail.com', '(31) 99876-5432', '2024-12-12', 'ativo', NULL),
('Mariana Costa Oliveira', 'mariana.oliveira@hotmail.com', '(41) 98765-4321', '2025-01-20', 'ativo', NULL),
('Natália Ribeiro Lima', 'natalia.lima@yahoo.com', '(51) 97654-3210', '2025-02-28', 'inativo', 'Falta de tempo'),
('Otávio Mendes Castro', 'otavio.castro@gmail.com', '(61) 96543-2109', '2025-03-15', 'ativo', NULL),
('Patrícia Almeida Souza', 'patricia.souza@protonmail.com', '(71) 95432-1098', '2025-04-10', 'ativo', NULL),
('Rafael Torres Silva', 'rafael.silva@icloud.com', '(81) 94321-0987', '2025-05-05', 'cancelado', 'Serviço não atendeu expectativas'),
('Sofia Ferreira Costa', 'sofia.costa@gmail.com', '(91) 93210-9876', '2025-06-12', 'ativo', NULL),
('Thiago Lima Oliveira', 'thiago.oliveira@yahoo.com', '(11) 92109-8765', '2025-06-20', 'ativo', NULL),
('Valentina Rocha Santos', 'valentina.santos@outlook.com', '(21) 91098-7654', '2025-07-01', 'ativo', NULL),
('Wagner Almeida Mendes', 'wagner.mendes@gmail.com', '(31) 90987-6543', '2024-01-30', 'inativo', 'Mudança de prioridade'),
('Xavier Costa Ribeiro', 'xavier.ribeiro@hotmail.com', '(41) 99876-5432', '2024-02-15', 'ativo', NULL),
('Yasmin Torres Lima', 'yasmin.lima@yahoo.com', '(51) 98765-4321', '2024-03-22', 'ativo', NULL),
('Zoe Ferreira Silva', 'zoe.silva@gmail.com', '(61) 97654-3210', '2024-04-28', 'cancelado', 'Problemas com atendimento'),
('André Santos Oliveira', 'andre.oliveira@protonmail.com', '(71) 96543-2109', '2024-05-10', 'ativo', NULL);


INSERT INTO viagens 
(id_cliente, destino, data_partida, data_retorno, preco, status) VALUES
(1, 'Paris, França', '2024-06-15', '2024-06-22', 4500.00, 'realizada'),
(1, 'Rio de Janeiro, RJ', '2024-12-10', '2024-12-15', 1200.00, 'reservada'),
(2, 'Nova York, EUA', '2024-07-20', '2024-07-28', 5200.00, 'realizada'),
(3, 'Salvador, BA', '2024-08-05', '2024-08-10', 900.00, 'cancelada'),
(4, 'Tokyo, Japão', '2024-09-15', '2024-09-25', 6800.00, 'realizada'),
(5, 'Fortaleza, CE', '2024-10-01', '2024-10-07', 1100.00, 'cancelada'),
(6, 'Londres, Reino Unido', '2024-11-10', '2024-11-18', 4800.00, 'reservada'),
(7, 'Gramado, RS', '2024-12-20', '2024-12-27', 1500.00, 'reservada'),
(8, 'Cancún, México', '2025-01-15', '2025-01-22', 3500.00, 'realizada'),
(9, 'Buenos Aires, Argentina', '2025-02-10', '2025-02-15', 2000.00, 'reservada'),
(10, 'Maceió, AL', '2025-03-05', '2025-03-12', 1300.00, 'realizada'),
(11, 'Roma, Itália', '2025-04-01', '2025-04-10', 5000.00, 'cancelada'),
(12, 'Porto de Galinhas, PE', '2025-05-15', '2025-05-20', 1400.00, 'reservada'),
(13, 'Dubai, Emirados Árabes', '2025-06-10', '2025-06-18', 6000.00, 'realizada'),
(14, 'Recife, PE', '2025-07-01', '2025-07-07', 1100.00, 'reservada'),
(15, 'Barcelona, Espanha', '2024-06-20', '2024-06-28', 4700.00, 'realizada'),
(16, 'Florianópolis, SC', '2024-07-15', '2024-07-20', 1200.00, 'realizada'),
(17, 'Miami, EUA', '2024-08-10', '2024-08-17', 4000.00, 'cancelada'),
(18, 'Natal, RN', '2024-09-05', '2024-09-12', 1000.00, 'reservada'),
(19, 'Sydney, Austrália', '2024-10-15', '2024-10-25', 7000.00, 'realizada'),
(20, 'Porto Seguro, BA', '2024-11-01', '2024-11-07', 1300.00, 'reservada'),
(21, 'Lisboa, Portugal', '2024-12-15', '2024-12-22', 4500.00, 'realizada'),
(22, 'Curitiba, PR', '2025-01-10', '2025-01-15', 900.00, 'reservada'),
(23, 'Bangkok, Tailândia', '2025-02-20', '2025-02-28', 5500.00, 'realizada'),
(24, 'João Pessoa, PB', '2025-03-15', '2025-03-20', 1100.00, 'reservada'),
(25, 'Amsterdam, Países Baixos', '2025-04-10', '2025-04-18', 4800.00, 'realizada'),
(4, 'Orlando, EUA', '2025-05-01', '2025-05-10', 5200.00, 'reservada'),
(7, 'Foz do Iguaçu, PR', '2025-06-15', '2025-06-20', 1400.00, 'realizada'),
(10, 'Santiago, Chile', '2025-07-01', '2025-07-07', 2500.00, 'reservada'),
(13, 'Belo Horizonte, MG', '2024-06-10', '2024-06-15', 800.00, 'realizada');


INSERT INTO pagamentos
 (id_viagem, data_pagamento, valor, metodo_pagamento) VALUES
(1, '2024-05-10', 4500.00, 'Cartão de Crédito'),
(2, '2024-11-01', 1200.00, 'Pix'),
(3, '2024-06-15', 5200.00, 'Cartão de Crédito'),
(4, '2024-07-01', 900.00, 'Boleto'),
(5, '2024-08-10', 6800.00, 'Cartão de Crédito'),
(6, '2024-09-01', 1100.00, 'Pix'),
(7, '2024-10-05', 4800.00, 'Cartão de Crédito'),
(8, '2024-11-10', 1500.00, 'Boleto'),
(9, '2024-12-15', 3500.00, 'Cartão de Crédito'),
(10, '2025-01-05', 2000.00, 'Pix'),
(11, '2025-02-01', 1300.00, 'Cartão de Crédito'),
(12, '2025-03-01', 5000.00, 'Boleto'),
(13, '2025-04-01', 1400.00, 'Pix'),
(14, '2025-05-05', 6000.00, 'Cartão de Crédito'),
(15, '2024-05-15', 4700.00, 'Cartão de Crédito'),
(16, '2024-06-10', 1200.00, 'Pix'),
(17, '2024-07-05', 4000.00, 'Boleto'),
(18, '2024-08-01', 1000.00, 'Cartão de Crédito'),
(19, '2024-09-10', 7000.00, 'Cartão de Crédito'),
(20, '2024-10-01', 1300.00, 'Pix'),
(21, '2024-11-05', 4500.00, 'Cartão de Crédito'),
(22, '2024-12-01', 900.00, 'Boleto'),
(23, '2025-01-15', 5500.00, 'Cartão de Crédito'),
(24, '2025-02-10', 1100.00, 'Pix'),
(25, '2025-03-05', 4800.00, 'Cartão de Crédito');


INSERT INTO interacoes 
(id_cliente, data_interacao, tipo, descricao) VALUES
(1, '2024-06-01 10:30:00', 'elogio', 'Atendimento excelente na compra da viagem para Paris.'),
(2, '2024-07-10 14:00:00', 'duvida', 'Pergunta sobre seguro viagem para Nova York.'),
(3, '2024-08-15 09:00:00', 'reclamacao', 'Cancelamento da viagem para Salvador sem reembolso claro.'),
(4, '2024-09-20 16:45:00', 'elogio', 'Organização impecável na viagem para Tóquio.'),
(5, '2024-10-10 11:00:00', 'reclamacao', 'Problemas com a comunicação sobre cancelamento.'),
(6, '2024-11-01 13:20:00', 'duvida', 'Consulta sobre datas disponíveis para Londres.'),
(7, '2024-12-05 15:30:00', 'elogio', 'Ótima experiência na reserva para Gramado.'),
(8, '2025-01-10 10:00:00', 'outro', 'Sugestão de novos destinos no México.'),
(9, '2025-02-15 12:00:00', 'duvida', 'Pergunta sobre documentação para Buenos Aires.'),
(10, '2025-03-20 14:30:00', 'elogio', 'Muito satisfeito com a viagem para Maceió.'),
(11, '2025-04-05 09:15:00', 'reclamacao', 'Atraso na confirmação de cancelamento para Roma.'),
(12, '2025-05-10 11:45:00', 'duvida', 'Consulta sobre pacotes para Porto de Galinhas.'),
(13, '2025-06-01 16:00:00', 'elogio', 'Viagem para Dubai foi incrível, ótimo suporte.'),
(14, '2025-07-05 10:30:00', 'outro', 'Feedback sobre melhoria no aplicativo.'),
(15, '2024-06-10 13:00:00', 'duvida', 'Pergunta sobre hospedagem em Barcelona.'),
(16, '2024-07-20 15:00:00', 'elogio', 'Atendimento rápido e eficiente.'),
(17, '2024-08-15 09:30:00', 'reclamacao', 'Problemas com reembolso da viagem para Miami.'),
(18, '2024-09-10 12:00:00', 'duvida', 'Consulta sobre passeios em Natal.'),
(19, '2024-10-20 14:00:00', 'elogio', 'Viagem para Sydney superou expectativas.'),
(20, '2024-11-05 11:00:00', 'outro', 'Sugestão de pacotes promocionais.');


INSERT INTO cancelamentos 
(id_cliente, data_cancelamento, motivo, via_cancelamento) VALUES
(3, '2024-08-10', 'Mudança de planos pessoais', 'site'),
(5, '2024-10-07', 'Insatisfação com o serviço', 'telefone'),
(8, '2024-09-01', 'Problemas financeiros', 'app'),
(11, '2025-04-10', 'Serviço não atendeu expectativas', 'site'),
(17, '2024-08-17', 'Problemas com atendimento', 'telefone');

