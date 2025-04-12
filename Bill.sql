CREATE TABLE BILL(
Bill_ID         INT               UNIQUE,
Total           DOUBLE(16,2)      DEFAULT 0.00,
Amount_paid     DOUBLE(16,2)      DEFAULT 0.00,
Date_of_service DATE,
From_facility   INT,
To_patient      INT,
PRIMARY KEY (Bill_ID),
FOREIGN KEY (From_facility) REFERENCES FACILITY (Facility_ID),
FOREIGN KEY (To_patient) REFERENCES PATIENT (Patient_ID)
);

CREATE TABLE INSURED_BILL(
Bill_ID                 INT          UNIQUE,
In_network              INT,
Deductible_status       VARCHAR(10),
Balance_after_insurance DOUBLE(16,2) DEFAULT 0.00,
PRIMARY KEY (Bill_ID),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID),
CHECK (In_network == 0 || In_network == 1)
);

CREATE TABLE MEMBERSHIP_BILL(
Bill_ID           INT       UNIQUE,
Membership_type   VARCHAR(15),
PRIMARY KEY (Bill_ID),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID)
);

CREATE TABLE WELLNESS_PROGRAM_BILL(
Bill_ID               INT            UNIQUE,
Session_length        TIME,
Hourly_rate           DOUBLE(16,2)   DEFAULT 0.00,
Discount_rate         DOUBLE(16,2)   DEFAULT 0.00,
Patient_type          VARCHAR(15),
PRIMARY KEY (Bill_ID),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID)
);

CREATE TABLE CLINICAL_CARE_BILL (
Bill_ID               INT       UNIQUE,
Privider_name         VARCHAR(30),
Care_Type             VARCHAR(30),
PRIMARY KEY (Bill_ID),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID)
);

CREATE TABLE C_CARE_RESOURCES(
Bill_ID           INT          UNIQUE,
Used_resource     VARCHAR(30)  NOT NULL ,
PRIMARY KEY (Bill_ID),
PRIMARY KEY (Used_resource),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID)
);

CREATE TABLE C_CARE_SERVICES(
Bill_ID              INT            UNIQUE,
Provided_service     VARCHAR(30)    NOT NULL,
PRIMARY KEY (Bill_ID),
PRIMARY KEY (Provided_service),
FOREIGN KEY (Bill_ID) REFERENCES BILL (Bill_ID)
);


