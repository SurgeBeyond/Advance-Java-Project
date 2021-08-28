1. change the root password, if forgot
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
    Save the above sql in mysql-init.txt
    Run it 
    C:\> cd "C:\Users\X012939\scoop\apps\mysql\8.0.21\bin"
    C:\> mysqld --init-file=C:\\mysql-init.txt
    change the path of mysql-init.txt if required

2. create schema qasurgetechnologies; 
3. create table user (uid int(12) auto_increment primary key not null, name varchar(100) not null , email varchar(200), password varchar(200), gender varchar(10));
4. show tables;
5. describe user;
6. insert into user (name, email, password, gender) values('a', 'a@gmail.com', 'a', 'm');


