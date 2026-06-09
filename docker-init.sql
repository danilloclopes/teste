-- Tabelas (o banco e usuário já são criados pelas env vars do docker-compose)
CREATE TABLE IF NOT EXISTS usuario (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf   VARCHAR(11)  NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS personagem (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS animador (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id   INT NOT NULL,
    personagem_id INT NOT NULL,
    UNIQUE (usuario_id, personagem_id),
    FOREIGN KEY (usuario_id)    REFERENCES usuario(id),
    FOREIGN KEY (personagem_id) REFERENCES personagem(id)
);

CREATE TABLE IF NOT EXISTS agendamento (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id  INT NOT NULL,
    animador_id INT NOT NULL,
    data_hora   DATETIME NOT NULL,
    status      ENUM('PENDENTE','CONTRATADO','CANCELADO','CONCLUIDO') NOT NULL,
    UNIQUE (animador_id, data_hora),
    FOREIGN KEY (cliente_id)  REFERENCES usuario(id),
    FOREIGN KEY (animador_id) REFERENCES animador(id)
);

-- Personagens
INSERT IGNORE INTO personagem (nome) VALUES
    ('Homem-Aranha'),('Hulk'),('Capitão América'),('Batman'),('Superman'),
    ('Mulher-Maravilha'),('Homem de Ferro'),('Thor'),('Flash'),('Pantera Negra'),
    ('Elsa'),('Anna'),('Cinderela'),('Branca de Neve'),('Ariel'),
    ('Rapunzel'),('Bela'),('Jasmine'),('Aurora'),('Moana'),
    ('Mickey Mouse'),('Minnie Mouse'),('Pato Donald'),('Pateta'),('Bob Esponja'),
    ('Patrick Estrela'),('Scooby-Doo'),('Salsicha'),('Pernalonga'),('Piu-Piu'),
    ('Goku'),('Naruto'),('Sailor Moon'),('Ash Ketchum'),('Pikachu'),
    ('Ben 10'),('Ladybug'),('Cat Noir'),('Peppa Pig'),('Titio Avô');

-- Usuários de teste (senha = '123' em SHA-256)
INSERT IGNORE INTO usuario (nome, email, cpf, senha) VALUES
    ('João Silva',   'joao.silva@gmail.com',   '12345678901', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Maria Souza',  'maria.souza@yahoo.com',  '23456789012', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Pedro Santos', 'pedro.santos@hotmail.com','34567890123', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Ana Oliveira', 'ana.oliveira@gmail.com', '45678901234', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Carlos Pereira','carlos.pereira@yahoo.com','56789012345','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Fernanda Costa','fernanda.costa@gmail.com','67890123456','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Lucas Rodrigues','lucas.rodrigues@hotmail.com','78901234567','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Juliana Almeida','juliana.almeida@gmail.com','89012345678','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Rafael Nunes', 'rafael.nunes@yahoo.com',  '90123456789', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Camila Barbosa','camila.barbosa@gmail.com','11223344556','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

-- Animadores (primeiros 10 usuários)
INSERT IGNORE INTO animador (usuario_id, personagem_id) VALUES
    (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
