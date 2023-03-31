create database hospital;

use hospital;

--doctor details table--
create table doctor(
doctor_id int primary key identity,
First_name varchar(50), 
last_name varchar(50),
email varchar(50),
phone varchar(50),
specialization varchar(50),
);
/*data in doctor table*/
 insert into doctor
 values ('Javed','Khan','javedkhan@gmail.com',3025264641,'Dentist'),
 ('Sarah','khan','sarakhan@gamil.com',125746734, 'Skin specialist'),
 ('Maryam', 'Jabbar','maryam@gamil.com', 0303178758,'Cardiologist'),
 ('Maheen', 'Ahmed','Maheenahmed@yahoo.com',03332764321,'Gynecologists'),
 ('Fizza', 'Malik', 'fizzamalik@gmail.com', 03217676766,'Psychologists'),
 ('Ebad', 'Khan', 'ebadkhan@yahoo.com',0311564321,'Child Specialist');


/*patient details table*/
create table patient(
patient_id int primary key identity(100,1),
first_name varchar(50),
last_name varchar(50),
phone varchar (50),
email varchar(50),
gendar varchar(50),
age int
);
/*data in patient table*/
insert into patient
 values ('Taba','Sualeh',1231234,'taba@yahoo.com','Male',22),
 ('Tanzeela','Jabbar',125746734,'tanzeela@gmail.com','Female',23),
 ('Esha','Asif',45671233,'esha@gamil.com','Female',21),
 ('Abdul','Ebad',0343212341,'abdulEbad@yahoo.com','Male',19),
 ('Malaika','Amjad',03001234444,'Malaika@gmail.com','Female',17),
 ('Irshad','Khan', 0314654321,'Irshadkhan@yahoo.com','Male',35);


/*doctor schedule table*/
create Table schedule(
schedule_id int primary key identity(50,1),
S_StartTime time,
S_EndTime time,
doctor_id int ,
foreign key (doctor_id) references doctor (doctor_id),
S_shift varchar(10),
S_Break time,
S_Day varchar(10),
Availibilty bit,
);
ALter table schedule
alter column S_Break time(0) not null;   


/*data in schedule table*/
insert into schedule
values ('10:00:00', '05:00:00', 3, 'Night', '02:00:00', 'Monday', 1),
('09:00:00', '01:00:00', 4, 'Night', '12:00:00', 'Friday', 0),
('08:00:00', '01:00:00', 5,'Day', '12:00:00', 'Saturday',1),
('06:00:00', '12:00:00', 6, 'Night', '10:00:00','Sunday',0);

/*patient appointment table*/
create Table appointment(
appointment_id int primary key identity,
appointment_time Time,
visit_reason text,
patient_id int,
foreign key (patient_id) references patient (Patient_id),
doctor_id int,
foreign key (doctor_id) references doctor (doctor_id),
schedule_id int,
foreign key (schedule_id) references schedule (schedule_id),
appoint_date date,
appoint_status varchar(10),
);

alter table appointment
alter column appointment_time time(0) not null;

/*data in appointment table*/
insert into appointment
values('01:30:00','Toothache',100,1,52,'2023-01-21','Completed'),
('03:00:00','Skin Allergy',101 ,2,54,'2023-02-01','Scheduled' ),
('11:00:00','Routine checkup', 102,3,55,'2023-01-29', 'Cancelled'),
('09:30:00','Flu Symptons', 103,4,56,'2022-12-12','completed'),
('10:00:00','Back pain',104 ,5,57,'2023-02-10','Scheduled'),
('08:00:00','Fever',105 ,6,58,'2023-01-05','Completed');




/* patient medical record table*/
create Table medical_record(
medicalRecord_id int primary key identity,
patient_id int ,
foreign key (patient_id) references patient (patient_id),
doctor_id int,
foreign key (doctor_id) references doctor (doctor_id),
appointment_id int,
foreign key (appointment_id) references appointment (appointment_id),
diagnosis varchar(50),
mr_date date,
treatment varchar(70),
); 

insert into medical_record
values (100,1,1,'Cavity','2023-01-25','Surgery'),
(101,2,1,'Rash','2023-02-16','Rash tube'),
(102,3,1,'Cough','2023-01-21','Cough syrup'),
(103,4,1,'flu','2022-12-20','Antibiotics'),
(104,5,1,'Muscle Demage','2023-02-21','Surgery'),
(105,6,1,'fever','2023-01-15','Antibiotics');

/* billing table */
create Table billing(
bill_id int primary key identity,
patient_id int,
foreign key (patient_id) references patient (patient_id),
doctor_id int,
foreign key (doctor_id) references doctor (doctor_id),
appointment_id int,
foreign key (appointment_id) references appointment (appointment_id),
total_amount int,
bill_date date,
pay_status bit ,
pay_method varchar(10),
);

insert into billing
values(100,1,1,1000,'2023-01-21',1,'cash'),
(101,2,2,500,'2023-02-01',0,'credit'),
(102,3,3,2000,'2023-01-29',0,'credit'),
(103,4,4,700,'2022-12-12',1,'cash'),
(104,5,5,3500,'2023-02-10',0,'credit'),
(105,6,6,1500,'2023-01-05',1,'cash');


select* from doctor;
select* from patient;
select* from appointment;
select* from billing;
select* from medical_record;
select* from schedule;

