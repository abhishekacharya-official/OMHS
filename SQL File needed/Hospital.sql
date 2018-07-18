drop database omhs;
create database omhs;
use omhs;
create table patient_login(
p_id varchar(15) not null,
p_email varchar(90) not null,
p_salt varchar(100) not null,
p_pass varchar(100) not null,
p_dor timestamp,
p_cnfrm_status tinyint);


alter table patient_login
add constraint pk_patient_login primary key (p_id);

ALTER TABLE patient_login
ADD CONSTRAINT uk_p_email UNIQUE (p_email);

create table patient_details(
p_id varchar(15) not null,
p_f_name varchar(30) not null,
p_l_name varchar(30) not null,
p_age int not null,
p_gender varchar(10) not null,
p_contact varchar(20) not null,
p_addr varchar(500) not null,
p_blood_group varchar(5) not null,
p_h_ft int not null,
p_h_in int not null,
p_weight int not null);


alter table patient_details
add FOREIGN KEY (p_id) REFERENCES patient_login(p_id);

create table hospital_login(
h_id varchar(15) not null,
h_regis varchar(50) not null,
h_email varchar(90) not null,
h_salt varchar(100) not null,
h_pass varchar(100) not null,
h_dor datetime,
h_cnfrm_status tinyint,
h_avail tinyint);


alter table hospital_login
add constraint pk_hospital_login primary key (h_id);

ALTER TABLE hospital_login
ADD CONSTRAINT uk_hospital_login UNIQUE (h_email);

ALTER TABLE hospital_login
ADD CONSTRAINT uk_hospital_login_reg UNIQUE (h_regis);


create table hospital_details(
h_id varchar(15) not null,
h_name varchar(100) not null,
h_contact varchar(20) not null,
h_addr varchar(500) not null,
h_state varchar(50) not null,
h_city varchar (50) not null);

alter table hospital_details
add FOREIGN KEY (h_id) REFERENCES hospital_login(h_id);

create table department(
d_id varchar(60) not null,
d_name varchar(60));

alter table department
add constraint pk_department primary key (d_id);

insert into department (d_id, d_name) values 
('Cardiology','Cardiology'),('Dentistry','Dentistry'),('Dermatology','Dermatology'),('ENT','ENT'),('General Surgery','General Surgery'),('Medicine','Medicine'),('Neurology','Neurology'),('OG','Obstetrics&Gynaecology'),('Ophthalmology','Ophthalmology'),('Orthopaedics','Orthopaedics'),('Paediatrics','Paediatrics'),('Psychiatry','Psychiatry');

create table doctor_details (
doc_h_id varchar(15) not null,
doc_id varchar(15) not null,
doc_name varchar(60) not null,
doc_salt varchar(100) not null,
doc_pass varchar(100) not null,
doc_dept_id varchar(15) not null,
doc_contact varchar(20) not null,
doc_email varchar(60) not null,
doc_n_appt tinyint,
doc_avail tinyint);


alter table doctor_details
add constraint pk_doctor_details primary key (doc_id);

alter table doctor_details
add FOREIGN KEY (doc_h_id) REFERENCES hospital_login(h_id) ;

alter table doctor_details
add FOREIGN KEY (doc_dept_id) REFERENCES department(d_id) ;

create table visiting(
v_app_id int not null auto_increment primary key,
v_h_id varchar(15) not null,
v_p_id varchar(15) not null,
v_doc_id varchar(15) not null,
v_d_id varchar(50) not null,
v_booking_date date not null,
v_app_date date not null,
v_name varchar(30) not null,
v_age int not null,
v_gender varchar(10) not null,
v_contact varchar(20) not null,
v_addr varchar(500) not null,
v_blood_group varchar(5) not null,
v_h_ft int not null,
v_h_in int not null,
v_weight int not null);

alter table visiting auto_increment=1000;

/*alter table visiting
add constraint pk_visiting primary key (v_app_id);*/

alter table visiting
add FOREIGN KEY (v_h_id) REFERENCES hospital_login(h_id) ;

alter table visiting
add FOREIGN KEY (v_p_id) REFERENCES patient_login(p_id);

alter table visiting
add FOREIGN KEY (v_d_id) REFERENCES department(d_id) ;

alter table visiting
add FOREIGN KEY (v_doc_id) REFERENCES doctor_details(doc_id);

create table prescription(
pres_id int not null auto_increment primary key,
pres_p_id varchar(15) not null,
pres_h_id varchar(15) not null,
pres_d_id varchar(15) not null,
pres_doc_id varchar(15) not null,
pres_app_id int not null,
pres_diagnosis varchar(200) not null);

alter table prescription auto_increment=1000;

/*alter table prescription
add constraint pk_prescription primary key (pres_id);*/

alter table prescription
add FOREIGN KEY (pres_p_id) REFERENCES patient_login(p_id);

alter table prescription
add FOREIGN KEY (pres_h_id) REFERENCES hospital_login(h_id);

alter table prescription
add FOREIGN KEY (pres_d_id) REFERENCES department(d_id) ;

alter table prescription
add FOREIGN KEY (pres_doc_id) REFERENCES doctor_details(doc_id) ;

alter table prescription
add FOREIGN KEY (pres_app_id) REFERENCES visiting(v_app_id);

create table prescription_table(
pres_id int not null,
pres_medicine varchar(200) not null,
pres_med_dose varchar(100) not null,
pres_med_days varchar(50) not null);

alter table prescription_table
add FOREIGN KEY (pres_id) REFERENCES prescription(pres_id);

create table p_check(
p_id varchar(15),
p_code int);

alter table p_check
add FOREIGN KEY (p_id) REFERENCES patient_login(p_id);


create table h_check(
h_id varchar(15),
h_code int);

alter table h_check
add FOREIGN KEY (h_id) REFERENCES hospital_login(h_id);

create table p_f_check(
p_id varchar(15),
p_code INT);

alter table p_f_check
add FOREIGN KEY (p_id) REFERENCES patient_login(p_id);

create table h_f_check(
h_id varchar(15),
h_code INT);

alter table h_f_check
add FOREIGN KEY (h_id) REFERENCES hospital_login(h_id);

/*end*/
drop table visiting;


update patient_login set p_cnfrm_status=1 where p_id='dineshp';
select * from hospital_details;

insert into patient_login (p_cnfrm_status) values (1) where p_id='dinesh';

select p_date from p_check ;
select * from patient_login;
select * from hospital_login;
update patient_login set p_cnfrm_status=1 where p_id='dinesh'
select v_app_id,v_p_id,v_doc_id,v_name,v_age,v_gender,v_contact,v_addr from visiting where v_h_id='DineshHospital' and v_app_date='2017-03-23' and v_d_id='cardiology'

select * from visiting join hospital_details join doctor_details on visiting.v_h_id=hospital_details.h_id=doctor_details.doc_h_id where visiting.v_p_id='dinesh'

select v_app_id, v_name,v_p_id from visiting where v_app_date='2017-04-05';

select p_id, p_email, p_salt, p_pass from patient_login where p_id = ' dinesh' OR p_email='dineshpanda@hotmail.com' and p_cnfrm_status=0
select * 