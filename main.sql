-- BA with Python
CREATE TABLE Client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40)
);
CREATE TABLE Transactions(
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_amount DECIMAL(15,2),
    transaction_currency VARCHAR(3),
    client_id INT,
    FOREIGN KEY(client_id) REFERENCES client(client_id)
);

-- SQLite not SQL ----------------------------------
.schema Client
.schema Transactions

-- SQL not SQLite----------------------------------
/*
DESC Client; 
DESC Transaction;
*/

-- ----------------------------------
INSERT INTO Client VALUES(1, 'John'); 
INSERT INTO Client VALUES(2, 'Ann'); 
INSERT INTO Client VALUES(3, 'Tom'); 
INSERT INTO Client VALUES(4, 'Kate');
INSERT INTO Transactions VALUES(1000, '2020-01-01', 100.00, 'PLN', 1); 
INSERT INTO Transactions VALUES(1001, '2020-02-01', 200.00, 'USD', 1); 
INSERT INTO Transactions VALUES(1002, '2020-03-01', 300.00, 'EUR', 1); 
INSERT INTO Transactions VALUES(1003, '2020-06-01', 400.00, 'EUR', 1); 
INSERT INTO Transactions VALUES(1004, '2020-07-01', 500.00, 'EUR', 1); 
INSERT INTO Transactions VALUES(1005, '2020-08-01', 600.00, 'USD', 1);
INSERT INTO Transactions VALUES(1006, '2020-09-01', 700.00, 'EUR', 1);
UPDATE Transactions SET transaction_currency ='PLN' WHERE transaction_id = 1006;

INSERT INTO Transactions VALUES(1007, '2020-01-01', 1000.00, 'PLN', 2); 
INSERT INTO Transactions VALUES(1008, '2020-02-01', 2000.00, 'USD', 2); 
INSERT INTO Transactions VALUES(1009, '2020-03-01', 3000.00, 'EUR', 2); 
INSERT INTO Transactions VALUES(1010, '2020-06-01', 4000.00, 'EUR', 2); 
INSERT INTO Transactions VALUES(1011, '2020-07-01', 5000.00, 'EUR', 2); 
INSERT INTO Transactions VALUES(1012, '2020-08-01', 6000.00, 'USD', 2); 
INSERT INTO Transactions VALUES(1013, '2020-09-01', 7000.00, 'USD', 2);

INSERT INTO Transactions VALUES(1014, '2020-01-01', 10.00, 'PLN', 3); 
INSERT INTO Transactions VALUES(1015, '2020-02-01', 20.00, 'USD', 3); 
INSERT INTO Transactions VALUES(1016, '2020-03-01', 30.00, 'EUR', 3); 
INSERT INTO Transactions VALUES(1017, '2020-06-01', 40.00, 'EUR', 3); 
INSERT INTO Transactions VALUES(1018, '2020-07-01', 50.00, 'EUR', 3); 
INSERT INTO Transactions VALUES(1019, '2020-08-01', 60.00, 'USD', 3); 
INSERT INTO Transactions VALUES(1020, '2020-09-01', 70.00, 'EUR', 3);

-- ----------------------------------
SELECT * FROM Client; 
SELECT * FROM Transactions;

-- SQLite not SQL ----------------------------------
.tables

-- ----------------------------------
-- Total amount all txn all curr every client 6 m-ths
SELECT c.client_id, c.client_name, SUM(t.transaction_amount) AS total, t.transaction_currency, COUNT(*) 
FROM Client AS c
LEFT JOIN Transactions AS t
ON c.client_id = t.client_id
WHERE t.transaction_date >= '2020-01-01' 
GROUP BY t.client_id, t.transaction_currency;

/*  ============ omitted ===========

====================================
*/