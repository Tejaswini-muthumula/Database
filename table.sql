CREATE TABLE MANUFACT(MANID INT NOT NULL,MANNAME VARCHAR2(50) NOT NULL,OPERATEON DATE NOT NULL,CONSTRAINT MANUFACT_PK PRIMARY KEY(MANID)); 
CREATE TABLE MODEL(MDLID INT NOT NULL,MDLNAME VARCHAR2(50) NOT NULL, CONSTRAINT MODEL_PK PRIMARY KEY(MDLID));
CREATE TABLE CAR(SERIALNO VARCHAR2(50) NOT NULL,MANID INT NOT NULL,MDLID INT NOT NULL, PYEAR DATE NOT NULL, FOREIGN KEY (MANID) REFERENCES MANUFACT(MANID) ,FOREIGN KEY (MDLID) REFERENCES MODEL(MDLID), CONSTRAINT CAR_PK PRIMARY KEY(SERIALNO));
CREATE TABLE DEALER(DLRID INT NOT NULL,DLRNAME VARCHAR2(50) NOT NULL,STARTDT DATE NOT NULL,DLRSTATUS VARCHAR2(50) NOT NULL,CONSTRAINT DEALER_PK PRIMARY KEY(DLRID));
CREATE TABLE DELIVERY(DELVERYID INT NOT NULL,MANID INT NOT NULL,DLRID INT NOT NULL, SERIALNO VARCHAR2(50) NOT NULL,DELVERYDT DATE NOT NULL,FOREIGN KEY (MANID) REFERENCES MANUFACT(MANID),FOREIGN KEY (DLRID) REFERENCES DEALER(DLRID),FOREIGN KEY (SERIALNO) REFERENCES CAR(SERIALNO),CONSTRAINT DELIVERY_PK PRIMARY KEY(DELVERYID));
CREATE TABLE PERSON(SSNID INT NOT NULL,PERNAME VARCHAR2(50) NOT NULL,DOB DATE NOT NULL,CONSTRAINT PERSON_PK PRIMARY KEY(SSNID));
CREATE TABLE CAR_OWNERSHIP(ID INT NOT NULL, SERIALNO VARCHAR2(50) NOT NULL, DLRID INT, SSNID INT,TDATE DATE NOT NULL,REGNO VARCHAR2(50) NOT NULL, RDATE DATE NOT NULL, OWNERSHIPSTATUS VARCHAR2(50) NOT NULL, FOREIGN KEY (SSNID) REFERENCES PERSON(SSNID),FOREIGN KEY (SERIALNO) REFERENCES CAR(SERIALNO),FOREIGN KEY (DLRID) REFERENCES DEALER(DLRID),CONSTRAINT CAR_OWNERSHIP_PK PRIMARY KEY(ID));
CREATE TABLE CAR_TRASFERING(ID INT NOT NULL,SERIALNO VARCHAR2(50) NOT NULL,SSNIDFROM INT,SSNIDTO INT,TDATE DATE NOT NULL,REGNO VARCHAR2(50) NOT NULL,RDATE DATE NOT NULL,TRASFERSTATUS VARCHAR2(50) NOT NULL,FOREIGN KEY (SSNIDFROM) REFERENCES PERSON(SSNID),FOREIGN KEY (SSNIDTO) REFERENCES PERSON(SSNID),FOREIGN KEY (SERIALNO) REFERENCES CAR(SERIALNO),CONSTRAINT CAR_TRASFERING_PK PRIMARY KEY(ID));
CREATE TABLE DESTRUCTION(DESTRUCTIONID INT NOT NULL,DESTRUCTIONTYPE VARCHAR2(50) NOT NULL,DDATE DATE NOT NULL,SERIALNO VARCHAR2(50) NOT NULL,FOREIGN KEY (SERIALNO) REFERENCES CAR(SERIALNO),CONSTRAINT DESTRUCTION_PK PRIMARY KEY(DESTRUCTIONID));



INSERT INTO MANUFACT (MANID, MANNAME, OPERATEON) VALUES (1, 'Ford', TO_DATE('15/08/1945', 'DD/MM/YYYY'));
INSERT INTO MANUFACT (MANID, MANNAME, OPERATEON) VALUES (2, 'General Motors', TO_DATE('15/08/1945', 'DD/MM/YYYY'));
INSERT INTO MANUFACT (MANID, MANNAME, OPERATEON) VALUES (3, 'Chrysler', TO_DATE('15/08/1945', 'DD/MM/YYYY'));
INSERT INTO MANUFACT (MANID, MANNAME, OPERATEON) VALUES (4, 'Jowlett', TO_DATE('15/08/1945', 'DD/MM/YYYY'));


INSERT INTO MODEL (MDLID, MDLNAME) VALUES (1, 'Mustang');
INSERT INTO MODEL (MDLID, MDLNAME) VALUES (2, 'Explorer');
INSERT INTO MODEL (MDLID, MDLNAME) VALUES (3, 'Prism'); 
INSERT INTO MODEL (MDLID, MDLNAME) VALUES (4, 'Cavalier');
INSERT INTO MODEL (MDLID, MDLNAME) VALUES (5, 'Malibu');
INSERT INTO MODEL (MDLID, MDLNAME) VALUES (6, 'Occam');



INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('EXP123', 1, 2, TO_DATE('25/12/1995', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('PRM456', 2, 3, TO_DATE('25/12/1991', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('OCC101', 4, 6, TO_DATE('25/12/1997', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('OCC102', 4, 6, TO_DATE('25/12/1997', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('OCC103', 4, 6, TO_DATE('25/12/1991', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('MUS003', 1, 1, TO_DATE('25/12/1991', 'DD/MM/YYYY')); 
INSERT INTO CAR (SERIALNO, MANID, MDLID,PYEAR) VALUES ('MUS001', 1, 1, TO_DATE('14/02/1998', 'DD/MM/YYYY')); 




INSERT INTO DEALER (DLRID, DLRNAME, STARTDT,DLRSTATUS) VALUES (1, 'Drum Hill Ford', TO_DATE('25/12/1991', 'DD/MM/YYYY'),'ACTIVE');
INSERT INTO DEALER (DLRID, DLRNAME, STARTDT,DLRSTATUS) VALUES (2, 'Jones Brothers Ltd', TO_DATE('25/12/1991', 'DD/MM/YYYY'),'ACTIVE');
INSERT INTO DEALER (DLRID, DLRNAME, STARTDT,DLRSTATUS) VALUES (3, 'Acton Ford', TO_DATE('25/12/1991', 'DD/MM/YYYY'),'ACTIVE');


INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (1, 1, 1,'EXP123', TO_DATE('05/12/1995', 'DD/MM/YYYY'));
INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (2, 2, 2,'PRM456', TO_DATE('01/12/1992', 'DD/MM/YYYY'));
INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (3, 4, 2,'OCC101', TO_DATE('22/11/1997', 'DD/MM/YYYY'));
INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (4, 4, 2,'OCC102', TO_DATE('22/11/1997', 'DD/MM/YYYY'));
INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (5, 4, 2,'OCC103', TO_DATE('22/11/1997', 'DD/MM/YYYY'));
INSERT INTO DELIVERY (DELVERYID, MANID, DLRID, SERIALNO, DELVERYDT) VALUES (6, 1, 1,'MUS003', TO_DATE('20/02/1999', 'DD/MM/YYYY'));



INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (101, 'Mr. Johnson', TO_DATE('25/12/1965', 'DD/MM/YYYY'));
INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (102, 'Mrs. Baker', TO_DATE('25/12/1971', 'DD/MM/YYYY'));
INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (103, 'Mr. Brown', TO_DATE('25/12/1968', 'DD/MM/YYYY'));
INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (104, 'Mrs. Roberts', TO_DATE('25/12/1970', 'DD/MM/YYYY'));
INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (105, 'Mr. Willis', TO_DATE('25/12/1972', 'DD/MM/YYYY')); 
INSERT INTO PERSON (SSNID, PERNAME, DOB) VALUES (106, 'Mrs. Xena', TO_DATE('25/12/1969', 'DD/MM/YYYY'));



INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (1, 'EXP123', 1, '101',TO_DATE('05/02/1996', 'DD/MM/YYYY'),'43A95C',TO_DATE('05/02/1996','DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (2, 'PRM456', 2, '101',TO_DATE('26/05/1993','DD/MM/YYYY'),'37E77P',TO_DATE('26/05/1993', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (3, 'PRM456', 1, '101',TO_DATE('14/02/1998','DD/MM/YYYY'),'37E77P',TO_DATE('26/05/1993', 'DD/MM/YYYY'),'Ownedbydealer');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (4, 'MUS001', 1, '101',TO_DATE('14/02/1998','DD/MM/YYYY'),'21M93G',TO_DATE('14/02/1998', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (5, 'OCC101', 2, '103',TO_DATE('12/01/1998','DD/MM/YYYY'),'17A01C',TO_DATE('12/01/1998', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (6, 'OCC102', 2, '104',TO_DATE('12/01/1998','DD/MM/YYYY'),'17A02C',TO_DATE('12/01/1998', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (7, 'OCC103', 2, '105',TO_DATE('12/01/1998','DD/MM/YYYY'),'17A03C',TO_DATE('12/01/1998', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (8, 'OCC102', 3, '104',TO_DATE('20/01/1999','DD/MM/YYYY'),'28B02C',TO_DATE('20/01/1999', 'DD/MM/YYYY'),'Ownedbydealer');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (9, 'OCC103', 3, '105',TO_DATE('20/01/1999','DD/MM/YYYY'),'28B03C',TO_DATE('20/01/1999', 'DD/MM/YYYY'),'Ownedbydealer');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (10, 'OCC102', 3, '106',TO_DATE('26/01/1999','DD/MM/YYYY'),'39C02C',TO_DATE('26/01/1999', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (11, 'OCC103', 3, '106',TO_DATE('26/01/1999','DD/MM/YYYY'),'39C03C',TO_DATE('26/01/1999', 'DD/MM/YYYY'),'Ownedbyperson');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (12, 'OCC102', 1, '106',TO_DATE('15/03/1999','DD/MM/YYYY'),'39C02C',TO_DATE('26/01/1999', 'DD/MM/YYYY'),'Ownedbydealer');
INSERT INTO CAR_OWNERSHIP (ID, SERIALNO, DLRID, SSNID,TDATE,REGNO,RDATE,OWNERSHIPSTATUS) VALUES (13, 'MUS003', 1, '106',TO_DATE('15/03/1999','DD/MM/YYYY'),'39C07D',TO_DATE('15/03/1999', 'DD/MM/YYYY'),'Ownedbyperson');





INSERT INTO CAR_TRASFERING (ID, SERIALNO, SSNIDFROM, SSNIDTO,TDATE,REGNO,RDATE,TRASFERSTATUS) VALUES (1, 'EXP123', '101','102',TO_DATE('20/05/1998','DD/MM/YYYY'),'55A98D',TO_DATE('20/05/1998','DD/MM/YYYY'),'Ownedbyperson');



INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (1, 'Accident', TO_DATE('13/06/1998','DD/MM/YYYY'),'EXP123');
INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (2, 'Accident', TO_DATE('12/01/1998','DD/MM/YYYY'),'OCC101');
INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (3, 'Dismantling',TO_DATE('03/10/1999','DD/MM/YYYY'),'OCC102');
INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (4, 'Accident', TO_DATE('07/04/2001','DD/MM/YYYY'),'OCC103');
INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (5, 'Accident', TO_DATE('07/04/2001','DD/MM/YYYY'),'MUS003');
INSERT INTO DESTRUCTION (DESTRUCTIONID, DESTRUCTIONTYPE, DDATE,SERIALNO) VALUES (6, 'Notdistructed', TO_DATE('16/12/2021','DD/MM/YYYY'),'PRM456');