CREATE TABLE INVOICE(
InvoiceNumber		Int				NOT NULL IDENTITY(1000, 100),
InvoiceDate			Date			NOT NULL,
SubTotal			Money			NOT NULL,
TaxPct				Decimal(18, 2)	NOT NULL DEFAULT 25,
Total				Money			NOT NULL,
CONSTRAINT			INVOICE_PK		PRIMARY KEY(InvoiceNumber)
);



CREATE TABLE PRODUCT(
ProductNumber		Int				NOT NULL IDENTITY(1, 1),
ProductType			Char(50)		NOT NULL, 
ProductDescription	Text			NULL,
UnitPrice			Money			NOT NULL,
CONSTRAINT			PRODUCT_PK		PRIMARY KEY(ProductNumber)


);


CREATE TABLE LINE_ITEM(
InvoiceNumber		Int				NOT NULL,
LineNumber			Int				NOT NULL IDENTITY(1, 1),
ProductNumber		Int				NOT NULL,
Quantity			Int				NOT NULL,
UnitPrice			Money			NOT NULL,
Total				Money			NOT NULL,
CONSTRAINT			LINE_PK			PRIMARY KEY(InvoiceNumber, LineNumber),
CONSTRAINT			INVOICE_FK		FOREIGN KEY(InvoiceNumber)
						REFERENCES INVOICE(InvoiceNumber)
							ON UPDATE CASCADE,
CONSTRAINT			PRODUCT_FK		FOREIGN KEY(ProductNumber)
						REFERENCES PRODUCT(ProductNumber)
							ON UPDATE CASCADE
							ON DELETE NO ACTION
);	


