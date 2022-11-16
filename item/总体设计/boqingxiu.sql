/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022/11/12 19:46:30                          */
/*==============================================================*/


drop table if exists adm;

drop table if exists applying;

drop table if exists organization;

drop table if exists organization_time;

drop table if exists time;

drop table if exists user;

drop table if exists visiting;

drop table if exists volunteer_apply;

/*==============================================================*/
/* Table: adm                                                   */
/*==============================================================*/
create table adm
(
   aid                  int not null,
   name                 varchar(50),
   password             varchar(50),
   primary key (aid)
);

/*==============================================================*/
/* Table: applying                                              */
/*==============================================================*/
create table applying
(
   ortimeId             int not null,
   userId               int not null,
   IsAttend             bool,
   primary key (ortimeId, userId)
);

/*==============================================================*/
/* Table: organization                                          */
/*==============================================================*/
create table organization
(
   orgId                int not null,
   orgName              varchar(50),
   orgPwd               varchar(50),
   address              varchar(255),
   orgPhone             varchar(20),
   introduction         varchar(255),
   feature              varchar(255),
   primary key (orgId)
);

/*==============================================================*/
/* Table: organization_time                                     */
/*==============================================================*/
create table organization_time
(
   ortimeId             int not null,
   orgId                int not null,
   timeId               int not null,
   date                 date not null,
   primary key (ortimeId)
);

/*==============================================================*/
/* Table: time                                                  */
/*==============================================================*/
create table time
(
   timeId               int not null,
   timeName             varchar(50),
   time_start           time,
   time_end             time,
   primary key (timeId)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userId               int not null,
   userName             varchar(50),
   userPwd              varchar(50),
   sex                  varchar(10),
   userPhone            varchar(20),
   totalTime            float,
   primary key (userId)
);

/*==============================================================*/
/* Table: visiting                                              */
/*==============================================================*/
create table visiting
(
   ortimeId             int not null,
   userId               int not null,
   primary key (ortimeId, userId)
);

/*==============================================================*/
/* Table: volunteer_apply                                       */
/*==============================================================*/
create table volunteer_apply
(
   vApplyId             int not null,
   orgId                int,
   userId               int,
   titile               varchar(255),
   content              varchar(255),
   primary key (vApplyId)
);

alter table applying add constraint FK_Relationship_6 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table applying add constraint FK_Relationship_7 foreign key (ortimeId)
      references organization_time (ortimeId) on delete restrict on update restrict;

alter table organization_time add constraint FK_Relationship_3 foreign key (timeId)
      references time (timeId) on delete restrict on update restrict;

alter table organization_time add constraint FK_Relationship_4 foreign key (orgId)
      references organization (orgId) on delete restrict on update restrict;

alter table visiting add constraint FK_Relationship_10 foreign key (ortimeId)
      references organization_time (ortimeId) on delete restrict on update restrict;

alter table visiting add constraint FK_Relationship_9 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table volunteer_apply add constraint FK_发布 foreign key (orgId)
      references organization (orgId) on delete restrict on update restrict;

alter table volunteer_apply add constraint FK_查看 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

