
use pharmacy_2;
Go


 create table medicine
(med_id         int               not null,
med_category    varchar(30)       not null,
name            varchar(30)       not null ,
description     text              not null ,
production_date varchar(10)       not null,
expiration_date varchar(10)       not null,
price           decimal(10,2)  not null ,
constraint med_id_pk primary key(med_id));

 insert into  medicine 
 values (1,'ant_ibiotic','ospen','syrup','2019_05_01','2021_05_01',50.5),
       (2,'ant_ibiotic', 'azithromycin','pills','2019_06_02','2020_06_01',79.0),
	   (3,'anti_inflammatory','ibuprofen','pills','2020_07_05','2022_06_05',23.75),
	   (4,'anti_inflammatory','naproxen','vaccines','2019_07_05','2023_07_05',45.5),
	   (5,'anti_fungal','miconazole','ointment','2019_08_05','2022_07_05',98.5),
	   (6,'anti_fungal','miconazole','ointment','2020_09_05','2024_09_05',65.75),
	   (7,'anti_fungal','miconazole','ointment','2021_09_05','2024_09_05',67.5),
	   (8,'anti_fungal','fluconazole','pills','2022_03_01','2025_03_09',28.0),
	   (9,'anti_allergic','zetric','pills','2020_02_05','2023_02_05',145.5),
	   (10,'anti_allergic','optivar','eye drops','2022_02_05','2026_06_05',79.5),
	   (11,'anti_anaemic','erex','vaccines','2021_04_05','2023_04_05',72.0),
	   (12,'anti_anaemic','vidaza','pills','2022_04_05','2025_09_05',85.75),
	   (13,'pain killer','panadol','pills','2019_05_05','2021_09_05',99.9),
	   (14,'pain killer','voltareen','vaccines','2020_07_05','2023_09_05',67.5),
	   (15,'pain killer','cataflam','pills','2021_09_03','2024_09_05',12.5),
	   (16,'narcotic','ledokayeen','ointment','2020_08_05','2023_08_05',45.75),
       (17,'tonic','betoflex','pills','2021_04_05','2025_04_05',23.5);

       select *from  medicine ;



 create table customers
(cust_id    int         not null,
fname       varchar(10) not null,
lname       varchar(10) not null,
gender      char        not null,
age         int         not null,
cust_email  text ,
cust_phone  varchar(15) not null,
contact_address varchar(30),
constraint cust_id_pk primary key (cust_id));


  insert into customers 
  values (1,'ahmed','mostafa','M',26,NULL,'01012345685','awsim_giza'),
         (2,'mohammad','ali','M',45,NULL,'01145688457',NULL),
		 (3,'aya','ahmwd','F',20,NULL,'0124569874',NULL),
		 (4,'ali','amin','M',50,'aliamin123@gmail.comm' ,'01547896415',NULL),
		 (5,'hossam','amer','M',18,NULL,'01245879125',NULL),
		 (6,'eman','mostafa','F',25,'emanmostafa235@gmail.com','01147895645',NULL),
		 (7,'esraa','amad','F',30,NULL,'01001234547',NULL),
		 (8,'amal','naser','F',24,NULL,'01230458745',NULL),
		 (9,'abderahman','mahmoud','M',36,'abdomo456@gmail.com','011102458789',NULL),
		 (10,'asmaa','amin','F',40,'asmaaamin789@gmail.com','01548962304',NULL);

		 select *from  customers ;



 create table  purchasing
(purchase_id int not null,
cust_id int   not null,
med_id  int   not null,
amount  int   not null,
date    varchar(10)  not null,
constraint purch_pk primary key (purchase_id));
 alter table purchasing 
 add constraint med_id_fk foreign key (med_id) references medicine (med_id)
 alter table purchasing
 add constraint cust_id_fk foreign key (cust_id)references customers(cust_id)

 insert into purchasing
 values (1,2,5,1,'2022_01_06'),
        (2,3,4,2,'2022_01_23'),
		(3,5,6,3,'2022_02_02'),
		(4,8,10,4,'2022_03_10'),
		(5,6,1,1,'2022_04_20');

	    select *from purchasing  ;



 create table pharmacist
(phar_id          int         not null,
fname             varchar(10) not null,
lname             varchar(10) not null,
gender            char        not null,
age               int         not null,
phar_email        text,
phar_phone        varchar(15) not null,
contact_address   varchar(30),
constraint phar_id_pk primary key (phar_id));


 insert into pharmacist
 values (1,'mostafa','amin','M',30,'mosamin123@gmail.com','01022558836','giza'),
        (2,'asmaa','ali','F',27,'asmaaali456@gmail.com','01114455889','giza'),
		(3,'mohammad','ahmad','M',24,'moahmed789@gmail.com','01004789653','giza'),
		(4,'ola','nasser','F',23,'olanasser852@gmail.com','01245789638','giza');

	     select *from pharmacist  ;


 create table sales
 (sales_id      int not null,
 phar_id        int not null,
 cust_id        int not null,
 med_id         int not null,
 count          int not null,
 purchase_id    int not null,
 date           varchar(15) not null,
constraint sales_id_pk primary key(sales_id));
 alter table sales
 add constraint phar_id_fk foreign key (phar_id) references pharmacist(phar_id)
  alter table sales
add constraint cust_sal_id_fk foreign key (cust_id) references customers(cust_id)
 alter table sales
add constraint med_sal_id_fk foreign key (med_id) references medicine(med_id)
 alter table sales
add constraint purch_sal_id_fk foreign key (purchase_id) references  purchasing (purchase_id)

  
  insert into sales
  values (1,2,2,5,1,1,'2022_01_20'),
         (2,4,3,4,5,2,'2022_01_25'),
		 (3,2,5,6,3,3,'2022_02_20'),
		 (4,3,8,10,5,4,'2022_03_20'),
		 (5,1,6,1,4,5,'2022_04_25');

		 select *from sales;



 create table reports
(report_id   int not null,
sales_id     int not null,
cust_id      int not null,
purchase_id  int not null,
date         varchar(15) not null,
 constraint report_id_pk primary key(report_id));
  alter table reports
 add constraint purch_rep_id_fk foreign key (purchase_id) references  purchasing (purchase_id)
   alter table reports
 add constraint cust_rep_id_fk foreign key (cust_id) references customers(cust_id)
    alter table reports
add constraint sales_id_fk foreign key (sales_id) references sales(sales_id)

insert into reports
values (1,1,2,1,'2022_01_20'),
       (2,2,3,2,' 2022_01_25'),
	   (3,3,5,3,'2022_02_20'),
	   (4,4,8,4,'2022_03_20'),
	   (5,5,6,5,'2022_04_25');
  
       select*from  reports;



