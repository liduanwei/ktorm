create extension if not exists hstore;

create table t_department(
  id serial primary key,
  name varchar(128) not null,
  location varchar(128) not null,
  "mixedCase" varchar(123)
);

create table t_employee(
  id serial primary key,
  name varchar(128) not null,
  job varchar(128) not null,
  manager_id int null,
  hire_date date not null,
  salary bigint not null,
  department_id int not null
);

create table t_metadata(
  id serial primary key,
  attrs hstore,
  numbers text[]
);

insert into t_department(name, location, "mixedCase") values ('tech', 'Guangzhou', 'one');
insert into t_department(name, location, "mixedCase") values ('finance', 'Beijing', 'two');

insert into t_employee(name, job, manager_id, hire_date, salary, department_id)
values ('vince', 'engineer', null, '2018-01-01', 100, 1);
insert into t_employee(name, job, manager_id, hire_date, salary, department_id)
values ('marry', 'trainee', 1, '2019-01-01', 50, 1);

insert into t_employee(name, job, manager_id, hire_date, salary, department_id)
values ('tom', 'director', null, '2018-01-01', 200, 2);
insert into t_employee(name, job, manager_id, hire_date, salary, department_id)
values ('penny', 'assistant', 3, '2019-01-01', 100, 2);

insert into t_metadata(attrs, numbers)
values ('a=>1, b=>2, c=>NULL'::hstore, array['a', 'b', 'c']);