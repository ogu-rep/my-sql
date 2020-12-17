drop table if exists users;

create table users (
  id int unsigned primary key auto_increment,
  name varchar(255),
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update current_timestamp
);

insert into users (name) values ('name1');
insert into users (name) values ('name2');
insert into users (name) values ('name3');
