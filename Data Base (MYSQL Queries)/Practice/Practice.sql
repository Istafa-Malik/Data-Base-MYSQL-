create database school;

use school;

 create table student(
    -> rollno int(11) not null primary key,
    -> sname varchar(25),
    -> fname varchar(25),
    -> class int(10));


     insert into student values(1,"Ali","Istafa",6);
     
     insert into student values(2,"Fatima","Uzair",6);

     insert into student values(3,"Usman","Hamza",6);

     insert into student values(4,"Aun","Shafqt",6);

     "FOR INSERTION"

     update student set fname="Waqas" where rollno=2;

      

update student set DOB='2004-06-08' where rollno=1;

select * from student where year(DOB)>=2000;

select guestname,guestaddress from guest where guestname LIKE "%Tony%" or guestname LIKE "%Farrel%" and guestaddress LIKE "%Glasgow" order by guestaddress desc;
"LIKE use "




"Natural Join between tow tables to find a specific thing which is not common"
select city,roomno from hotel natural join booking
    -> where hotelno='ch01';
