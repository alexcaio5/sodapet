/* 
* Instruções para a criação da base de dados "sodapet", com as tabelas para a administração dos dados.
*/

CREATE DATABASE sodapet;

USE sodapet;

/* 
* Criação da tabela "dadosConta", na qual contém o campo "emailConta" como chave primária.
*/

CREATE TABLE dadosConta (
	
    emailConta varchar(50) PRIMARY KEY NOT NULL,
    tipoConta enum('ONG','USUARIO') NOT NULL,
    statusConta enum('OK', 'BLOQUEADO') NOT NULL,
    senhaConta char(32) NOT NULL,
    dataCriacaoConta datetime NOT NULL,
    ultimaAtualizacaoConta datetime NOT NULL,
    ipOrigemCriacaoConta char(16) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/* 
* Criação da tabela "dadosContaOng", na qual contém o campo "emailConta" como chave estrangeira.
*/

CREATE TABLE dadosContaOng (

    emailConta varchar(50) NOT NULL,
    FOREIGN KEY (emailConta) REFERENCES dadosConta(emailConta) ON DELETE cascade ON UPDATE cascade,
    cnpj char(14) PRIMARY KEY NOT NULL,
    razaoSocial varchar(100) NOT NULL,
    nomeFantasia varchar(100) NOT NULL,
    descricao varchar(1024),
    logotipo longblob,
    especialidade enum('CAO','GATO','AMBOS') NOT NULL,
    endereco varchar(100) NOT NULL, 
    enderecoNumero char(8) NOT NULL, 
    enderecoComplemento varchar(50), 
    cep char(8) NOT NULL, 
    bairro varchar(50) NOT NULL, 
    cidade varchar(50) NOT NULL, 
    estado char(2) NOT NULL, 
    telefoneComercial char(14) NOT NULL, 
    telefoneMovel char(14),
    idFacebook varchar(100), 
    idTwitter varchar(100),
    website varchar(100),
    urlPerfilOng varchar(250) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/* 
* Criação da tabela "dadosContaUsuario", na qual contém o campo "emailConta" como chave estrangeira.
*/

CREATE TABLE dadosContaUsuario (

    emailConta varchar(50) NOT NULL,
    FOREIGN KEY (emailConta) REFERENCES dadosConta(emailConta) ON DELETE cascade ON UPDATE cascade,
    cpf char(11) PRIMARY KEY NOT NULL,
    nomeCompleto varchar(50) NOT NULL,
    dataNascimento Date NOT NULL,
    sexo enum('M','F') NOT NULL,
    estadoCivil enum ('CASADO','SOLTEIRO','DIVORCIADO','VIUVO') NOT NULL,
    Moradia enum('CASA','APARTAMENTO') NOT NULL,
    preferenciaRaca enum('CAO','GATO','AMBOS') NOT NULL,
    jaAdotouAnimal enum('S','N') NOT NULL,
    endereco varchar(100) NOT NULL, 
    enderecoNumero char(8) NOT NULL, 
    enderecoComplemento varchar(50), 
    cep char(8) NOT NULL, 
    bairro varchar(50) NOT NULL, 
    cidade varchar(50) NOT NULL, 
    estado char(2) NOT NULL, 
    telefoneResidencial char(14) NOT NULL, 
    telefoneMovel char(14),
    idFacebook varchar(100), 
    idTwitter varchar(100)

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/*
* Criação da tabela "dadosAnimais", na qual contém o campo "emailconta" como chave estrangeira e um "idAnimal" como primária.
*/

CREATE TABLE dadosAnimais (

    emailConta varchar(50) NOT NULL,
    FOREIGN KEY (emailConta) REFERENCES dadosConta(emailConta) ON DELETE cascade ON UPDATE cascade,
    idAnimal integer PRIMARY KEY AUTO_INCREMENT,
    tipoAnimal enum('CAO','GATO') NOT NULL,
    statusAnimal enum('DISPONIVEL', 'INDISPONIVEL', 'BLOQUEADO') NOT NULL,
    dataCriacaoAnimal datetime NOT NULL,
    ultimaAtualizacaoAnimal datetime NOT NULL,
    ipOrigemCriacaoAnimal char(16) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/*
* Criação da tabela "dadosAnimaisCao", na qual contém o campo "idAnimal" como chave estrangeira.
*/

CREATE TABLE dadosAnimaisCao (

    idAnimal integer PRIMARY KEY NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES dadosAnimais(idAnimal) ON DELETE cascade ON UPDATE cascade,
    nomeAnimal varchar(50) NOT NULL,
    racaAnimal varchar(50) NOT NULL,
    sexoAnimal enum('M','F') NOT NULL,
    idadeAnimal varchar(2) NOT NULL,
    porteAnimal enum('P', 'M', 'G') NOT NULL,
    pesoAnimal varchar(2) NOT NULL,
    deficienteAnimal enum('S','N') NOT NULL,
    deficienciaAnimal varchar(50),
    vacinadoAnimal enum('S','N') NOT NULL,
    castradoAnimal enum('S','N') NOT NULL,
    descricaoAnimal varchar(1024),
    imagemAnimal1 longblob,
    imagemAnimal2 longblob,
    imagemAnimal3 longblob,
    imagemAnimal4 longblob,
    imagemAnimal5 longblob,
    imagemAnimal6 longblob,
    videoAnimal1 longtext,
    videoAnimal2 longtext,
    urlPerfilAnimal varchar(250) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/*
* Criação da tabela "dadosAnimaisGato", na qual contém o campo "idAnimal" como chave estrangeira.
*/

CREATE TABLE dadosAnimaisGato (

    idAnimal integer PRIMARY KEY NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES dadosAnimais(idAnimal) ON DELETE cascade ON UPDATE cascade,
    nomeAnimal varchar(50) NOT NULL,
    racaAnimal varchar(50) NOT NULL,
    sexoAnimal enum('M','F') NOT NULL,
    idadeAnimal varchar(2) NOT NULL,
    porteAnimal enum('P', 'M', 'G') NOT NULL,
    pesoAnimal varchar(2) NOT NULL,
    deficienteAnimal enum('S','N') NOT NULL,
    deficienciaAnimal varchar(50),
    vacinadoAnimal enum('S','N') NOT NULL,
    castradoAnimal enum('S','N') NOT NULL,
    descricaoAnimal varchar(1024),
    imagemAnimal1 longblob,
    imagemAnimal2 longblob,
    imagemAnimal3 longblob,
    imagemAnimal4 longblob,
    imagemAnimal5 longblob,
    imagemAnimal6 longblob,
    videoAnimal1 longtext,
    videoAnimal2 longtext,
    urlPerfilAnimal varchar(250) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/*
* Criação da tabela "dadosAdocao", na qual contém o campo "idAnimal, emailContaOng e emailContaUsuario" como chave estrangeira e "idTicket" como chave primária.
*/

CREATE TABLE dadosAdocao (

    idTicket integer PRIMARY KEY NOT NULL,
    idAnimal integer NOT NULL,
    FOREIGN KEY (idAnimal) REFERENCES dadosAnimais(idAnimal) ON DELETE cascade ON UPDATE cascade,
    emailContaOng varchar(50) NOT NULL,
    FOREIGN KEY (emailContaOng) REFERENCES dadosContaOng(emailConta) ON DELETE cascade ON UPDATE cascade,
    emailContaUsuario varchar(50) NOT NULL,
    FOREIGN KEY (emailContaUsuario) REFERENCES dadosContaUsuario(emailConta) ON DELETE cascade ON UPDATE cascade,
    statusTicket enum('PENDENTE','APROVADO','CANCELADO','ANALISE') NOT NULL,
    dataCriacaoTicket datetime NOT NULL,
    MotivoOng varchar(500),
    MotivoUsuario varchar(500),
    ultimaAtualizacaoTicket datetime NOT NULL,
    ipOrigemCriacaoTicket char(16) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;

/*
* Criação da tabela "dadosAbuse", na qual contém o campo "idTicket" como chave primária
*/

CREATE TABLE dadosAbuse (

   idTicket integer PRIMARY KEY NOT NULL,
   idEmail varchar(50) NOT NULL,
   tipoAbuse enum('ONG','USUARIO') NOT NULL,
   statusTicket enum('PENDENTE','ANALISE','CONCLUIDO','CANCELADO') NOT NULL,
   descricaoAbuse varchar(1024) NOT NULL,
   descricaoAdminSodapet varchar(1024),
   dataCriacaoTicket datetime NOT NULL,
   ultimaAtualizacaoTicket datetime NOT NULL,
   ipOrigemCriacaoTicket char(16) NOT NULL

) CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = InnoDB;
