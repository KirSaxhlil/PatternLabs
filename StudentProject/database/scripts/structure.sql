create table if not exists Student (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
	name varchar(20) not null,
	family	varchar(20) not null,
	patronymic varchar(20) not null,
	git	varchar(50) null,
	phone_number varchar(12) null,
	telegram varchar(30) null,
	email varchar(50) null
);