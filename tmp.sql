drop table if exists posts;

create table posts (
  id int unsigned primary key auto_increment,
  title varchar(255),
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update currentstamp,
);

insert into posts (title) values ('title1');
insert into posts (title) values ('title2');
insert into posts (title) values ('title3');

select * from posts;

update posts set title = 'update title' where id = 2;

select * from posts;
