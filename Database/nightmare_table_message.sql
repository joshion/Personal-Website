SELECT * FROM nightmare.message;

drop table message;

create table message (
    number int primary key not null AUTO_INCREMENT,
    e_mail char(40),
    signed boolean,
    text text(65535)
)default charset=utf8;