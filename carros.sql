CREATE DATABASE CARROS;

USE CARROS;

CREATE TABLE CARRO (
    CarroID INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Preco DECIMAL(10, 2)
);

CREATE TABLE VENDA (
    VendaID INT PRIMARY KEY,
    CarroID INT,
    DataVenda DATE,
    ValorVenda DECIMAL(10, 2)
);

CREATE TRIGGER registrar_data_venda
AFTER INSERT ON VENDA
FOR EACH ROW
BEGIN
    UPDATE VENDA
    SET DataVenda = NOW()
    WHERE VendaID = NEW.VendaID;
END;

INSERT INTO CARRO (CarroID, Marca, Modelo, Ano, Preco)
VALUES (1, 'Toyota', 'Corolla', 2022, 25000.00);

INSERT INTO VENDA (VendaID, CarroID, ValorVenda)
VALUES (1, 1, 20000.00);
