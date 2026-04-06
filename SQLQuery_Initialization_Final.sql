--------------------------------------------------------------------------------------
CREATE TABLE NormalCarpark(
ID CHAR(6),
free_parking_period VARCHAR(100)   ,
night_parking INT CHECK (night_parking IN (0,1)),

PRIMARY KEY (ID)
);

INSERT INTO NormalCarpark( ID, free_parking_period, night_parking)
VALUES
('HDB001', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB002', 'Sunday & Public Holiday, 7:00am–10:30pm', 0),
('HDB003', 'Public Holiday only, 7:00am–10:30pm', 1),
('HDB004', 'Sunday only, 7:00am–10:30pm', 1),
('HDB005', 'No free parking', 0),
('HDB006', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB007', 'Sunday only, 7:00am–10:30pm', 0),
('HDB008', 'Public Holiday only, 7:00am–10:30pm', 1),
('HDB009', 'No free parking', 0),
('HDB010', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB011', 'Sunday only, 7:00am–10:30pm', 1),
('HDB012', 'Public Holiday only, 7:00am–10:30pm', 0),
('HDB013', 'No free parking', 0),
('HDB014', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB015', 'Sunday only, 7:00am–10:30pm', 0),
('HDB016', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB017', 'Public Holiday only, 7:00am–10:30pm', 0),
('HDB018', 'No free parking', 0),
('HDB019', 'Sunday & Public Holiday, 7:00am–10:30pm', 1),
('HDB020', 'Sunday only, 7:00am–10:30pm', 0);
--------------------------------------------------------------------------------------
CREATE TABLE MSCP(
ID CHAR(6),
clearance_height FLOAT,
number_of_decks INT,

PRIMARY KEY (ID),

FOREIGN KEY (ID) REFERENCES NormalCarpark(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO MSCP(ID, clearance_height, number_of_decks)
VALUES
('HDB001', 2.2, 6),
('HDB005', 2.2, 8),
('HDB006', 2.4, 10),
('HDB007', 2.1, 5),
('HDB008', 2.3, 9),
('HDB009', 2.0, 3),
('HDB011', 2.1, 4),
('HDB014', 2.2, 7),
('HDB018', 2.4, 11),
('HDB019', 2.2, 8);
--------------------------------------------------------------------------------------
CREATE TABLE ParkingLots(
ID CHAR(6),
color VARCHAR(20),
number_of_lots INT,

PRIMARY KEY(ID,color),

FOREIGN KEY(ID) REFERENCES NormalCarpark(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ParkingLots(ID,color ,number_of_lots)
VALUES
('HDB001', 'Red', 80),
('HDB001', 'Yellow', 40),
('HDB001', 'White', 10),
('HDB002', 'Red', 60),
('HDB002', 'White', 20),
('HDB003', 'Red', 35),
('HDB004', 'Red', 70),
('HDB004', 'Yellow', 10),
('HDB005', 'Red', 50),
('HDB005', 'White', 15),
('HDB006', 'Red', 75),
('HDB006', 'White', 25),
('HDB006', 'Bi-color', 8),
('HDB007', 'Red', 55),
('HDB007', 'White', 20),
('HDB008', 'Red', 90),
('HDB009', 'Red', 40),
('HDB009', 'Yellow', 5),
('HDB010', 'Red', 13),
('HDB010', 'White', 12),
('HDB011', 'Red', 65),
('HDB012', 'Red', 70),
('HDB013', 'Red', 60),
('HDB014', 'Red', 80),
('HDB015', 'Red', 75),
('HDB016', 'Red', 90),
('HDB017', 'Red', 85),
('HDB018', 'Red', 95),
('HDB019', 'Red', 60),
('HDB020', 'Red', 55);
--------------------------------------------------------------------------------------
CREATE TABLE BlockAddress(
postal_code INT,
hdb_block_number VARCHAR(10) ,
street_name VARCHAR(30),
carpark_id CHAR(6),

PRIMARY KEY (postal_code),

FOREIGN KEY (carpark_id) REFERENCES NormalCarpark(ID) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO BlockAddress( postal_code, hdb_block_number, street_name, carpark_id)
VALUES
(560123, '123', 'Ang Mo Kio Ave 3', 'HDB001'), 
(560124, '124', 'Ang Mo Kio Ave 3', 'HDB002'), 
(310125, '25A', 'Toa Payoh Lor 2', 'HDB003'), 
(310126, '26B', 'Toa Payoh Lor 6', 'HDB004'), 
(460101, '101', 'Bedok North St 2', 'HDB005'), 
(460102, '102', 'Bedok North St 3', 'HDB006'), 
(520341, '341', 'Tampines St 33', 'HDB007'), 
(520342, '342', 'Tampines St 34', 'HDB008'), 
(640601, '601', 'Jurong West St 62', 'HDB009'), 
(640602, '602', 'Jurong West St 61', 'HDB010'), 
(650231, '231', 'Bukit Batok East Ave 5', 'HDB011'),
(650232, '232', 'Bukit Batok St 21', 'HDB012'), 
(730401, '401', 'Woodlands Ave 3', 'HDB013'), 
(730402, '402', 'Woodlands St 41', 'HDB014'), 
(820201, '201', 'Hougang St 21', 'HDB015'), 
(820202, '202', 'Hougang Ave 8', 'HDB016'), 
(600501, '501', 'Jurong West St 52', 'HDB017'), 
(600502, '502', 'Jurong West Ave 1', 'HDB018'), 
(680301, '301', 'Choa Chu Kang Ave 4', 'HDB019'), 
(680302, '302', 'Choa Chu Kang Loop', 'HDB020'),
(640603, '603', 'Jurong West St 61', 'HDB010'), 
(640604, '604', 'Jurong West St 61', 'HDB010'), 
(640605, '605', 'Jurong West St 61', 'HDB010'), 
(640606, '606', 'Jurong West St 61', 'HDB010'), 
(640607, '607', 'Jurong West St 61', 'HDB010'), 
(640608, '608', 'Jurong West St 62', 'HDB010'), 
(640609, '609', 'Jurong West St 61', 'HDB010'), 
(640610, '610', 'Jurong West St 62', 'HDB010'), 
(640611, '611', 'Jurong West St 61', 'HDB010'); 
--------------------------------------------------------------------------------------
CREATE TABLE ResidentUnit(
postal_code INT, 
unit_number VARCHAR(10), 

PRIMARY KEY (postal_code, unit_number),

FOREIGN KEY (postal_code) REFERENCES BlockAddress(postal_code) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ResidentUnit(postal_code, unit_number)
VALUES
(560123, '#01-101'),
(560124, '#02-102'),
(310125, '#03-103'),
(310126, '#04-201'),
(460101, '#05-202'),
(460102, '#11-111'),
(520341, '#07-302'),
(520342, '#08-303'),
(640601, '#09-304'),
(640602, '#10-401'),
(650231, '#11-402'),
(650232, '#12-403'),
(730401, '#13-404'),
(730402, '#20-701'),
(820201, '#16-503'),
(820202, '#18-601'),
(600501, '#14-511'),
(600502, '#10-481'),
(680301, '#06-301'),
(680302, '#07-512'),
(640604,'#03-312'),
(640604,'#04-234'),
(640605,'#09-293'),
(640607,'#01-181'),
(640607,'#20-325'),
(640603,'#10-398'),
(640606,'#09-415'),
(640606,'#16-428'),
(640605,'#13-422'),
(640606,'#15-180'),
(640606,'#16-339'),
(640605,'#11-148'),
(640606,'#06-210'),
(640603,'#10-246'),
(640607,'#04-404'),
(640604,'#20-323'),
(640607,'#17-367'),
(640605,'#08-146'),
(640603,'#20-158'),
(640605,'#01-419');
--------------------------------------------------------------------------------------
CREATE TABLE Owner( 
NRIC CHAR(9), 
name VARCHAR(50), 
postal_code INT, 
unit_number VARCHAR(10), 

PRIMARY KEY (NRIC), 

FOREIGN KEY (postal_code, unit_number) REFERENCES ResidentUnit(postal_code, unit_number) ON DELETE SET NULL ON UPDATE CASCADE
);


INSERT INTO Owner (NRIC, name, postal_code, unit_number) VALUES
('M0000001A','John', 560123, '#01-101' ),
('M0000002B','Peter', 560124, '#02-102' ),
('M0000003C','Jack', 310125, '#03-103'),
('M0000004D','Michael', 310126, '#04-201'),
('M0000005E','Fury', 460101, '#05-202'),
('M0000006F','John', 460102, '#11-111' ),
('M0000007G','Jack', 520341, '#07-302'),
('M0000008H','Jack', 520342, '#08-303' ),
('M0000009I','Angeline', 640601, '#09-304' ),
('M0000010J','Sophie', 640602, '#10-401' ),
('M0000011K','Michael',640603,'#20-158'),
('M0000012L','Henry',640603,'#20-158'),
('M0000013M','Oslo',640603,'#20-158'),
('F0000001A','Sophie', 650231, '#11-402'),
('F0000002B','Angeline', 730401, '#13-404'),
('F0000003C','Aurelia', 730402, '#20-701' ),
('F0000004D','Minnie', 820201, '#16-503'),
('F0000005E','Aster', 820202, '#18-601' ),
('F0000006F','Minnie',  600501, '#14-511' ),
('F0000007G','Michael',  600502, '#10-481' ),
('F0000008H','Sophie', 680301, '#06-301'),
('F0000009I','Harry', 680302, '#07-512' ),
('F0000010J','Minnie', 650232, '#12-403'),
('F0000011K','Maria',640605,'#13-422'),
('F0000012L','Norla',640606,'#15-180');
--------------------------------------------------------------------------------------
CREATE TABLE Email( 
email VARCHAR(50), 
NRIC CHAR(9), 

PRIMARY KEY (email), 

FOREIGN KEY (NRIC) REFERENCES Owner(NRIC)
);

INSERT INTO Email (email, NRIC) VALUES
('john001@gmail.com', 'M0000001A'),
('e0129780@nus.edu', 'M0000001A'),
('john123@ntu.edu', 'M0000001A'),
('sophie369@gmail.com', 'F0000001A'),
('soso@ntu.edu', 'F0000001A'),
('jackiechan@gmail.com', 'M0000007G'),
('angelina@nus.edu','M0000009I'),
('harryoso@ntu.edi','F0000009I'),
('mailingaddress@gmail.com','M0000010J');
--------------------------------------------------------------------------------------
CREATE TABLE ContactNumber( 
contact_number CHAR(8), 
NRIC CHAR(9), 

PRIMARY KEY (contact_number), 

FOREIGN KEY (NRIC) REFERENCES Owner(NRIC)
);

INSERT INTO ContactNumber (contact_number, NRIC) VALUES
('00000001', 'M0000001A'),
('01234567', 'M0000002B'),
('24681357', 'M0000002B'),
('76531249', 'M0000002B'),
('14714714', 'F0000003C'),
('78945612', 'F0000004D'),
('13052413', 'F0000003C'),
('87469312', 'F0000009I'),
('00000002', 'M0000006F');
--------------------------------------------------------------------------------------
CREATE TABLE VehicleModel( 
model VARCHAR(15), 
vehicle_type VARCHAR(15), 
brand VARCHAR(15),
 
PRIMARY KEY (model)
);

INSERT INTO VehicleModel (model, vehicle_type, brand)
VALUES
('Car001', 'Car', 'Honda'),
('Car002', 'Car', 'Toyota'),
('Car003', 'Car', 'Tesla'),
('Car004', 'Car', 'Kia'),
('Motor001', 'Motorcycle', 'Honda'),
('Motor002', 'Motorcycle', 'Yamaha'),
('Motor003', 'Motorcycle', 'Honda'),
('Comm001', 'Commercial', 'Toyota'),
('Comm002', 'Commercial', 'Nissan'),
('Comm003', 'Commercial', 'Mitsubishi');
--------------------------------------------------------------------------------------
CREATE TABLE Vehicle1 ( 
VRN CHAR(6),
IU_OBU_ID CHAR(8) NOT NULL,
color VARCHAR(15), 
year_manufactured INT,
model VARCHAR(15),
NRIC CHAR(9),

PRIMARY KEY (VRN),
UNIQUE (IU_OBU_ID),

FOREIGN KEY (model) REFERENCES VehicleModel(model) ON UPDATE CASCADE,
FOREIGN KEY (NRIC) REFERENCES Owner(NRIC)
);

INSERT INTO Vehicle1 (VRN, IU_OBU_ID, color, year_manufactured, model, NRIC) VALUES
('VRN001','IU000001','white',2018,'Car001','M0000006F'),
('VRN002','OBU00001','red',2019,'Car002','M0000005E'),
('VRN003','OBU00002','yellow',2025,'Car004','F0000009I'),
('VRN004','IU000002','blue',2024,'Car002','M0000003C'),
('VRN005','IU000003','green',2022,'Car003','M0000005E'),
('VRN006','OBU00003','green',2019,'Car003','F0000005E'),
('VRN007','IU000004','pink',2015,'Motor003','M0000003C'),
('VRN008','IU000005','silver',2020,'Car001','M0000001A'),
('VRN009','OBU00004','black',2023,'Car004','F0000002B'),
('VRN010','IU000006','white',2017,'Car002','M0000002B'),
('VRN011','OBU00005','gray',2019,'Motor001','F0000003C'),
('VRN012','IU000007','blue',2021,'Motor002','M0000004D'),
('VRN013','OBU00006','orange',2024,'Motor003','F0000004D'),
('VRN014','IU000008','red',2022,'Comm001','M0000006F'),
('VRN015','OBU00007','green',2023,'Comm002','F0000006F'),
('VRN016','IU000009','white',2016,'Comm003','M0000007G'),
('VRN017','OBU00008','black',2018,'Car003','F0000008H'),
('VRN018','IU000010','blue',2019,'Car001','M0000008H'),
('VRN019','OBU00009','gray',2020,'Motor002','F0000009I'),
('VRN020','IU000011','yellow',2024,'Car004','M0000010J'),
('VRN021','IU000012','white',2019,'Comm003','M0000011K'),
('VRN022','OBU00010','red',2018,'Car003','F0000012L'),
('VRN023','IU000013','blue',2019,'Car001','M0000013M'),
('VRN024','OBU00011','green',2020,'Car002','F0000010J'),
('VRN025','IU000014','pink',2024,'Car004','M0000012L');
--------------------------------------------------------------------------------------
CREATE TABLE ParkingModeRecord (
UID VARCHAR(10) NOT NULL,
parkingmode_ref VARCHAR(30),
PRIMARY KEY (UID),
);

INSERT INTO ParkingModeRecord(UID, parkingmode_ref) VALUES
('UID0001','Short-term'),
('UID0002','Short-term'),
('UID0003','Short-term'),
('UID0004','Short-term'),
('UID0005','Short-term'),
('UID0006','Short-term'),
('UID0007','Short-term'),
('UID0008','Short-term'),
('UID0009','Short-term'),
('UID0010','Short-term'),
('UID0011','Short-term'),
('UID0012','Short-term'),
('UID0013','Short-term'),
('UID0014','Short-term'),
('UID0015','Short-term'),
('UID0016','Short-term'),
('UID0017','Short-term'),
('UID0018','Short-term'),
('UID0019','Short-term'),
('UID0020','Short-term'),
('UID0021','Short-term'),
('UID0022','Short-term'),
('UID0023','Short-term'),
('UID1001','Seasonal'),
('UID1002','Seasonal'),
('UID1003','Seasonal'),
('UID1004','Seasonal'),
('UID1005','Seasonal'),
('UID1006','Seasonal'),
('UID1007','Seasonal'),
('UID1008','Seasonal'),
('UID1009','Seasonal'),
('UID1010','Seasonal'),
('UID1011','Seasonal'),
('UID1012','Seasonal'),
('UID1013','Seasonal'),
('UID1014','Seasonal'),
('UID1015','Seasonal'),
('UID1016','Seasonal'),
('UID1017','Seasonal'),
('UID1018','Seasonal'),
('UID1019','Seasonal'),
('UID1020','Seasonal'),
('UID1021','Seasonal'),
('UID1022','Seasonal'),
('UID1023','Seasonal'),
('UID1024','Seasonal'),
('UID1025','Seasonal'),
('UID1026','Seasonal'),
('UID1027','Seasonal'),
('UID1028','Seasonal'),
('UID1029','Seasonal'),
('UID1030','Seasonal'),
('UID1031','Seasonal'),
('UID1505','Seasonal'),
('UID1506','Seasonal'),
('UID1507','Seasonal'),
('UID1508','Seasonal');
--------------------------------------------------------------------------------------
CREATE TABLE R_SeasonPass_2 (
vehicle_type VARCHAR(30) NOT NULL,
carpark_type VARCHAR(30) NOT NULL,
monthly_rate FLOAT NOT NULL CHECK(monthly_rate>=0),

PRIMARY KEY (vehicle_type, carpark_type)
);

INSERT INTO R_SeasonPass_2 (vehicle_type, carpark_type, monthly_rate) VALUES
('Car', 'MSCP', 100.00),
('Car', 'Surface', 80.00),
('Motorcycle', 'MSCP', 50.00),
('Motorcycle', 'Surface', 30.00),
('Commercial', 'MSCP', 190.00),
('Commercial', 'Surface', 170.00);
--------------------------------------------------------------------------------------

CREATE TABLE R_Transaction_SeasonPass_1(
UTR VARCHAR(30),
date_time DATETIME NOT NULL,
amount_paid FLOAT NOT NULL CHECK(amount_paid>=0),
expiry_date DATETIME NOT NULL,  
CHECK(expiry_date>=date_time),
VRN CHAR(6) ,
UID VARCHAR(10),
carpark_ID CHAR(6),
PRIMARY KEY (UTR ),

FOREIGN KEY(VRN) REFERENCES Vehicle1(VRN) 
ON DELETE CASCADE,

FOREIGN KEY (carpark_ID) REFERENCES NormalCarpark(ID) 
ON DELETE CASCADE,

FOREIGN KEY (UID) REFERENCES ParkingModeRecord(UID) 
ON DELETE CASCADE
);

INSERT INTO R_Transaction_SeasonPass_1 (UTR, date_time, amount_paid, expiry_date, VRN, UID, carpark_ID) VALUES 
('UTR001','2025-01-01',100.00,'2025-02-01','VRN001','UID1001','HDB006'), 
('UTR002','2025-01-01',100.00,'2025-02-01','VRN002','UID1002','HDB005'), 
('UTR003','2025-01-01', 80.00,'2025-02-01','VRN003','UID1003','HDB020'), 
('UTR004','2025-02-01', 80.00,'2025-03-01','VRN004','UID1004','HDB003'), 
('UTR005','2025-02-01',100.00,'2025-03-01','VRN005','UID1005','HDB005'), 
('UTR006','2025-02-01', 80.00,'2025-03-01','VRN006','UID1006','HDB016'),
('UTR007','2025-02-01', 30.00,'2025-03-01','VRN007','UID1007','HDB003'), 
('UTR008','2025-03-01',100.00,'2025-04-01','VRN008','UID1008','HDB001'), 
('UTR009','2025-03-01', 80.00,'2025-04-01','VRN009','UID1009','HDB013'), 
('UTR010','2025-03-01', 80.00,'2025-04-01','VRN010','UID1010','HDB002'), 
('UTR011','2025-03-01', 50.00,'2025-04-01','VRN011','UID1011','HDB014'), 
('UTR012','2025-03-01', 30.00,'2025-04-01','VRN012','UID1012','HDB004'), 
('UTR013','2025-03-01', 30.00,'2025-04-01','VRN013','UID1013','HDB015'), 
('UTR014','2025-04-01',190.00,'2025-05-01','VRN014','UID1014','HDB006'), 
('UTR015','2025-04-01',170.00,'2025-05-01','VRN015','UID1015','HDB017'), 
('UTR016','2025-04-01',190.00,'2025-05-01','VRN016','UID1016','HDB007'), 
('UTR017','2025-04-01',100.00,'2025-05-01','VRN017','UID1017','HDB019'), 
('UTR018','2025-05-01',100.00,'2025-06-01','VRN018','UID1018','HDB008'), 
('UTR019','2025-05-01', 30.00,'2025-06-01','VRN019','UID1019','HDB020'), 
('UTR020','2025-05-01', 80.00,'2025-06-01','VRN020','UID1020','HDB010'),
('UTR021','2025-02-01', 80.00,'2025-03-01','VRN004','UID1021','HDB010'),
('UTR022','2025-02-01', 80.00,'2025-03-01','VRN007','UID1022','HDB010'),
('UTR023','2025-05-01', 240.00,'2025-08-01','VRN022','UID1023','HDB010'),
('UTR024','2025-05-01', 320.00,'2025-09-30','VRN023','UID1024','HDB010'),
('UTR025','2025-05-01', 160.00,'2025-07-01','VRN025','UID1025','HDB010'),
('UTR026','2025-05-01', 850.00,'2025-10-01','VRN021','UID1026','HDB010'),
('UTR027','2025-05-01', 160.00,'2025-07-01','VRN024','UID1027','HDB010'),
('UTR028','2025-05-01', 240.00,'2025-08-01','VRN007','UID1028','HDB010'),
('UTR029','2025-05-01', 680.00,'2025-09-01','VRN016','UID1029','HDB010'),
('UTR030','2025-05-01', 320.00,'2025-09-01','VRN010','UID1030','HDB010'),
('UTR031','2025-05-01', 80.00,'2025-06-01','VRN009','UID1031','HDB010');

--( UTR 4,7,21, 22 is for  Q6)

--------------------------------------------------------------------------------------

CREATE TABLE ParkingRecord (
entry_datetime DATETIME NOT NULL,
VRN CHAR(6) NOT NULL,
carpark_ID CHAR(6) NOT NULL,
UID VARCHAR(10) NOT NULL,
exit_datetime DATETIME,

PRIMARY KEY (entry_datetime, VRN, carpark_ID),
UNIQUE (UID, entry_datetime, exit_datetime),

FOREIGN KEY (VRN) REFERENCES Vehicle1(VRN) 
ON DELETE CASCADE,
FOREIGN KEY (carpark_ID) REFERENCES NormalCarpark(ID) 
ON DELETE CASCADE,
FOREIGN KEY (UID) REFERENCES ParkingModeRecord(UID)
ON DELETE CASCADE,
);

INSERT INTO ParkingRecord(entry_datetime, VRN, carpark_ID, UID, exit_datetime) VALUES
('2025-11-05 07:00:00','VRN008','HDB005','UID0001','2025-11-05 17:00:00'),
('2025-11-04 19:00:00','VRN010','HDB003','UID0002','2025-11-05 03:00:00'),
('2025-11-03 07:00:00','VRN004','HDB010','UID0003','2025-11-03 11:00:00'),
('2025-11-02 07:00:00','VRN012','HDB009','UID0004','2025-11-02 07:00:00'),
('2025-11-01 07:00:00','VRN002','HDB019','UID0005','2025-11-01 17:10:00'),
('2025-11-06 17:00:00','VRN014','HDB019','UID0006','2025-11-06 23:00:00'),
('2025-11-07 07:00:00','VRN016','HDB018','UID0007','2025-11-07 08:00:00'),
('2025-11-02 07:00:00','VRN018','HDB019','UID0008','2025-11-02 22:30:00'),
('2025-11-03 17:00:00','VRN003','HDB019','UID0009','2025-11-03 19:00:00'),
('2025-11-05 07:00:00','VRN010','HDB004','UID0010','2025-11-05 11:00:00'),
('2025-11-04 07:00:00','VRN001','HDB019','UID0011','2025-11-04 21:00:00'),
('2025-11-02 07:00:00','VRN009','HDB019','UID0012','2025-11-02 22:30:00'),
('2025-11-01 17:00:00','VRN011','HDB016','UID0013','2025-11-01 19:00:00'),
('2025-11-06 07:00:00','VRN013','HDB018','UID0014','2025-11-06 09:30:00'),
('2025-11-05 07:00:00','VRN006','HDB009','UID0015','2025-11-05 13:00:00'),
('2025-11-04 07:00:00','VRN015','HDB019','UID0016','2025-11-04 15:00:00'),
('2025-11-05 17:00:00','VRN017','HDB018','UID0017','2025-11-05 20:00:00'),
('2025-11-03 07:00:00','VRN018','HDB017','UID0018','2025-11-03 19:00:00'),
('2025-11-01 17:00:00','VRN019','HDB016','UID0019','2025-11-02 02:12:00'),
('2025-11-05 07:00:00','VRN020','HDB019','UID0020','2025-11-05 11:00:00'),
('2025-01-05 08:00:00','VRN001','HDB006','UID1001','2025-01-05 18:00:00'),
('2025-01-15 09:30:00','VRN002','HDB005','UID1002','2025-01-15 17:30:00'),
('2025-01-20 07:45:00','VRN003','HDB020','UID1003','2025-01-20 19:00:00'),
('2025-02-05 08:15:00','VRN004','HDB003','UID1004','2025-02-05 18:15:00'),
('2025-02-10 09:00:00','VRN005','HDB005','UID1005','2025-02-10 17:45:00'),
('2025-02-12 07:30:00','VRN006','HDB016','UID1006','2025-02-12 19:15:00'),
('2025-02-20 08:00:00','VRN007','HDB003','UID1007','2025-02-20 18:00:00'),
('2025-03-05 08:30:00','VRN008','HDB001','UID1008','2025-03-05 18:30:00'),
('2025-03-10 09:00:00','VRN009','HDB013','UID1009','2025-03-10 18:00:00'),
('2025-03-12 08:00:00','VRN010','HDB002','UID1010','2025-03-12 17:30:00'),
('2025-03-15 07:45:00','VRN011','HDB014','UID1011','2025-03-15 18:15:00'),
('2025-03-20 08:30:00','VRN012','HDB004','UID1012','2025-03-20 18:00:00'),
('2025-03-22 08:15:00','VRN013','HDB015','UID1013','2025-03-22 18:30:00'),
('2025-04-05 08:00:00','VRN014','HDB006','UID1014','2025-04-05 18:00:00'),
('2025-04-10 09:00:00','VRN015','HDB017','UID1015','2025-04-10 18:00:00'),
('2025-04-12 07:45:00','VRN016','HDB007','UID1016','2025-04-12 18:15:00'),
('2025-04-15 08:30:00','VRN017','HDB019','UID1017','2025-04-15 18:30:00'),
('2025-05-05 08:00:00','VRN018','HDB008','UID1018','2025-05-05 18:00:00'),
('2025-05-10 09:15:00','VRN019','HDB020','UID1019','2025-05-10 18:45:00'),
('2025-05-12 08:00:00','VRN020','HDB010','UID1020','2025-05-12 17:30:00'),
('2025-01-12 07:45:00','VRN007','HDB011','UID0021','2025-04-12 18:15:00'),
('2025-02-12 07:45:00','VRN007','HDB012','UID0022','2025-04-12 18:15:00'),
('2025-03-12 07:45:00','VRN007','HDB013','UID0023','2025-04-12 18:15:00'),
('2025-04-12 07:45:00','VRN010','HDB014','UID1021','2025-04-12 18:15:00'),
('2025-03-06 08:30:00','VRN010','HDB015','UID1022','2025-03-05 18:30:00'),
('2025-03-05 08:30:00','VRN010','HDB016','UID1023','2025-03-05 18:30:00'); 
--------------------------------------------------------------------------------------
CREATE TABLE Tx_ShortTermParking (
    UID VARCHAR(10) NOT NULL,
    entry_datetime DATETIME NOT NULL,
    exit_datetime DATETIME NOT NULL,
    total_amount_paid FLOAT NOT NULL CHECK (total_amount_paid >= 0),
    NRIC CHAR(9) NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,

    PRIMARY KEY (UID, entry_datetime, exit_datetime),

    FOREIGN KEY (NRIC) REFERENCES Owner(NRIC)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (UID, entry_datetime, exit_datetime)
        REFERENCES ParkingRecord(UID, entry_datetime, exit_datetime)
        ON DELETE NO ACTION,

    FOREIGN KEY (UID)
        REFERENCES ParkingModeRecord(UID)
        ON DELETE CASCADE
);
--------------------------------------------------------------------------------------
INSERT INTO Tx_ShortTermParking (UID, entry_datetime, exit_datetime, total_amount_paid, NRIC, vehicle_type)
VALUES
('UID0001','2025-11-05 07:00:00','2025-11-05 17:00:00', 8.4, 'M0000001A', 'Car'),
('UID0002','2025-11-04 19:00:00','2025-11-05 03:00:00', 4.8, 'M0000002B', 'Car'),
('UID0003','2025-11-03 07:00:00','2025-11-03 11:00:00', 2.4, 'M0000003C', 'Motorcycle'),
('UID0004','2025-11-02 07:00:00','2025-11-02 07:00:00', 0, 'M0000004D', 'Motorcycle'),
('UID0005','2025-11-01 07:00:00','2025-11-01 17:10:00', 12.2, 'M0000005E', 'Car'),
('UID0006','2025-11-06 17:00:00','2025-11-06 23:00:00', 3.6, 'M0000006F', 'Commercial'),
('UID0007','2025-11-07 07:00:00','2025-11-07 08:00:00', 1.2, 'M0000007G', 'Commercial'),
('UID0008','2025-11-02 07:00:00','2025-11-02 22:30:00', 0, 'M0000008H', 'Car'),
('UID0009','2025-11-03 17:00:00','2025-11-03 19:00:00', 1.2, 'M0000009I', 'Car'),
('UID0010','2025-11-05 07:00:00','2025-11-05 11:00:00', 4.8, 'M0000010J', 'Car'),
('UID0011','2025-11-04 07:00:00','2025-11-04 21:00:00', 16.8, 'F0000001A', 'Car'),
('UID0012','2025-11-02 07:00:00','2025-11-02 22:30:00', 0, 'F0000002B', 'Car'),
('UID0013','2025-11-01 17:00:00','2025-11-01 19:00:00', 0.6, 'F0000003C', 'Motorcycle'),
('UID0014','2025-11-06 07:00:00','2025-11-06 09:30:00', 1.5, 'F0000004D', 'Motorcycle'),
('UID0015','2025-11-05 07:00:00','2025-11-05 13:00:00', 7.2, 'F0000005E', 'Car'),
('UID0016','2025-11-04 07:00:00','2025-11-04 15:00:00', 9.6, 'F0000006F', 'Commercial'),
('UID0017','2025-11-05 17:00:00','2025-11-05 20:00:00', 1.8, 'F0000007G', 'Car'),
('UID0018','2025-11-03 07:00:00','2025-11-03 19:00:00', 14.4, 'F0000008H', 'Car'),
('UID0019','2025-11-01 17:00:00','2025-11-02 02:12:00', 11.0, 'F0000009I', 'Commercial'),
('UID0020','2025-11-05 07:00:00','2025-11-05 11:00:00', 4.8, 'F0000010J', 'Car');

CREATE TABLE ShortTermRate(
       day VARCHAR(4),
       time VARCHAR(30),
       vehicle_type  VARCHAR(20),
       parking_rate FLOAT NOT NULL CHECK( parking_rate >= 0 ),

       PRIMARY KEY (day, time, vehicle_type)
);
--------------------------------------------------------------------------------------
INSERT INTO ShortTermRate( day, time, vehicle_type, parking_rate )
VALUES
('Mon', '7.00am to 5.00pm', 'Car', 1.2),
('Mon', '5.00pm to 7.00am', 'Car', 0.6),
('Mon', '7.00am to 5.00pm', 'Commercial', 1.2),
('Mon', '5.00pm to 7.00am', 'Commercial', 0.6),
('Mon', '7.00am to 5.00pm', 'Motorcycle', 0.6),
('Mon', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Tue', '7.00am to 5.00pm', 'Car', 1.2),
('Tue', '5.00pm to 7.00am', 'Car', 0.6),
('Tue', '7.00am to 5.00pm', 'Commercial', 1.2),
('Tue', '5.00pm to 7.00am', 'Commercial', 0.6),
('Tue', '7.00am to 5.00pm', 'Motorcycle', 0.6),
('Tue', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Wed', '7.00am to 5.00pm', 'Car', 1.2),
('Wed', '5.00pm to 7.00am', 'Car', 0.6),
('Wed', '7.00am to 5.00pm', 'Commercial', 1.2),
('Wed', '5.00pm to 7.00am', 'Commercial', 0.6),
('Wed', '7.00am to 5.0
0pm', 'Motorcycle', 0.6),
('Wed', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Thu', '7.00am to 5.00pm', 'Car', 1.2),
('Thu', '5.00pm to 7.00am', 'Car', 0.6),
('Thu', '7.00am to 5.00pm', 'Commercial', 1.2),
('Thu', '5.00pm to 7.00am', 'Commercial', 0.6),
('Thu', '7.00am to 5.00pm', 'Motorcycle', 0.6),
('Thu', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Fri', '7.00am to 5.00pm', 'Car', 1.2),
('Fri', '5.00pm to 7.00am', 'Car', 0.6),
('Fri', '7.00am to 5.00pm', 'Commercial', 1.2),
('Fri', '5.00pm to 7.00am', 'Commercial', 0.6),
('Fri', '7.00am to 5.00pm', 'Motorcycle', 0.6),
('Fri', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Sat', '7.00am to 5.00pm', 'Car', 1.2),
('Sat', '5.00pm to 7.00am', 'Car', 0.6),
('Sat', '7.00am to 5.00pm', 'Commercial', 1.2),
('Sat', '5.00pm to 7.00am', 'Commercial', 0.6),
('Sat', '7.00am to 5.00pm', 'Motorcycle', 0.6),
('Sat', '5.00pm to 7.00am', 'Motorcycle', 0.3),

('Sun', '7.00am to 10.30pm', 'Car', 0),
('Sun', '10.30pm to 7.00am', 'Car', 0.6),
('Sun', '7.00am to 10.30pm', 'Commercial', 0),
('Sun', '10.30pm to 7.00am', 'Commercial', 0.6),
('Sun', '7.00am to 10.30pm', 'Motorcycle', 0),
('Sun', '10.30pm to 7.00am', 'Motorcycle', 0.3);
--------------------------------------------------------------------------------------

CREATE TABLE Rules (
rule_no CHAR(6),
description  VARCHAR(100),
vehicle_type VARCHAR(20),
action_fine INT ,

PRIMARY KEY(rule_no)
);

INSERT INTO Rules (rule_no, description, vehicle_type, action_fine) VALUES
('R00003', 'parking in a place other than in a parking lot', 'Motorcycle', 35),
('R00006', 'parking in a place other than in a parking lot', 'Car', 90),
('R00010', 'parking in a parking lot not designated for the use of that vehicle', 'Car', 70),
('R00018', 'parking in a season parking place without valid season parking', 'Car', 70),
('R00007', 'failure to pay parking charge before leaving a parking place', 'Car', 70),
('R00001', 'parking without displaying an authorised label', 'Car',200),
('R00002', 'parking without displaying an authorised label', 'Motorcycle', 100),
('R00012', 'failure to obey signs exhibited in the parking place', 'Commercial', 100),
('R00013', 'parking beyond the boundaries of the parking lot thereby causing obstruction', 'Car', 70),
('R00004', 'using a parking place for unauthorised purpose', 'Car', 80),
('R00005', 'using a parking place for unauthorised purpose', 'Motorcycle', 80),
('R00008', 'parking against traffic flow', 'Car',70);
--------------------------------------------------------------------------------------

CREATE TABLE Offence(
OffenceID CHAR(6),
entry_datetime DATETIME,
VRN CHAR(6),
carpark_identification_number CHAR(6),
offence_datetime DATETIME,
rule_no CHAR(6),

PRIMARY KEY(OffenceID, entry_datetime, VRN, carpark_identification_number),

FOREIGN KEY(rule_no) REFERENCES Rules(rule_no) 
ON DELETE SET NULL ON UPDATE CASCADE,
FOREIGN KEY (entry_datetime, VRN, carpark_identification_number) REFERENCES ParkingRecord(entry_datetime, VRN, carpark_ID) 
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Offence(OffenceID, entry_datetime, VRN, carpark_identification_number, offence_datetime, rule_no) VALUES
('Of0001', '2025-01-05 08:00:00', 'VRN001', 'HDB006', '2025-01-05 09:45:00', 'R00010'),
('Of0002', '2025-01-20 07:45:00', 'VRN003', 'HDB020', '2025-01-20 09:10:00', 'R00013'),
('Of0003', '2025-02-10 09:00:00', 'VRN005', 'HDB005', '2025-02-10 15:15:00', 'R00001'),
('Of0004', '2025-02-20 08:00:00', 'VRN007', 'HDB003', '2025-02-20 09:15:00', 'R00005'),
('Of0005', '2025-01-15 09:30:00', 'VRN002', 'HDB005', '2025-01-15 13:15:00', 'R00008'),
('Of0006', '2025-03-15 07:45:00', 'VRN011', 'HDB014', '2025-03-15 09:25:00', 'R00003'),
('Of0007', '2025-03-12 08:00:00', 'VRN010', 'HDB002', '2025-03-12 10:15:00', 'R00010'),
('Of0008', '2025-03-20 08:30:00', 'VRN012', 'HDB004', '2025-03-20 09:15:00', 'R00002'),
('Of0009', '2025-01-15 09:30:00', 'VRN002', 'HDB005', '2025-01-15 15:15:00', 'R00018'),
('Of0010', '2025-02-05 08:15:00', 'VRN004', 'HDB003', '2025-02-05 09:15:00', 'R00004'),
('Of0011', '2025-03-22 08:15:00', 'VRN013', 'HDB015', '2025-03-22 09:15:00', 'R00002'),
('Of0012', '2025-04-10 09:00:00', 'VRN015', 'HDB017', '2025-04-10 09:45:00', 'R00012'),
('Of0013', '2025-02-10 09:00:00', 'VRN005', 'HDB005', '2025-02-10 10:15:00', 'R00008'),
('Of0014', '2025-02-20 08:00:00', 'VRN007', 'HDB003', '2025-02-20 09:15:00', 'R00002'),
('Of0015', '2025-02-12 07:30:00', 'VRN006', 'HDB016', '2025-02-12 09:15:00', 'R00006'),
('Of0016', '2025-05-10 09:15:00', 'VRN019', 'HDB020', '2025-05-10 11:35:00', 'R00003'),
('Of0017', '2025-04-12 07:45:00', 'VRN016', 'HDB007', '2025-04-12 10:55:00', 'R00002'),
('Of0018', '2025-03-12 08:00:00', 'VRN010', 'HDB002', '2025-03-12 09:15:00', 'R00004'),
('Of0019', '2025-03-05 08:30:00', 'VRN008', 'HDB001', '2025-03-05 11:23:00', 'R00018'),
('Of0020', '2025-04-12 07:45:00', 'VRN016', 'HDB007', '2025-04-12 09:35:00', 'R00012'),
('Of0021', '2025-01-12 07:45:00', 'VRN007', 'HDB011', '2025-04-12 09:35:00', 'R00012'),
('Of0022', '2025-02-12 07:45:00', 'VRN007', 'HDB012', '2025-04-12 09:35:00', 'R00002'),
('Of0023', '2025-03-12 07:45:00', 'VRN007', 'HDB013', '2025-04-12 09:35:00', 'R00008'),
('Of0024', '2025-04-12 07:45:00', 'VRN010', 'HDB014', '2025-04-12 09:35:00', 'R00005'), 
('Of0025', '2025-03-06 08:30:00', 'VRN010', 'HDB015', '2025-03-05 11:23:00', 'R00004'),
('Of0026', '2025-03-05 08:30:00', 'VRN010', 'HDB016', '2025-03-05 11:23:00', 'R00012'); 
--------------------------------------------------------------------------------------