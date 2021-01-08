create table Personne (
 PersonneID int NOT NULL Identity(1,1),
 Nom varchar(255) not null,
 Prenom varchar(255) not null,
 Adresse varchar(255) not null,
 Adresse1 varchar(255),
 CodePostal char(5) not null,
 Ville varchar(255) not null,
 Pays char(2) not null,
 Courriel varchar(255) not null,
 Telephone varchar(11) not null,
 DateNaissance date not null,
 Photo image
 constraint UC_PersonneID unique (PersonneID)
);
alter table Personne add constraint PK_PersonneID Primary key (PersonneID);

create table CentreInterets (
CentreInteretID int not null,
Libelle varchar(255) not null
constraint UC_CentreInteretID unique (CentreInteretID)
);
alter table CentreInterets add constraint PK_CentreInteretID primary key (CentreInteretID);

create table PersonneCentreInterets (
CentreInteretID int not null,
PersonneID int not null,
constraint UC_CentreInteretID_PersonneID unique (CentreInteretID,PersonneID)
);
alter table PersonneCentreInterets add constraint PK_CentreInteretID_PersonneID primary key (CentreInteretID,PersonneID);
alter table PersonneCentreInterets add constraint FK_CentreInteretID Foreign key (CentreInteretID) references CentreInterets(CentreInteretID); 
alter table PersonneCentreInterets add constraint FK_PersonneID Foreign key (PersonneID) references Personne(PersonneID); 
