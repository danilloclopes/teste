-- criação de database e marcação do banco para uso
CREATE DATABASE IF NOT EXISTS agendamento_db;
USE agendamento_db;

-- criação de um usuario local para conectar aplicação e banco com privilégios totais
CREATE USER IF NOT EXISTS 'aux-user'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON agendamento_db.* TO 'aux-user'@'localhost';
FLUSH PRIVILEGES;


CREATE TABLE usuario (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	senha VARCHAR(255) NOT NULL
);


CREATE TABLE personagem (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE animador (
	id INT AUTO_INCREMENT PRIMARY KEY,
	usuario_id INT NOT NULL,
	personagem_id INT NOT NULL,

	UNIQUE (usuario_id, personagem_id),
	FOREIGN KEY (usuario_id) REFERENCES usuario(id),
	FOREIGN KEY (personagem_id) REFERENCES personagem(id)
);


CREATE TABLE agendamento (
	id INT AUTO_INCREMENT PRIMARY KEY,
	cliente_id INT NOT NULL,
	animador_id INT NOT NULL,
	data_hora DATETIME NOT NULL,
	status ENUM('PENDENTE', 'CONTRATADO', 'CANCELADO', 'CONCLUIDO') NOT NULL,

	UNIQUE (animador_id, data_hora),
	FOREIGN KEY (cliente_id) REFERENCES usuario(id),
	FOREIGN KEY (animador_id) REFERENCES animador(id)
);


-- inserção de 40 personagens para uso na aplicação
INSERT IGNORE INTO personagem (nome) VALUES
    ('Homem-Aranha'), ('Hulk'), ('Capitão América'),('Batman'),('Superman'),('Mulher-Maravilha'),('Homem de Ferro'),('Thor'),('Flash'),('Pantera Negra'),('Elsa'),('Anna'),('Cinderela'),('Branca de Neve'),('Ariel'),('Rapunzel'),('Bela'),('Jasmine'),('Aurora'),('Moana'),('Mickey Mouse'),('Minnie Mouse'),('Pato Donald'),('Pateta'),('Bob Esponja'),('Patrick Estrela'),('Scooby-Doo'),('Salsicha'),('Pernalonga'),('Piu-Piu'),('Goku'),('Naruto'),('Sailor Moon'),('Ash Ketchum'),('Pikachu'),('Ben 10'),('Ladybug'),('Cat Noir'),('Peppa Pig'),('Titio Avô');


-- inserção de 80 usuarios artificiais para simular clientes pré-existentes no banco
-- NOTA: o hashing de todos é o mesmo pois a senha para acesso dos logins artificiais é '123'
INSERT INTO usuario (nome, email, cpf, senha) VALUES
    ('João Silva','joao.silva@gmail.com','12345678901','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Maria Souza','maria.souza@yahoo.com','23456789012','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Pedro Santos','pedro.santos@hotmail.com','34567890123','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Ana Oliveira','ana.oliveira@gmail.com','45678901234','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Carlos Pereira','carlos.pereira@yahoo.com','56789012345','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Fernanda Costa','fernanda.costa@gmail.com','67890123456','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Lucas Rodrigues','lucas.rodrigues@hotmail.com','78901234567','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Juliana Almeida','juliana.almeida@gmail.com','89012345678','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Rafael Nunes','rafael.nunes@yahoo.com','90123456789','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Camila Barbosa','camila.barbosa@gmail.com','11223344556','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Bruno Ribeiro','bruno.ribeiro@gmail.com','22334455667','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Patrícia Gomes','patricia.gomes@yahoo.com','33445566778','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Gustavo Carvalho','gustavo.carvalho@hotmail.com','44556677889','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Larissa Martins','larissa.martins@gmail.com','55667788990','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Felipe Rocha','felipe.rocha@yahoo.com','66778899001','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Aline Freitas','aline.freitas@gmail.com','77889900112','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Thiago Lopes','thiago.lopes@hotmail.com','88990011223','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Mariana Araújo','mariana.araujo@gmail.com','99001122334','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Daniel Melo','daniel.melo@yahoo.com','10111213141','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Beatriz Castro','beatriz.castro@gmail.com','12131415161','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Eduardo Teixeira','eduardo.teixeira@gmail.com','13141516171','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Renata Pires','renata.pires@yahoo.com','14151617181','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Vinícius Monteiro','vinicius.monteiro@hotmail.com','15161718191','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Paula Moreira','paula.moreira@gmail.com','16171819201','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Leonardo Cardoso','leonardo.cardoso@yahoo.com','17181920212','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Carolina Mendes','carolina.mendes@gmail.com','18192021222','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Rodrigo Ramos','rodrigo.ramos@hotmail.com','19202122232','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Natália Duarte','natalia.duarte@gmail.com','20212223242','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Fábio Batista','fabio.batista@yahoo.com','21222324252','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Isabela Farias','isabela.farias@gmail.com','22232425262','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('André Neves','andre.neves@gmail.com','23242526272','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Vanessa Coelho','vanessa.coelho@yahoo.com','24252627282','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Diego Correia','diego.correia@hotmail.com','25262728292','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Tatiane Dias','tatiane.dias@gmail.com','26272829302','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Marcelo Cunha','marcelo.cunha@yahoo.com','27282930312','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Priscila Peixoto','priscila.peixoto@gmail.com','28293031322','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Ricardo Azevedo','ricardo.azevedo@hotmail.com','29303132332','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Sabrina Queiroz','sabrina.queiroz@gmail.com','30313233342','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Alexandre Moura','alexandre.moura@yahoo.com','31323334352','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Débora Macedo','debora.macedo@gmail.com','32333435362','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Igor Fonseca','igor.fonseca@gmail.com','33343536372','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Simone Borges','simone.borges@yahoo.com','34353637382','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Leandro Tavares','leandro.tavares@hotmail.com','35363738392','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Cristiane Rezende','cristiane.rezende@gmail.com','36373839402','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Otávio Sales','otavio.sales@yahoo.com','37383940412','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Elaine Guimarães','elaine.guimaraes@gmail.com','38394041422','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Paulo Dantas','paulo.dantas@hotmail.com','39404142432','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Kelly Siqueira','kelly.siqueira@gmail.com','40414243442','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Roberto Viana','roberto.viana@yahoo.com','41424344452','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Monique Cavalcante','monique.cavalcante@gmail.com','42434445462','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Caio Portela','caio.portela@gmail.com','43444546472','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Daniele Braga','daniele.braga@yahoo.com','44454647482','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Fernando Antunes','fernando.antunes@hotmail.com','45464748492','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Jéssica Lacerda','jessica.lacerda@gmail.com','46474849502','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Matheus Paiva','matheus.paiva@yahoo.com','47484950512','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Rita Ventura','rita.ventura@gmail.com','48495051522','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Cláudio Xavier','claudio.xavier@hotmail.com','49505152532','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Helena Mota','helena.mota@gmail.com','50515253542','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Sérgio Barros','sergio.barros@yahoo.com','51525354552','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Tatiana Nogueira','tatiana.nogueira@gmail.com','52535455562','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Alan Matos','alan.matos@gmail.com','53545556572','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Flávia Assis','flavia.assis@yahoo.com','54555657582','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Murilo Gusmão','murilo.gusmao@hotmail.com','55565758592','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Denise Valente','denise.valente@gmail.com','56575859602','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Jonas Pacheco','jonas.pacheco@yahoo.com','57585960612','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Bianca Quevedo','bianca.quevedo@gmail.com','58596061622','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Vitor Magalhães','vitor.magalhaes@hotmail.com','59606162632','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Lorena Andrade','lorena.andrade@gmail.com','60616263642','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('César Franco','cesar.franco@yahoo.com','61626364652','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Raquel Medeiros','raquel.medeiros@gmail.com','62636465662','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Bruna Figueiredo','bruna.figueiredo@gmail.com','63646566672','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Guilherme Pimenta','guilherme.pimenta@yahoo.com','64656667682','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Luana Barcellos','luana.barcellos@hotmail.com','65666768692','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Hugo Bastos','hugo.bastos@gmail.com','66676869702','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Cintia Chaves','cintia.chaves@yahoo.com','67686970712','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Douglas Ferraz','douglas.ferraz@hotmail.com','68697071722','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Mayara Torres','mayara.torres@gmail.com','69707172732','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Rogério Campos','rogerio.campos@yahoo.com','70717273742','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Yasmin Silveira','yasmin.silveira@gmail.com','71727374752','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
    ('Adriano Rezende','adriano.rezende@hotmail.com','72737475762','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

-- inserção de 10 animadores com base nos primeiros 10 usuarios para simular animadores na aplicação
INSERT IGNORE INTO animador (usuario_id, personagem_id) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);