--01) CRIE A TABELA ESTOQUES DE ACORDO COM A DEFINIÇÃO ABAIXO:
/*
	IDPRODUTO INTEIRO OBRIGATÓRIO CHAVE PRIMÁRIA E CHAVE ESTRANGEIRA PARA TABELA PRODUTO
	QUANTIDADE INTEIRO OBRIGATÓRIO DEVE SER MAIOR OU IGUAL A 0
	DT_ULTIMA_COMPRA DATA_HORA OBRIGATÓRIO VALOR PADRÃO DATA_HORA_ATUAL
	VALOR_ULTIMA_COMPRA NUMÉRICO ATÉ 9999,99 OBRIGATÓRIO DEVE SER MAIOR QUE 0
*/

USE DISCIPLINA02
GO

CREATE TABLE ESTOQUES(
	IDPRODUTO INT NOT NULL,
	QUANTIDADE TINYINT NOT NULL,
	DT_ULTIMA_COMPRA DATETIME NOT NULL CONSTRAINT DEF_ESTOQUES_DT_ULTIMA_COMPRA DEFAULT GETDATE(),
	VALOR_ULTIMA_COMPRA NUMERIC(6,2) NOT NULL,

	CONSTRAINT PK_ESTOQUES PRIMARY KEY(IDPRODUTO),
	CONSTRAINT CHK_ESTOQUES_VALOR_ULTIMA_COMPRA CHECK(VALOR_ULTIMA_COMPRA > 0),
	CONSTRAINT CHK_ESTOQUES_QUANTIDADE CHECK(QUANTIDADE >= 0),
	CONSTRAINT FK_ESTOQUES_PRODUTOS FOREIGN KEY(IDPRODUTO) 
	REFERENCES PRODUTOS(IDPRODUTO)
	ON UPDATE NO ACTION ON DELETE NO ACTION
);


--02) INSIRA OS DADOS ABAIXO NA TABELA:

/*
(2,20,02/01/2016, 20,20)
(3,30,03/02/2016, 30,30)
(4,40,04/03/2016, 40,40)
(5,50,05/02/2016, 50,50)
(6,60,06/01/2016, 60,60)
(7,10,01/03/2016, 10,10)
*/

INSERT INTO ESTOQUES
(IDPRODUTO, QUANTIDADE, DT_ULTIMA_COMPRA, VALOR_ULTIMA_COMPRA)
VALUES
(2,20,'20160102',20.20),(3,30,'20160103',30.30),(4,40,'20160104',40.40),(5,50,'20160105',50.50),(6,60,'20160106',60.60),(7,10,'20160301',10.10);


--03) 

/*
ALTERE OS REGISTROS DA TABELA ESTOQUES, ADICIONANDO 10 A QUANTIDADE DE CADA PRODUTO 
E ALTERANDO A DT_ULTIMA_COMPRA PARA A DATA_HORA ATUAL, APENAS DOS PRODUTOS CUJO ID ESTEJA ENTRE 3 E 5
*/

UPDATE ESTOQUES
SET QUANTIDADE = QUANTIDADE + 10, DT_ULTIMA_COMPRA = GETDATE()
WHERE IDPRODUTO BETWEEN 3 AND 5;


--04) REMOVA DA TABELA ESTOQUES OS REGISTROS CUJO VALOR_ULTIMA_COMPRA SEJA MAIOR QUE 60

DELETE FROM ESTOQUES
WHERE VALOR_ULTIMA_COMPRA > 60;

--05) LISTE A MÉDIA DE VALOR_ULTIMA_COMPRA E A MAIOR QUANTIDADE DA TABELA ESTOQUES

SELECT AVG(VALOR_ULTIMA_COMPRA) AS MEDIA, MAX(QUANTIDADE) AS MAIOR
FROM ESTOQUES;