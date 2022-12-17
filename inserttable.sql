CREATE TABLE Product(prodid CHAR(10), pname VARCHAR(30), price DECIMAL);

INSERT INTO Product VALUES ('p1', 'tape', 2.5);
INSERT INTO Product VALUES ('p2', 'tv', 250);
INSERT INTO Product VALUES ('p3', 'vcr', 80);

CREATE TABLE Depot (depid CHAR(10), addr VARCHAR(30), volume DECIMAL);

INSERT INTO Depot VALUES ('d1', 'New York', 9000);
INSERT INTO Depot VALUES ('d2', 'Syracuse', 6000);
INSERT INTO Depot VALUES ('d4', 'New York', 2000);

CREATE TABLE Stock (prodid CHAR(10), depid VARCHAR(30), quantity DECIMAL);

INSERT INTO Stock VALUES ('p1', 'd1', 1000);
INSERT INTO Stock VALUES ('p1', 'd2', -100);
INSERT INTO Stock VALUES ('p1', 'd4', 1200);
INSERT INTO Stock VALUES ('p3', 'd1', 3000);
INSERT INTO Stock VALUES ('p3', 'd4', 2000);
INSERT INTO Stock VALUES ('p2', 'd4', 1500);
INSERT INTO Stock VALUES ('p2', 'd1', -400);
INSERT INTO Stock VALUES ('p2', 'd2', 2000);


ALTER TABLE Product ADD CONSTRAINT pk_product PRIMARY KEY (prodid);
ALTER TABLE PRODUCT ADD CONSTRAINT ck_product_price CHECK (price>0);

ALTER TABLE Depot ADD CONSTRAINT pk_depot PRIMARY KEY (depid);
ALTER TABLE DEPOT ADD CONSTRAINT ck_product_volume CHECK (volume>0);


ALTER TABLE Stock ADD CONSTRAINT fk_stock_prodid FOREIGN KEY (prodid) REFERENCES Product(prodid) ON DELETE CASCADE;