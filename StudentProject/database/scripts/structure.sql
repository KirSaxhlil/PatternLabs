create table if not exists Student (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
	Name varchar(20) not null,
	Family	varchar(20) not null,
	Patronymic varchar(20) not null,
	Git	varchar(50) null,
	PhoneNumber varchar(12) null,
	Telegram varchar(30) null,
	Email varchar(50) null
);