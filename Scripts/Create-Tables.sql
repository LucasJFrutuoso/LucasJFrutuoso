USE Escola;
GO

CREATE TABLE Professor (
  id_Prof INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Materia (
  id_Materia INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  Nome_Materia VARCHAR(100) NOT NULL
);

CREATE TABLE Aluno (
  id_Aluno INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  Nome_Aluno VARCHAR(100) NOT NULL
);

CREATE TABLE Sala_De_Aula (
  id_Sala INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
  id_Prof INT  NOT NULL,
  id_Materia INT NOT NULL,
  CONSTRAINT FK_Sala_Prof FOREIGN KEY (id_Prof) REFERENCES Professor(id_Prof),
  CONSTRAINT FK_Sala_Materia FOREIGN KEY (id_Materia) REFERENCES Materia(id_Materia)
);


CREATE TABLE Aluno_Materia (
  id_Aluno INT NOT NULL,
  id_Materia INT NOT NULL,
  Ano_Matricula INT,
  Periodo VARCHAR(100),
  PRIMARY KEY (id_Aluno, id_Materia), -- Chave primária composta
  CONSTRAINT FK_AlunoMateria_Aluno FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno),
  CONSTRAINT FK_AlunoMateria_Materia FOREIGN KEY (id_Materia) REFERENCES Materia(id_Materia)
);

CREATE TABLE Professor_Materia (
  id_Prof INT  NOT NULL,
  id_Materia INT NOT NULL,
  PRIMARY KEY (id_Prof, id_Materia), -- Chave primária composta
  CONSTRAINT FK_ProfMateria_Prof FOREIGN KEY (id_Prof) REFERENCES Professor(id_Prof),
  CONSTRAINT FK_ProfMateria_Materia FOREIGN KEY (id_Materia) REFERENCES Materia(id_Materia)
);

CREATE TABLE Materia_Sala (
  id_Materia INT NOT NULL,
  id_Sala INT NOT NULL,
  PRIMARY KEY (id_Materia, id_Sala), -- Chave primária composta
  CONSTRAINT FK_MateriaSala_Materia FOREIGN KEY (id_Materia) REFERENCES Materia(id_Materia),
  CONSTRAINT FK_MateriaSala_Sala FOREIGN KEY (id_Sala) REFERENCES Sala_De_Aula(id_Sala)
);

