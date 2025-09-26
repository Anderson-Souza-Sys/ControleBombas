/******************************************************************************/
/*                                 Generators                                 */
/******************************************************************************/

CREATE GENERATOR ID_BOMBA START WITH 0 INCREMENT BY 1;
SET GENERATOR ID_BOMBA TO 0;

CREATE GENERATOR ID_TANQUE START WITH 0 INCREMENT BY 1;
SET GENERATOR ID_TANQUE TO 0;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE BOMBAS (
    ID_BOMBA       INTEGER NOT NULL,
    ID_TANQUE      INTEGER NOT NULL,
    APELIDO_BOMBA  VARCHAR(30) NOT NULL
);

CREATE TABLE LANCAMENTO_ABASTECIMENTO (
    ID_BOMBA          INTEGER NOT NULL,
    LITROS_ABASTECER  DOUBLE PRECISION NOT NULL,
    VALOR_COBRADO     DOUBLE PRECISION NOT NULL,
    IMPOSTO_PERC      DOUBLE PRECISION NOT NULL,
    DATA_HORA         TIMESTAMP NOT NULL
);

CREATE TABLE LANCAMENTO_RECARGA (
    ID_TANQUE       INTEGER NOT NULL,
    LITROS_RECARGA  DOUBLE PRECISION NOT NULL,
    DATA_HORA       TIMESTAMP NOT NULL
);

CREATE TABLE TANQUES (
    ID_TANQUE          INTEGER NOT NULL,
    TIPO_COMBUSTIVEL   VARCHAR(1) NOT NULL,
    LITROS             DOUBLE PRECISION NOT NULL,
    APELIDO_TANQUE     VARCHAR(30) NOT NULL,
    VALOR_COMBUSTIVEL  DOUBLE PRECISION NOT NULL
);



/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE BOMBAS ADD CONSTRAINT PK_BOMBAS PRIMARY KEY (ID_BOMBA);
ALTER TABLE TANQUES ADD CONSTRAINT PK_TANQUES PRIMARY KEY (ID_TANQUE);


/******************************************************************************/
/*                                Foreign keys                                */
/******************************************************************************/

ALTER TABLE BOMBAS ADD CONSTRAINT FK_BOMBAS_1 FOREIGN KEY (ID_TANQUE) REFERENCES TANQUES (ID_TANQUE);
ALTER TABLE LANCAMENTO_ABASTECIMENTO ADD CONSTRAINT FK_LANCAMENTO_ABASTECIMENTO_1 FOREIGN KEY (ID_BOMBA) REFERENCES BOMBAS (ID_BOMBA);
ALTER TABLE LANCAMENTO_RECARGA ADD CONSTRAINT FK_LANCAMENTO_RECARGA_1 FOREIGN KEY (ID_TANQUE) REFERENCES TANQUES (ID_TANQUE);


/******************************************************************************/
/*                                  Indices                                   */
/******************************************************************************/

CREATE UNIQUE INDEX BOMBAS_IDX1 ON BOMBAS (APELIDO_BOMBA);
CREATE UNIQUE INDEX TANQUES_IDX1 ON TANQUES (APELIDO_TANQUE);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: AI_LANCAMENTO_ABASTECIMENTO */
CREATE TRIGGER AI_LANCAMENTO_ABASTECIMENTO FOR LANCAMENTO_ABASTECIMENTO
ACTIVE AFTER INSERT POSITION 0
AS
DECLARE VARIABLE V_ID_TANQUE INTEGER;
BEGIN

  SELECT ID_TANQUE
  FROM BOMBAS
  WHERE ID_BOMBA = NEW.ID_BOMBA
  INTO :V_ID_TANQUE;

  UPDATE TANQUES
  SET LITROS = LITROS - NEW.LITROS_ABASTECER
  WHERE ID_TANQUE = :V_ID_TANQUE;
END^

/* Trigger: AI_LANCAMENTO_RECARGA */
CREATE TRIGGER AI_LANCAMENTO_RECARGA FOR LANCAMENTO_RECARGA
ACTIVE AFTER INSERT POSITION 0
AS
BEGIN
  UPDATE TANQUES
  SET LITROS = LITROS + NEW.LITROS_RECARGA
  WHERE ID_TANQUE = NEW.ID_TANQUE;
END^

/* Trigger: BI_LANCAMENTO_ABASTECIMENTO */
CREATE TRIGGER BI_LANCAMENTO_ABASTECIMENTO FOR LANCAMENTO_ABASTECIMENTO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.DATA_HORA IS NULL) THEN
    NEW.DATA_HORA = CURRENT_TIMESTAMP;
END^

/* Trigger: BI_LANCAMENTO_RECARGA */
CREATE TRIGGER BI_LANCAMENTO_RECARGA FOR LANCAMENTO_RECARGA
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.DATA_HORA IS NULL) THEN
    NEW.DATA_HORA = CURRENT_TIMESTAMP;
END^

SET TERM ; ^

