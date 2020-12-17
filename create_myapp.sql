drop database if exists myapp;
create database myapp;
create user myapp_user@localhost identified by 'pass';
grant all on myapp.* to myapp_user@localhost;
