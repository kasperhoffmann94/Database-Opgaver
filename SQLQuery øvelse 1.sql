CREATE TABLE PET_OWNER(
OwnerID			Int				NOT NULL IDENTITY (1, 1),
OwnerFirstName		Char(25)		NOT NULL,
OwnerLastName		Char(25)		NOT NULL,
OwnerPhone			Char(12)		NULL,
OwnerEmail			VarChar(100)	NOT NULL UNIQUE,
CONSTRAINT			OWNER_PK		PRIMARY KEY(OwnerID)
);



CREATE TABLE PET(
PetId				Int				NOT NULL IDENTITY (1, 1),
PetName				Char(25)		NOT NULL,
PetType				Char(25)		NOT NULL,
PetBreed			Char(50)		NOT NULL,
PetDOB				Date			NULL,
PetWeight			Decimal(18, 1)	NOT NULL,
OwnerId				Int				NOT NULL,
CONSTRAINT			PET_PK			PRIMARY KEY(PetId),
CONSTRAINT			OWNER_FK		FOREIGN KEY(OwnerId)
						REFERENCES PET_OWNER(OwnerID)
							ON DELETE NO ACTION
);


