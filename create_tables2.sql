CREATE TABLE Location (
    LocationID          Int             NOT NULL IDENTITY(1,1),     
    Address             Char(50)        NOT NULL,
    City                Char(25)        NOT NULL,
    State               Char(2)         NOT NULL,
    Zip                 Char(10)        NOT NULL,
    PhoneNumber         Numeric(10)     NOT NULL,
    Email               Char(50)        NOT NULL,
    CONSTRAINT          LocationPK      PRIMARY KEY(LocationID)

    );
    
    CREATE TABLE Department (
	DepartmentID 		Int 			NOT NULL IDENTITY(500,1),
	PhoneNumber 		Char(10) 	    NOT NULL,
	Email 				Char(30)		NOT NULL,
	Name 				Char(35) 		NOT NULL,
	LocationID  		Int          	NOT NULL,
	CONSTRAINT 		  DepartmentPK	   PRIMARY KEY(DepartmentID),
	CONSTRAINT 		  LocationIDFK		FOREIGN KEY(LocationID)
                                    REFERENCES Location(LocationID)
                                    ON UPDATE NO ACTION
                                    ON DELETE NO ACTION
	);
    
    CREATE TABLE Employee (
	EmployeeID 			Int 			    NOT NULL IDENTITY(1,1),
	FirstName			Char(25)	       	NOT NULL,
	LastName			Char(25)	      	NOT NULL, 
	Address     		Char(50)	    	NOT NULL,
	Zip         		Char(10)	      	NOT NULL, 
	City                Char(25)	        NOT NULL,
    State               Char(2)             NOT NULL,
    PhoneNumber         Char(10)            NOT NULL,
    Sex                 Char(1)             NOT NULL,
    DepartmentID        Int                 NOT NULL,
	CONSTRAINT 			EmployeePK     		PRIMARY KEY(EmployeeID),
	CONSTRAINT 			FLnameAK1	       	UNIQUE(LastName, FirstName),	
	CONSTRAINT 			DepartmentFK        FOREIGN KEY(DepartmentID)
                                        REFERENCES Department(DepartmentID)
 							            ON UPDATE NO ACTION
								        ON DELETE NO ACTION
	);
    
     CREATE TABLE Customer (
	CustomerID 			Int 			NOT NULL IDENTITY(1000,1),
	FirstName 			Char(25) 		NOT NULL,
	LastName 			Char(25) 		NOT NULL,
    RewardsNum          Char(50)        NOT NULL,
	Address 			Char(50) 		NOT NULL,
	City 				Char(25) 		NOT NULL,
	State   			Char(2) 		NOT NULL,
	Zip          		Char(5)			NOT NULL, 
	PhoneNumber			Char(10)		NOT NULL,
	Email    			Char(50)		NOT NULL,
	DateofBirth			Date		  	NOT NULL,
    LocationID          Int             NOT NULL,
 	CONSTRAINT 			CustomerPK		PRIMARY KEY(CustomerID),
    CONSTRAINT          LocationFK      FOREIGN KEY (LocationID)
                                    REFERENCES Location (LocationID)
                                    ON UPDATE NO ACTION
                                    ON DELETE NO ACTION
	);
    
    CREATE TABLE Pets (
	PetID	         	Int 			NOT NULL IDENTITY(100,1),
	Name        		Char(30)		NOT NULL, 
	BreedType          	Char(35)       	NOT NULL,
	Sex     			Char(1)	        NOT NULL,
	Allergies			Char(50)		NULL,
	Weight             Numeric(6,2)	    NOT NULL, 
    Vaccinations        Char(40)        NOT NULL,
    CurrentIllness      Char(50)        NULL,
    DateofBirth         Datetime         NULL,
	CustomerID			Int 			NOT NULL,
	LocationID			Int 			NOT NULL,
	CONSTRAINT 			PetPK			PRIMARY KEY(PetID),
	CONSTRAINT 			PCustomerFK		FOREIGN KEY(CustomerID)
								    REFERENCES Customer(CustomerID)
 							        ON UPDATE NO ACTION
								    ON DELETE NO ACTION
	);
    
    CREATE TABLE Visit (
    VID                 Int             NOT NULL IDENTITY(1,1),
    Date                DateTime        NOT NULL,
    Reason              Char(50)        NOT NULL,
    PetID               Int             NOT NULL,
    InsurProvider       Char(50)        NULL,
    CONSTRAINT         VIDPK           Primary Key(VID),
    CONSTRAINT          PetIDVFK       FOREIGN Key (PetID)
                                    REFERENCES Pets (PetID)
                                    ON UPDATE NO ACTION
                                    ON DELETE NO ACTION
    );
    
    
    CREATE TABLE Services (
	ServiceID 			Int 			NOT NULL IDENTITY(1,1),
    ServiceType 	    Char(50)	    NOT NULL,
    PetID               Int             NOT NULL,
 	CONSTRAINT 			ServicesPK		PRIMARY KEY(ServiceID),
	CONSTRAINT 			PetFK	        FOREIGN KEY(PetID)
								        REFERENCES Pets(PetID)
								        ON UPDATE NO ACTION
								        ON DELETE NO ACTION
	);