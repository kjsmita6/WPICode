/*Drop all tables*/
drop view DoctorsLoad;
drop view CriticalCases;

drop table StayIn;
drop table Examine;
drop table Admission;
drop table Doctor;
drop table Patient;
drop table RoomAccess;
drop table RoomService;
drop table Equipment;
drop table EquipmentType;
drop table Room;
drop table Employee;

/************ Part 1 ***********/
create table Employee (
	ID varchar2(16) Primary Key,
	fName varchar2(64) Not null,
	lName varchar2(64) Not null,
	salary number(8, 2),
	jobTitle varchar2(32),
	officeNum number(4),
	empRank char(1)
		Constraint rank_check check (empRank in ('0', '1', '2')),	
	supervisorID varchar2(16) References Employee(ID)
);

create table Room (
	num number Primary Key,
	occupied char(1)
		Constraint occ_flag check (occupied in ('0', '1'))
);

create table EquipmentType (
	ID varchar2(16) Primary Key,
	description varchar2(256),
	model varchar2(16) Unique,
	instructions varchar2(2048),
	numUnits number
);

create table Equipment (
	serialNum varchar2(16) Primary Key,
	typeID varchar2(16) References EquipmentType(ID),
	purchaseYear number(4),
	lastInspection date,
	roomNum number(4) References Room(num)
);

create table RoomService (
	roomNum number(4) References Room(num),
	service varchar2(32),
	Constraint pk_service Primary Key (roomNum, service)
);

create table RoomAccess (
	roomNum number(4) References Room(num),
	empID varchar2(16) References Employee(ID),
	Constraint pk_access Primary Key (roomNum, empID)
);

create table Patient (
	SSN varchar2(11) Primary Key,
	fName varchar2(64) Not Null,
	lName varchar2(64) Not Null,
	address varchar2(128),
	phone varchar2(12)
);

create table Doctor (
	ID varchar2(16) Primary Key,
	gender char(1) Not Null
		Constraint gender_flag check (gender in ('M', 'F')),
	specialty varchar2(64) Not Null,
	lName varchar2(64) Not Null,
	fName varchar2(64) Not Null
);

create table Admission (
	num varchar2(16) Primary Key,
	admissionDate date Not Null,
	leaveDate date,
	totalPayment number(9, 2),
	insurancePayment number(9, 2),
	patientSSN varchar2(11) References Patient(SSN),
	futureVisit date
);

create table Examine (
	doctorID varchar2(16) References Doctor(ID),
	admissionNum varchar2(16) References Admission(num),
	dr_comment varchar2(256) Not Null,
	Constraint pk_examine Primary Key (doctorID, admissionNum)
);

create table StayIn (
	admissionNum varchar2(16) References Admission(num),
	roomNum number(4) References Room(num),
	startDate date Not Null,
	endDate date,
	Constraint pk_stay Primary Key (admissionNum, roomNum, startDate)
);

/************* Part 3 ***************/
insert into patient values('111-22-3333', 'kyle', 'smith','33 institute','2242169390');
insert into patient values('222-33-4444', 'luke', 'bodwell', '100 institute', '123456789');
insert into patient values('025-10-3643', 'joanne', 'lozoya', '2294 stanton hollow rd', '7815565301');
insert into patient values('263-97-9043', 'ashley', 'fry', '2105 chestnut st', '7273765893');
insert into patient values('641-01-9421', 'eula', 'holland', '2393 jerome ave', '9563043523');
insert into patient values('177-36-2237', 'william', 'miller', '926 horseshoe ln', '4843963278');
insert into patient values('464-09-6100', 'joel', 'coleman', '2494 fannie st', '9792226641');
insert into patient values('675-01-0023', 'joe', 'robertson', '2945 riverside dr', '7067861701');
insert into patient values('302-88-4502', 'teri', 'ransom', '3385 round table dr', '5138672199');
insert into patient values('526-08-2323', 'aisha', 'armstrong', '1569 east ave', '4803296672');

insert into Doctor values('27876831', 'F', 'ALLERGY AND IMMUNOLOGY', 'Davis', 'Sharon');
insert into Doctor values('37804128', 'M', 'ANESTHESIOLOGY', 'Finch', 'Harold');
insert into Doctor values('88464821', 'M', 'DERMATOLOGY', 'Nelson', 'Derek');
insert into Doctor values('19477105', 'M', 'DIAGNOSTIC RADIOLOGY', 'Daniels', 'Leroy');
insert into Doctor values('76156103', 'F', 'EMERGENCY MEDICINE', 'Jackson', 'Julie');
insert into Doctor values('04075234', 'F', 'FAMILY MEDICINE', 'Young', 'Christine');
insert into Doctor values('79808959', 'F', 'INTERNAL MEDICINE', 'Palmer', 'Trish');
insert into Doctor values('09210761', 'M', 'MEDICAL GENETICS', 'Burton', 'Adam');
insert into Doctor values('99237999', 'M', 'NEUROLOGY', 'Brown', 'George');
insert into Doctor values('36078374', 'F', 'OBSTETRICS AND GYNECOLOGY', 'Wagner', 'Patricia');

insert into room values(101, '1');
insert into room values(102, '0');
insert into room values(103, '1');
insert into room values(104, '0');
insert into room values(105, '0');
insert into room values(106, '0');
insert into room values(107, '1');
insert into room values(108, '1');
insert into room values(109, '1');
insert into room values(110, '0');

insert into roomservice values(104, 'xray');
insert into roomservice values(104, 'radiology');
insert into roomservice values(106, 'mri');
insert into roomservice values(106, 'biohazard disposal');
insert into roomservice values(101, 'surgery');
insert into roomservice values(101, 'ICU');
insert into roomService values(102, 'emergency');

insert into EquipmentType values('44613010', 'MRI', 'MRI-63801624', 'Turn on and scan', 5);
insert into EquipmentType values('46028586', 'X-Ray', 'XR-03720890', 'Turn on and scan', 7);
insert into EquipmentType values('78692186', 'Ultrasound', 'US-97767377', 'Turn on and scan', 12);
insert into EquipmentType values('84673823', 'CT Scanner', 'CT-93781233', 'Turn on and scan', 9);

insert into Equipment values('7001118834276826', '44613010', '1997', to_date('07-03-2010','mm-dd-yyyy'), 101);
insert into Equipment values('1521491155967539', '44613010', '1997', to_date('07-03-2010','mm-dd-yyyy'), 102);
insert into Equipment values('9213633584304055', '44613010', '2000', to_date('07-03-2010','mm-dd-yyyy'), 103);
insert into Equipment values('1540199334163919', '46028586', '2003', to_date('07-03-2010','mm-dd-yyyy'), 104);
insert into Equipment values('9821038626108403', '46028586', '2008', to_date('07-03-2010','mm-dd-yyyy'), 105);
insert into Equipment values('3711609688721761', '46028586', '2013', to_date('07-03-2010','mm-dd-yyyy'), 106);
insert into Equipment values('1417746338311991', '78692186', '2010', to_date('07-03-2010','mm-dd-yyyy'), 107);
insert into Equipment values('8302706349662421', '78692186', '2010', to_date('07-03-2010','mm-dd-yyyy'), 108);
insert into Equipment values('5170595955963663', '78692186', '2011', to_date('07-03-2010','mm-dd-yyyy'), 109);

insert into admission values('12389', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into examine values('76156103', '12389', 'Patient came with reports of the flu. Treated with Tamiflu and Tylenol.');
insert into stayin values('12389', 101, to_date('02-06-2020','mm-dd-yyyy'), null);
insert into admission values('12390', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into examine values('76156103', '12390', 'Patient came with reports of the flu. Treated with Tamiflu and Tylenol.');
insert into stayin values('12390', 101, to_date('02-06-2020','mm-dd-yyyy'), null);
insert into admission values('12391', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into examine values('76156103', '12391', 'Patient came with reports of the flu. Treated with Tamiflu and Tylenol.');
insert into stayin values('12391', 101, to_date('02-06-2020','mm-dd-yyyy'), null);
insert into admission values('12392', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into examine values('76156103', '12392', 'Patient came with reports of the flu. Treated with Tamiflu and Tylenol.');
insert into stayin values('12392', 101, to_date('02-06-2020','mm-dd-yyyy'), null);
insert into admission values('12393', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into examine values('76156103', '12393', 'Patient came with reports of the flu. Treated with Tamiflu and Tylenol.');
insert into stayin values('12393', 101, to_date('02-06-2020','mm-dd-yyyy'), null);

insert into admission values('10123', to_date('01-01-2020','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'), 300, 200, '111-22-3333', null);
insert into examine values('76156103', '10123', 'Patient came in with intense coughing. Chest x-ray confirms diagnosis of pneumonia. Treated with antibiotics and released.');
insert into stayin values('10123', 104, to_date('01-01-2020','mm-dd-yyyy'), to_date('01-01-2020','mm-dd-yyyy'));

insert into admission values('08433', to_date('06-24-2010','mm-dd-yyyy'), to_date('07-01-2010','mm-dd-yyyy'), 1000, 600, '025-10-3643', to_date('07-01-2010','mm-dd-yyyy'));
insert into examine values('76156103', '08433', 'Patient was brought in by ambulance after falling off her roof while doing work. Treated for a broken leg and sprained wrist and release without complications.');
insert into stayin values('08433', 104, to_date('06-24-2010','mm-dd-yyyy'), to_date('06-24-2010','mm-dd-yyyy'));

insert into admission values('08629', to_date('07-01-2010','mm-dd-yyyy'), to_date('07-01-2010','mm-dd-yyyy'), 250, 150, '025-10-3643', null);
insert into examine values('76156103', '08629', 'Followup from prev appt. Patient shows good signs of recovery. No further followup required.');
insert into stayin values('08629', 110, to_date('07-01-2010','mm-dd-yyyy'), to_date('07-01-2010','mm-dd-yyyy'));

insert into admission values('09440', to_date('12-14-2010','mm-dd-yyyy'), to_date('12-14-2010','mm-dd-yyyy'), 300, 200, '675-01-0023', null);
insert into examine values('76156103', '09440', 'Patient came in with the flu. Released with rx for tamiflu and tylenol.');
insert into stayin values('09440', 101, to_date('12-14-2010','mm-dd-yyyy'), to_date('12-14-2010','mm-dd-yyyy'));
insert into admission values('09441', to_date('12-14-2010','mm-dd-yyyy'), to_date('12-14-2010','mm-dd-yyyy'), 300, 200, '675-01-0023', null);
insert into examine values('76156103', '09441', 'Patient came in with the flu. Released with rx for tamiflu and tylenol.');
insert into stayin values('09441', 101, to_date('12-14-2010','mm-dd-yyyy'), to_date('12-14-2010','mm-dd-yyyy'));

insert into admission values('04274', to_date('04-19-2007','mm-dd-yyyy'), to_date('04-20-2007','mm-dd-yyyy'), 250, 250, '675-01-0023', null);
insert into examine values('79808959', '04274', 'Patient began taking anti-diabetic treatment, including insulin, medication, and lifestyle changes.');
insert into stayin values('04274', 110, to_date('04-19-2007','mm-dd-yyyy'), to_date('04-02-2007','mm-dd-yyyy'));

insert into admission values('10243', to_date('01-23-2019','mm-dd-yyyy'), null, 20000, 18500, '302-88-4502', null);
insert into examine values('04075234', '10243', 'Patient being treated for lymphoma. Family will be notified of prognisis.');
insert into stayin values('10243', 101, to_date('01-23-2019','mm-dd-yyyy'), null);

insert into admission values('10244', to_date('02-01-2020','mm-dd-yyyy'), null, 300, 100, '302-88-4502', null);
insert into examine values('04075234', '10244', 'Patient not making progress with current treatment. Will enter hospice care.');
insert into stayin values('10244', 101, to_date('02-01-2020','mm-dd-yyyy'), null);

insert into admission values('7324', to_date('11-09-2014','mm-dd-yyyy'), to_date('11-09-2014','mm-dd-yyyy'), 300, 50, '177-36-2237', null);
insert into examine values('27876831', '7324', 'Patient came in reporting symptoms of anaphylaxis. Treated with IV epinephrine and given benadryl and an epi-pen to take home.');
insert into stayin values('7324', 107, to_date('11-09-2014','mm-dd-yyyy'), to_date('11-09-2014','mm-dd-yyyy'));

insert into admission values('92132', to_date('06-26-2016','mm-dd-yyyy'), to_date('06-26-2016','mm-dd-yyyy'), 300, 50, '177-36-2237', null);
insert into examine values('27876831', '92132', 'Patient came in reporting symptoms of anaphylaxis. Treated with IV epinephrine and given benadryl and an epi-pen to take home.');
insert into stayin values('92132', 107, to_date('06-26-2016','mm-dd-yyyy'), to_date('06-26-2016','mm-dd-yyyy'));

insert into admission values('12933', to_date('01-01-2016','mm-dd-yyyy'), to_date('01-01-2016','mm-dd-yyyy'), 300, 200, '111-22-3333', to_date('01-07-2019','mm-dd-yyyy'));
insert into examine values('76156103', '12933', 'Patient treated for excessive drinking on nye.');
insert into stayin values('12933', 101, to_date('01-01-2016','mm-dd-yyyy'), to_date('01-01-2016','mm-dd-yyyy'));

insert into admission values('08624', to_date('07-07-2010','mm-dd-yyyy'), to_date('07-07-2010','mm-dd-yyyy'), 250, 150, '025-10-3643', null);
insert into examine values('76156103', '08624', 'Followup from prev appt. Patient shows good signs of recovery. No further followup required.');
insert into stayin values('08624', 110, to_date('07-07-2010','mm-dd-yyyy'), to_date('07-07-2010','mm-dd-yyyy'));

insert into Employee values('97196720', 'Michael', 'Ditch', '150000.00', 'Director of Hospital', '201', '2', null);
insert into Employee values('93392495', 'Randall', 'Burns', '150000.00', 'Head of Grounds and Maintenance', '202', '2', null);
insert into Employee values('71658281', 'James', 'Evans', '100000.00', 'Maintenance Manager', '203', '1', '93392495');
insert into Employee values('47985241', 'Ester', 'Schulz', '100000.00', 'Custodial Manager', '204', '1', '93392495');
insert into Employee values('52651345', 'Hazel', 'Park', '100000.00', 'Chief Nurse', '205', '1', '97196720');
insert into Employee values('38283678', 'George', 'Snow', '100000.00', 'Unit Secretary', '206', '1', '97196720');
insert into Employee values('33070587', 'Martin', 'Crabtree', '50000.00', 'Maintenance', '301', '0', '71658281');
insert into Employee values('85862405', 'Zachary', 'Coleman', '50000.00', 'Maintenance', '302', '0', '71658281');
insert into Employee values('43929177', 'Syreeta', 'Simmons', '50000.00', 'Maintenance', '303', '0', '71658281');
insert into Employee values('89518157', 'Jeffrey', 'Cerda', '50000.00', 'Custodian', '304', '0', '47985241');
insert into Employee values('75608529', 'Michael', 'Fix', '50000.00', 'Custodian', '305', '0', '47985241');
insert into Employee values('59679261', 'Jeffrey', 'Jimenez', '50000.00', 'Nurse', '306', '0', '52651345');
insert into Employee values('47006439', 'John', 'Hendricks', '50000.00', 'Nurse', '307', '0', '52651345');
insert into Employee values('44531264', 'William', 'Morris', '50000.00', 'Nurse', '308', '0', '52651345');
insert into Employee values('72425086', 'Janet', 'Munoz', '50000.00', 'Secretary', '309', '0', '38283678');
insert into Employee values('59928394', 'Dustin', 'Rotter', '50000.00', 'Secretary', '310', '0', '38283678');

insert into roomaccess values(101, '33070587');
insert into roomaccess values(101, '85862405');
insert into roomaccess values(101, '97196720');
insert into roomaccess values(102, '97196720');
insert into roomaccess values(103, '97196720');
insert into roomaccess values(104, '97196720');
insert into roomaccess values(105, '97196720');
insert into roomaccess values(106, '97196720');
insert into roomaccess values(107, '97196720');
insert into roomaccess values(108, '97196720');
insert into roomaccess values(109, '97196720');
insert into roomaccess values(110, '97196720');

/************** Part 2 ****************/
/*Q1: Report rooms that are occupied (occupied=1)*/
select num 
from Room
where occupied='1';

/*Q2: Report all regular employees that have supervised by division manager with id=10*/
select ID, fName, lName, salary
from Employee
where supervisorID='10';

/*Q3: Report sum of insurance payments from each patient */
select patientSSN, sum(insurancePayment) as payments
from Admission
group by patientSSN;

/*Q4: Report number of visits by each patient */
select patientSSN, fName, lName, count(num) as visits
from Patient P, Admission A
where P.SSN = A.patientSSN
group by patientSSN, fName, lName;

/*Q5: Report room number that has equipment with serial number A01-02X */
select roomNum
from Equipment
where serialNum='A01-02X';

/*Q6: Report employee who has access to most rooms */
select query1.*
from 
	(select empID, count(*) as cnt 
	from roomaccess 
	group by empID) query1,
    (select max(query2.cnt) as max_cnt 
    from 
        (select empID, count(*) as cnt
        from roomaccess
        group by empID) query2) query3 
where query1.cnt = query3.max_cnt;

/*Q7: Report number of regular employees, division managers, and general managers */
select case empRank
	when '0' then 'Regular Employees'
	when '1' then 'Division Managers'
	when '2' then 'General Managers'
end as empType, count(ID) as empCount
from Employee
group by case empRank 
	when '0' then 'Regular Employees' 
	when '1' then 'Division Managers'
	when '2' then 'General Managers'
end;

/*Q8: Report all patients' scheduled future visits*/
select patientSSN, fName, lName, futureVisit
from Patient P, Admission A
where P.SSN = A.patientSSN and A.futureVisit is not null
group by patientSSN, fName, lName, futureVisit;

/*Q9: Report number of units of each type that has more than 3 units */
select ID, model, numUnits
from EquipmentType
where numUnits > 3;

/*Q10: Report date of coming future visit for patient 111-22-3333 */
select max(futureVisit) as futVisit
from Admission
where patientSSN = '111-22-3333';

/*Q11: Report the doctors who have examined patient 111-22-3333 more than twice */
select distinct doctorID
from Examine E, Admission A
where E.admissionNum = A.num
and patientSSN = '111-22-3333'
group by doctorID
having count(doctorID) > 2;

/*Q12: Report equipment types that the hospital has bought in 2010 and 2011 */
select distinct typeID 
from EquipmentType ET, Equipment E
where ET.ID = E.typeID and (purchaseYear = 2010
or purchaseYear = 2011);

create view CriticalCases as 
	(select patientSSN, fName, lName, count(patientSSN) as numberOfAdmissionsToICU
		from Admission A, StayIn SI, RoomService R, Patient P
			where SI.admissionNum=A.num and SI.roomNum=R.roomNum and A.patientSSN=P.SSN and R.service='ICU'
				group by patientSSN, fName, lName
				having count(patientSSN) >= 2);

 create view DoctorsLoad as
 	(select ID, gender, case
 		when load1>10 then 'Overloaded'
 		else 'Underloaded'
 		end as load
 		from
 		(select ID, gender, count(admissionNum) as load1
 			from Doctor D, Examine E
 				where D.ID=E.doctorID
 					group by ID, gender));

 select patientSSN, fName, lName
 	from CriticalCases
 		where numberOfAdmissionsToICU>4;

 select D.ID, fName, lName
 	from DoctorsLoad DL, Doctor D
 		where DL.ID = D.ID and DL.gender='F' and load='Overloaded';

 select ID, A.patientSSN, dr_comment
 	from DoctorsLoad DL, Examine E, Admission A, CriticalCases C
 		where DL.ID = E.doctorID
 		and E.admissionNum = A.num
 		and A.patientSSN = C.patientSSN
 		and load = 'Underloaded';

create or replace trigger mustComment
	before insert on Examine
		for each row
		declare
			service varchar2(32);
		begin
			select R.service into service from StayIn S, RoomService R
			where :new.admissionNum = S.admissionNum and S.roomNum = R.roomNum and R.service = 'ICU';
			if (:new.dr_comment is null) then
				RAISE_APPLICATION_ERROR(-20004, 'If a doctor visits a patient in the ICU, they must leave a comment.');
			end if;
		end;
		/

delete from stayin where admissionNum = '12315';
delete from admission where num = '12315';

insert into admission values('12315', to_date('02-06-2020','mm-dd-yyyy'), null, 1500, 1400, '111-22-3333', null);
insert into stayin values('12315', 101, to_date('02-06-2020','mm-dd-yyyy'), null);
insert into examine values('76156103', '12315', null);

create or replace trigger updateInsurancePayment 
	before insert or update of totalPayment on Admission
		for each row
			begin
				:new.insurancePayment := 0.65 * :new.totalPayment;
			end;
			/
         
select num, totalPayment, insurancePayment from Admission where num = '08433';
update Admission set totalPayment = 1000 where num = '08433';
insert into Admission values ('28192', to_date('01/01/2020', 'mm/dd/yyyy'), null, 2000, 0, '526-08-2323', null);
select num, totalPayment, insurancePayment from Admission where num = '08433' or num = '28192';

create or replace trigger employeeSupervisors
	before insert or update on Employee
		for each row
			declare
				pragma autonomous_transaction; /* otherwise table is mutating, not the ideal solution. */
				rank char(1);
			begin
				select empRank into rank 
				from Employee 
				where :new.supervisorID = ID;
				if (:new.empRank = '0' and rank != '1') then
					RAISE_APPLICATION_ERROR(-20004, 'Regular employees must have a supervisor (division manager).');
				end if;
				if (:new.empRank = '1' and rank != '2') then
					RAISE_APPLICATION_ERROR(-20004, 'Division managers must have a supervisor (general manager).');
				end if;
				if (:new.empRank = '2' and :new.supervisorID is not null) then
					RAISE_APPLICATION_ERROR(-20004, 'General managers must not have a supervisor.');
				end if;
			commit;
			end;
			/

update Employee set empRank = '1' where id = '33070587';
insert into Employee values ('281826431', 'Gustav', 'Holst', 95000, 'Administrative Assistant', 201, '1', '38283678');

create or replace trigger emergencyFutureVisit
	after insert on StayIn
		for each row
			declare
				admissionDate date;
			begin
				select admissionDate into admissionDate from RoomService R
				where :new.roomNum = R.roomNum and R.service = 'emergency';
				update Admission set futureVisit = ADD_MONTHS(admissionDate, 2) where num = :new.admissionNum;
			end;
			/
            
delete from StayIn where admissionNum = '184231';
delete from Admission where num = '184231';
insert into Admission values ('184231', to_date('02/01/2020', 'mm/dd/yyyy'), null, 1000, 0, '111-22-3333', null);
insert into StayIn values('184231', 102, to_date('02/01/2020', 'mm/dd/yyyy'), null);
select num, admissionDate, futureVisit from Admission where num = '184231';

create or replace trigger equipmentTypeYear
	before insert or update on Equipment
		for each row
			declare
				descrip varchar2(256);
			begin
				select description into descrip from EquipmentType ET
					where ET.ID = :new.typeID;
				if((descrip = 'CT Scanner' or descrip = 'Ultrasound') and (:new.purchaseYear is null or :new.purchaseYear < 2006)) then
					RAISE_APPLICATION_ERROR(-20004, 'CT scanners and ultrasound must be purchased after 2006.');
				end if;
			end;
			/

delete from Equipment where serialNum = '821637862131';
delete from Equipment where serialNum = '969716298312';
insert into Equipment values('821637862131', '78692186', '2002', to_date('07-03-2010','mm-dd-yyyy'), 109);
insert into Equipment values('969716298312', '84673823', null, to_date('07-03-2010','mm-dd-yyyy'), 109);

/* Assumption: There can only be one Examination for each Admission. If another dr will see the patient
 * on the same date (another Examination), then a new Admission needs to be made.
 */
create or replace trigger leaveHospital
	after update of leaveDate on Admission
	for each row
		declare
			pFName varchar2(64);
			pLName varchar2(64);
			address varchar2(128);
			dFName varchar2(64);
			dLName varchar2(64);
			dr_comment varchar2(256);
		begin
			select P.fName, P.lName, address, D.fName, D.lName, dr_comment 
			into pFName, pLName, address, dFName, dLName, dr_comment from Patient P, Examine E, Doctor D
			where :new.patientSSN = P.SSN and :new.num = E.admissionNum and E.doctorID = D.ID;
			if(:new.leaveDate is not null) then
				DBMS_OUTPUT.PUT_LINE('Patient: ' || pFName || ' ' || pLName);
				DBMS_OUTPUT.PUT_LINE('Patient address: ' || address);
				DBMS_OUTPUT.PUT_LINE('Doctor: ' || dFName || ' ' || dLName);
				DBMS_OUTPUT.PUT_LINE('Doctor comments: ' || dr_comment);
			end if;
		end;
		/

update Admission set leaveDate = to_date('03/01/2020', 'mm/dd/yyyy') where num = '10244';