/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022/11/20 1:45:21                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists applying;

drop table if exists appointment;

drop table if exists normalUser;

drop table if exists ordering;

drop table if exists organization;

drop table if exists recruitBoard;

drop table if exists time;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   adminId              int not null,
   adminName            varchar(50),
   adminPwd             varchar(50),
   primary key (adminId)
);

/*==============================================================*/
/* Table: applying                                              */
/*==============================================================*/
create table applying
(
   applyId              int not null,
   nUserId              int not null,
   recruitId            int not null,
   primary key (applyId)
);

/*==============================================================*/
/* Table: appointment                                           */
/*==============================================================*/
create table appointment
(
   appointId            int not null,
   orgId                int not null,
   timeId               int not null,
   totalPlaces          int not null,
   occupyPlaces         int not null,
   primary key (appointId)
);

/*==============================================================*/
/* Table: normalUser                                            */
/*==============================================================*/
create table normalUser
(
   nUserId              int not null,
   nUserName            varchar(50) not null,
   nUserPwd             varchar(50) not null,
   sex                  varchar(10),
   userPhone            varchar(20) not null,
   totalTime            float not null,
   primary key (nUserId)
);

/*==============================================================*/
/* Table: ordering                                              */
/*==============================================================*/
create table ordering
(
   orderId              int not null,
   appointId            int not null,
   nUserId              int not null,
   primary key (orderId)
);

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   orgId                int not null,
   orgName              varchar(50) not null,
   orgPwd               varchar(50) not null,
   address              varchar(255) not null,
   orgPhone             varchar(20),
   introduction         varchar(255),
   feature              varchar(255),
   orgClickNum          int,
   serveClickNum        char(10),
   primary key (orgId)
);

/*==============================================================*/
/* Table: recruitBoard                                          */
/*==============================================================*/
create table recruitBoard
(
   recruitId            int not null,
   timeId               int not null,
   orgId                int not null,
   titile               varchar(255),
   content              varchar(255) not null,
   serveAddress         varchar(255) not null,
   primary key (recruitId)
);

/*==============================================================*/
/* Table: time                                                  */
/*==============================================================*/
create table time
(
   timeId               int not null,
   timeStart            timestamp not null,
   timeEnd              timestamp not null,
   primary key (timeId)
);

alter table applying add constraint FK_Relationship_7 foreign key (nUserId)
      references normalUser (nUserId) on delete restrict on update restrict;

alter table applying add constraint FK_Relationship_8 foreign key (recruitId)
      references recruitBoard (recruitId) on delete restrict on update restrict;

alter table appointment add constraint FK_Relationship_3 foreign key (timeId)
      references time (timeId) on delete restrict on update restrict;

alter table appointment add constraint FK_Relationship_4 foreign key (orgId)
      references organization (orgId) on delete restrict on update restrict;

alter table ordering add constraint FK_Relationship_10 foreign key (appointId)
      references appointment (appointId) on delete restrict on update restrict;

alter table ordering add constraint FK_Relationship_9 foreign key (nUserId)
      references normalUser (nUserId) on delete restrict on update restrict;

alter table recruitBoard add constraint FK_Relationship_11 foreign key (timeId)
      references time (timeId) on delete restrict on update restrict;

alter table recruitBoard add constraint FK_Relationship_12 foreign key (orgId)
      references organization (orgId) on delete restrict on update restrict;

