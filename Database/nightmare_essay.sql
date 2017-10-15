use nightmare;

create table essay (
    number int primary key not null AUTO_INCREMENT,
    series char(40),
    title char(255),
    text text(65535)
);

create table message (
    number int primary key not null AUTO_INCREMENT,
    e_mail char(40),
    signed boolean,
    text text(65535)
);

select * from message;

drop table message;