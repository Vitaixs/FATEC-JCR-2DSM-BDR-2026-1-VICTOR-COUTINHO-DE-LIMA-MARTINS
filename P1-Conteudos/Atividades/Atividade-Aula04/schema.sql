CREATE TABLE Usuario (
idUsuario SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
senhaHash VARCHAR (14) NOT NULL
);

INSERT INTO Usuario (nome, email, senhaHash)
VALUES ('Maria Oliveira', 'maria.oliveira@email.com', '4f76b09d0a7b9e');


CREATE TABLE Localizacao (
idLocalizacao SERIAL PRIMARY KEY,
latitude VARCHAR (50),
longitude VARCHAR (50),
cidade VARCHAR (100),
estado VARCHAR (2)
);

INSERT INTO Localizacao (latitude, longitude, cidade, estado)
VALUES ('-23.305', '-45.965', 'Jacarei', 'SP');

CREATE TABLE TipoEvento (
idTipoEvento SERIAL PRIMARY KEY,
nome VARCHAR(50),
descricao VARCHAR(300)
);

INSERT INTO TipoEvento (nome, descricao)
VALUES ('Queimada', 'Incêndio de grandes proporções em áreas urbanas ou rurais.');

CREATE TABLE Evento (
idEvento SERIAL PRIMARY KEY,
titulo VARCHAR (50),
descricao VARCHAR (300),
dataHora TIMESTAMP,
status VARCHAR (20), 
idTipoEvento INT REFERENCES TipoEvento(idTipoEvento),
idLocalizacao INT REFERENCES Localizacao(idLocalizacao)
);

INSERT INTO Evento (titulo, descricao, dataHora, status, idTipoEvento, idLocalizacao )
VALUES
('Queimada em área de preservação', 'Fogo se alastrando na mata próxima à represa', '2025-08-15 14:35:00', 'Ativo', 1, 1);



CREATE TABLE Relato (
idRelato SERIAL PRIMARY KEY,
texto VARCHAR (300),
dataHora TIMESTAMP,
idEvento INT REFERENCES Evento(idEvento),
idUsuario INT REFERENCES Usuario(idUsuario)
);

INSERT INTO Relato (texto, dataHora, idEvento, idUsuario)
VALUES ('Fumaça intensa e chamas visíveis a partir da rodovia.','2025-08-16 10:35:00', 1, 1);


CREATE TABLE Alerta (
idAlerta SERIAL PRIMARY KEY,
mensagem VARCHAR (300),
dataHora TIMESTAMP,
nivel VARCHAR (20), 
idEvento INT REFERENCES Evento(idEvento)
);

INSERT INTO Alerta (mensagem, dataHora, nivel, idEvento)
VALUES ('Evacuação imediata da área próxima à represa.','2025-08-15 15:20:00', 'Crítico', 1);

CREATE TABLE HistoricoEvento (
idHistorico SERIAL PRIMARY KEY,
statusAnterior VARCHAR (20),
statusNovo VARCHAR (20),
dataHora TIMESTAMP,
idEvento INT REFERENCES Evento(idEvento)
);

INSERT INTO HistoricoEvento (statusAnterior, statusNovo, dataHora, idEvento)
VALUES ('Ativo', 'Resolvido', '2025-08-15 15:30:00', 1);

