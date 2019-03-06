CREATE TABLE NPO_ADMIN (
	userID		VARCHAR(20) PRIMARY KEY,
	password	VARCHAR(20) NOT NULL
);

SHOW ERRORS;


CREATE TABLE DIGITALFORM (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	time_stamp 	timestamp,
	formImage 	VARBINARY(MAX),
	imageWidth	INTEGER CHECK (imageWidth > 0),
	imageLength INTEGER CHECK (imageLength > 0)
);

SHOW ERRORS;


CREATE TABLE FIELD (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	label		VARCHAR(30) NOT NULL,
	type 		VARCHAR(20) NOT NULL,
	x1			INTEGER CHECK (x1 > 0),
	x2			INTEGER CHECK (x2 > 0),
	y1			INTEGER CHECK (y1 > 0),
	y2			INTEGER CHECK (y2 > 0),
	FOREIGN KEY (fieldID) REFERENCES DIGITALFORM (fieldID),
	FOREIGN KEY (formID) REFERENCES DIGITALFORM (formID)
); 

SHOW ERRORS;

CREATE TABLE CONTAINS (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	FOREIGN KEY (formID) REFERENCES DIGITALFORM (fieldID),
	FOREIGN KEY (fieldID) REFERENCES FIELD (fieldID)
);

SHOW ERRORS;

CREATE TABLE FIELD_CONTENT (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	submissionID VARCHAR(30) PRIMARY KEY,
	content 	VARCHAR(50),
	FOREIGN KEY (formID) REFERENCES DIGITALFORM (formID),
	FOREIGN KEY (fieldID) REFERENCES FIELD (fieldID)
);

SHOW ERRORS;

CREATE TABLE HOLDS (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	submissionID VARCHAR(30) PRIMARY KEY,
	FOREIGN KEY (formID) REFERENCES DIGITALFORM (formID),
	FOREIGN KEY (submissionID) REFERENCES FIELD_CONTENT (submissionID)
);

SHOW ERRORS;

CREATE TABLE NPO_CUSTOMER (
	email		VARCHAR(40) PRIMARY KEY,
	phoneNumber	VARCHAR(15)
);

SHOW ERRORS;

CREATE TABLE SUBMITS (
	formID		VARCHAR(30) PRIMARY KEY,
	fieldID		VARCHAR(30) PRIMARY KEY,
	email		VARCHAR(40) PRIMARY KEY,
	FOREIGN KEY (formID) REFERENCES DIGITALFORM (formID),
	FOREIGN KEY (fieldID) REFERENCES DIGITALFORM (fieldID),
	FOREIGN KEY (email) REFERENCES NPO_CUSTOMER (email)
);

SHOW ERRORS;