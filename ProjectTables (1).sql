-- Create the tables for the database
create table Author
(AuthorID char(5) primary key,
PublisherID char(5),
FirstName varchar(20),
LastName varchar(25)
);

create table Title 
(BookID char(13) primary key,
AuthorID char (5) not null,
BookName varchar(30) not null,
GenreID char(2),
PageCount varchar(4),
SeriesName varchar(30),
Price decimal(4,2)
);

create table AuthorTitle
(AuthorID char(5),
BookID char(13),
primary key (AuthorID,BookID)
);

create table Publisher
(PublisherID char(5) primary key,
PublisherName varchar(25),
PubAddress varchar(25),
PubState char(2),
PubCountry varchar(25),
PubCity varchar(25)
);

create table Genre
(GenreID char(2) primary key,
GenreName varchar(15)
);

create table Customer
(CustomerID	char(5) primary key,
FirstName varchar(25),
LastName varchar (30),
Email varchar(30),
Address	varchar(30),
City varchar (20),
State char(2),
Country	varchar(20)
);

create table Orders
(OrderID varchar(6),
OrderDate date,	
BookID char(13),
CustomerID char(5),
primary key(OrderID,BookID)
);

-- add the foreign keys to the tables

alter table Title add foreign key (AuthorID) references Author(AuthorID);
alter table Title add foreign key (GenreID) references Genre(GenreID);
alter table Author add foreign key (PublisherID) references Publisher(PublisherID);
alter table Orders add foreign key (CustomerID) references Customer(CustomerID);

-- add data to each table

insert into Genre values ('01', 'Fantasy');
insert into Genre values ('02', 'Romance');
insert into Genre values ('03', 'Sci-Fi');
insert into Genre values ('04','Thriller');
alter table Genre modify GenreName varchar(20); -- had to change the size of varchar to fit historical fiction
insert into Genre values('05', 'Historical Fiction');
insert into Genre values('06','Horror');

insert into Publisher values ('23455','Harper Collins','195 Broadway','NY','United States','New York');
insert into Publisher values ('44352','Brillance Publishing','1704 Eaton Dr','MI','United States','Grand Haven');
insert into Publisher values ('52235','Macmillian Publishing','120 Broadway','NY','United States','New York');
insert into Publisher values ("12345","St.Marten's Press",'175 Fifth Avenue','NY','United States','New York');
alter table Publisher modify PubAddress varchar(30); -- had to change varchar of PubAddress
insert into Publisher values ('99945','Doubleday','1745 Broadway','NY','United States','New York');
insert into Publisher values ('34545','Hachette Book Group','120 Avenue of the Americas','NY','United States','New York');
insert into Publisher values ('55555','Scribner','1230 Avenue of the Americas','NY','United States','New York');
insert into Publisher values ('13657','Penguin Random House','1745 Broadway','NY','United States','New York');
insert into Publisher values ('23456','Dutton Publishing','1745 Broadway','NY','United States','New York');
insert into Publisher values ('44455','Little,Brown, and Company','1290 Avenue of the Americas','NY','United States','New York');
insert into Publisher values('65832','Creature Publishing', null,'VA','United States','Charlottesville');

insert into Author values ('54326','23455', 'Sarah A.','Parker');
insert into Author values ('35555','44352', 'Rebbeca','Yarros');
insert into Author values ('66645','52235', 'Yume','Kitasei');
insert into Author values ('45666','52235', 'Kate Alice','Marshall');
insert into Author values ('97525','12345', 'Kristin','Hannah');
insert into Author values ('00001','99945', 'Stephen','King');
insert into Author values ('88889','13657', 'Emily','Henry');
insert into Author values ('22224','34545', 'Racheal','Gilling');
insert into Author values ('65656','23456', 'Riley','Sager');
insert into Author values ('76968','44455', 'Kalie','Cassidy');
insert into Author values ('98564','65832', 'Tatiana','Schlote-Bonne');

insert into Title values ('9780063415805', '54326', 'When the Moon Hatched','01','718','Moonfall','32.00');
insert into Title values ('9781662511561', '35555', 'In the Likely Event','02','348', null,'16.99');
insert into Title values ('9781250875334', '66645', 'The Deep Sky','03','399', null,'18.99');
insert into Title values ('9781250343055', '45666', 'A Killing Cold','04','219', null,'28.99');
insert into Title values ('9780312577223', '97525', 'The Nightingale','05','440', null,'32.00');
insert into Title values ('9780450040184', '00001', 'The Shining','06','447','The Shining','17.00');
insert into Title values ('9780316312486', '22224', 'One Dark Window','01','432','The Shepard King','18.99');
insert into Title values ('9781951971304', '98564', 'The Mean Ones','06','272', null,'18.95');
insert into Title values ('9780593441213', '88889', 'Funny Story','02','395', null,'14.25');
insert into Title values ('9780593472378', '65656', 'In the Middle of the Night','04','378', null,'30.00');
insert into Title values ('9780316587600', '76968', 'In the Veins of the Drowning','01','384','The Siren Mage','14.99');

insert into AuthorTitle values('54326', '9780063415805');
insert into AuthorTitle values('35555', '9781662511561');
insert into AuthorTitle values('66645', '9781250875334');
insert into AuthorTitle values('45666', '9781250343055');
insert into AuthorTitle values('97525', '9781250343055');
insert into AuthorTitle values('00001', '9780450040184');
insert into AuthorTitle values('22224', '9780316312486');
insert into AuthorTitle values('98564', '9781951971304');
insert into AuthorTitle values('88889', '9780593441213');
insert into AuthorTitle values('65656', '9780593472378');
insert into AuthorTitle values('76968','9780316587600');

insert into Customer values('11111','Emma','Thompson','booklover@books.com','123 Main Street','Morristown','NJ','United States');
insert into Customer values('55557','Michael', 'Rodriguez','michealrod@books.com','12 Oak Road','Fort Lauderdale','FL','United States');
insert into Customer values('88867','Lukas', 'Schmidt','lukasschmidt@books.com','49 Smallman Street','Pittsburgh','PA','United States');
insert into Customer values('65167','Olivia', 'Johnson','livjohnson@books.com', '12 Dover Chester Road','Randolph', 'NJ','United States');
insert into Customer values('16849','Savannah', 'Laha','savannahlaha@books.com','24 College Street','Toronto','ON','Canada');
insert into Customer values ('61655','Brooke', 'Pantone','brookepantone@books.com','65 SW Washington Street','Portland','OR','United States');
insert into Customer values('65265','Gabriel', 'Nicholas','gabenicholas@books.com','55 Terminal Ave','Vancouver','BC','Canada');
insert into Customer values('51515','Wyatt', 'Holtzman','wyattlovesbooks@books.com','25 Maryland Ave','Atlantic City','NJ','United States');

insert into Orders values('333444','2025-06-25','9780316587600','11111');
insert into Orders values('333444','2025-06-25','9780063415805','11111');
insert into Orders values('444333','2025-01-01','9781951971304','55557');
insert into Orders values('444555','2024-12-24','9780450040184','55557');
insert into Orders values('888444','2025-04-09','9780593441213','65167');
insert into Orders values('888444','2025-04-09','9781662511561','65167');
insert into Orders values('555666','2025-07-06','9780593472378','16849');
insert into Orders values('999999','2024-12-09','9781250875334','61655');
insert into Orders values('999888','2025-05-09','9781250343055','65265');
insert into Orders values('222345','2025-06-06','9780312577223','51515');
insert into Orders values('222345','2025-06-06','9780316312486','51515');
insert into Orders values('777555','2025-08-02','9780063415805','16849');