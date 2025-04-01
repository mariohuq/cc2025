-- create database tasks;

create table if not exists owner
( owner_id integer generated always as identity primary key
, telegram_id integer
);

create table if not exists task
( task_id integer generated always as identity primary key
, owner_id integer references owner (owner_id) on delete restrict on update restrict
, summary text
, deadline timestamp with time zone
, status integer
, estimated_time interval
, spent_time interval
);

create table if not exists recurring_task
( recurring_task_id integer generated always as identity primary key
, owner_id integer references owner (owner_id) on delete restrict on update restrict
, summary text
, start timestamp with time zone
, period interval
, finish timestamp with time zone
, status integer
);