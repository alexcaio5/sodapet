# SóDáPet - Sistema Online de divulgação para adoção PET

## Sobre

Trata-se de um projeto TCC da turma de Bacharelado Sistemas de Informação UNIBAN/2012

## Requisitos

- Apache2 (Servidor web)
- php5
- php5-mysql (PDO :: Php Data Objects)
- mysql-server-5.5 (Servidor de banco de dados)

## Logs

- Logs de acesso (/var/log Apache2)
- Logs da aplicação (/sodapet.model/sodapet.logs/..)

## Configuração

* Configuração do banco de dados MYSQL ou POSTGRESQL (/sodapet.model/sodapet.config/..)
* Instruções de criação de base/tabelas no MYSQL (/sodapet.model/sodapet.config/SQLCreate.sql)
* URLs base:
	* Caminho base de dados(/sodapet.model/sodapet.ado/SConnection.class.php)
	* Caminho de logs(/sodapet.model/sodapet.ado/SLogger.class.php)
	* Caminho de logs(/sodapet.model/sodapet.ado/SLoggerTXT.class.php)
