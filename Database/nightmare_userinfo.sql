create table userinfo(
e_mail char(40) primary key not null,
userName char(40) unique not null,
password char(64) not null
);
 