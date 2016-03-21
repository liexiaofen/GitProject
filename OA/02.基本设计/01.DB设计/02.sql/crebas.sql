/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2015/9/7 14:22:42                            */
/*==============================================================*/
if exists (select 1
            from  sysobjects
           where  id = object_id('t_dailyplan')
            and   type = 'U')
   drop table t_dailyplan
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_dailydeviceinfo')
            and   type = 'U')
   drop table t_dailydeviceinfo
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_empinfo')
            and   type = 'U')
   drop table t_empinfo
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_nationlegalday')
            and   type = 'U')
   drop table t_nationlegalday
go
if exists (select 1
            from  sysobjects
           where  id = object_id('s_busidicttype')
            and   type = 'U')
   drop table s_busidicttype
go
if exists (select 1
            from  sysobjects
           where  id = object_id('s_busidict')
            and   type = 'U')
   drop table s_busidict
go
if exists (select 1
            from  sysobjects
           where  id = object_id('s_organize')
            and   type = 'U')
   drop table s_organize
go 
if exists (select 1
            from  sysobjects
           where  id = object_id('s_role')
            and   type = 'U')
   drop table s_role
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_event')
            and   type = 'U')
   drop table t_event
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_eventconnect')
            and   type = 'U')
   drop table t_eventconnect
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_eventdevice')
            and   type = 'U')
   drop table t_eventdevice
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_eventtime')
            and   type = 'U')
   drop table t_eventtime
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_emporg')
            and   type = 'U')
   drop table t_emporg
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_applyform')
            and   type = 'U')
   drop table t_applyform
go
if exists (select 1
            from  sysobjects
           where  id = object_id('his_applyform')
            and   type = 'U')
   drop table his_applyform
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_emprole')
            and   type = 'U')
   drop table t_emprole
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_annualvctn')
            and   type = 'U')
   drop table t_annualvctn
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_applyconnect')
            and   type = 'U')
   drop table t_applyconnect
go
if exists (select 1
            from  sysobjects
           where  id = object_id('t_ticketdetail')
            and   type = 'U')
   drop table t_ticketdetail
go
/*==============================================================*/
/* Table: s_organize                                        	*/
/*==============================================================*/
create table s_organize (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   orgcdid       		varchar(100)         not null,
   regionid				varchar(100)         null,
   orgname     			varchar(100)         null,
   orgshortname         varchar(20)          null,
   address           	varchar(255)         null,
   tel            		varchar(20)          null,
   fax           		varchar(20)          null,
   zipcode             	varchar(20)          null,
   effectivedate        date         		 null,
   sortno				varchar(10)          null,
   remark1             	varchar(255)         null,
   remark2             	varchar(255)         null
   constraint PK_S_ORGANIZE primary key nonclustered (orgcdid)
)
go
ALTER TABLE s_organize ADD  CONSTRAINT DF_s_organize_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_empinfo		                                        */
/*==============================================================*/
create table t_empinfo (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   empid                varchar(100)         not null,
   empname              varchar(255)         null,
   empenname			varchar(255)         null,
   empno                varchar(20)         null,
   workage				varchar(2)           null,
   email                varchar(100)         null,
   mobile               varchar(11)          null,
   cardno               varchar(18)          null,
   entrytime            date                 null,
   offtime              date                 null,
   sex                  varchar(1)           null,   
   status               varchar(1)           null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_T_EMPINFO primary key nonclustered (empid)
)
go
ALTER TABLE t_empinfo ADD  CONSTRAINT DF_t_empinfo_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_emporg                                               */
/*==============================================================*/
create table t_emporg (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   empid				varchar(100)         not null,
   orgcdid              varchar(100)     	 not null,
   depid				varchar(2)           null,
   posid				varchar(2)           null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_emporg primary key nonclustered (empid,orgcdid)
)
go
ALTER TABLE t_emporg ADD  CONSTRAINT DF_t_emporg_deletefg  DEFAULT '0' FOR deletefg
GO 
/*==============================================================*/
/* Table: t_annualvctn                                               */
/*==============================================================*/
create table t_annualvctn (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,   
   empid				varchar(100)         not null,
   year              	varchar(100)     	 not null,   
   legalvctn			varchar(3)           null,
   wealvctn				varchar(3)           null,
   extraworkvctn		varchar(3)           null,
   haslegalvctn			varchar(3)           null,
   haswealvctn			varchar(3)           null,
   hasextraworkvctn		varchar(3)           null,
   unlegalvctn			varchar(3)           null,
   unwealvctn			varchar(3)           null,
   unextraworkvctn		varchar(3)           null,   
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_annualvctn primary key nonclustered (empid,year)
)
go
ALTER TABLE t_annualvctn ADD  CONSTRAINT DF_t_annualvctn_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_dailydeviceinfo                                          */
/*==============================================================*/
create table t_dailydeviceinfo (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   dailydeviceid        varchar(100)         not null,
   orgcdid				varchar(100)		 null,	
   dailydevicename      varchar(100)         null,
   comment              varchar(255)         null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_T_dailyDEVICEINFO primary key nonclustered (dailydeviceid)
)
go
ALTER TABLE t_dailydeviceinfo ADD  CONSTRAINT DF_t_dailydeviceinfo_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_dailyplan                                           */
/*==============================================================*/
create table t_dailyplan (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   dailyid              varchar(100)         not null,
   empid                varchar(100)         null,
   eventid				varchar(100)         null,
   originateid			varchar(100)         null,
   dailycycle           varchar(1)           null,
   conflictflag         varchar(1)           null,
   eventtype			varchar(1)           null,
   daily                date                 null,
   dailystarthm         varchar(10)          null,
   dailystarttime		datetime			 null,
   dailyendhm           varchar(10)          null,
   dailyendtime			datetime			 null,
   title                varchar(50)          null,
   comment              varchar(255)         null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_T_DAILYPLAN primary key nonclustered (dailyid)
)
go
ALTER TABLE t_dailyplan ADD  CONSTRAINT DF_t_dailyplan_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_nationlegalday                                      */
/*==============================================================*/
create table t_nationlegalday (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   legalid              varchar(100)         not null,
   legaldate            date             	 null,
   legalyear            varchar(4)           null,
   legalmonth           varchar(2)           null,
   legalday             varchar(2)           null,	
   dayofweek            varchar(10)          null,
   weekofyear           varchar(10)          null,
   dayofyear            varchar(10)          null,
   status               varchar(1)           null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_T_NATIONLEGALDAY primary key nonclustered (legalid)
)
go
ALTER TABLE t_nationlegalday ADD  CONSTRAINT DF_t_nationlegalday_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: s_busidicttype                                        */
/*==============================================================*/
create table s_busidicttype (
   busidicttypeid       varchar(100)         not null,
   busidicttypename     varchar(100)         null,
   rank            		varchar(2)           null,
   parentid           	varchar(100)         null,
   seqno             	varchar(255)         null
   constraint PK_S_BUSIDICTTYPE primary key nonclustered (busidicttypeid)
)
go
/*==============================================================*/
/* Table: s_busidict                                        	*/
/*==============================================================*/
create table s_busidict (
   busidicttypeid       varchar(100)         not null,
   busidictid			varchar(100)         not null,
   busidictname     	varchar(100)         null,
   status            	varchar(2)           null,
   sortno           	int                  null,
   rank            		varchar(2)           null,
   parentid           	varchar(100)         null,
   seqno             	varchar(255)         null,
   filter1           	varchar(255)         null,
   filter2             	varchar(255)         null
   constraint PK_S_BUSIDICT primary key nonclustered (busidicttypeid,,busidictid)
)
go

/*==============================================================*/
/* Table: s_role                                        		*/
/*==============================================================*/
create table s_role (
	creator				varchar(100)		 null,
	createtime          datetime             null,
	updator				varchar(100)		 null,
	updatetime          datetime             null,
	exclusivefg			varchar(32)		 	 null,
	orgid				varchar(255)		 null,
	deletefg			char(1)		 		 not null,
	roleid       		varchar(100)         not null,
	rolename     		varchar(100)         null,
	roletype            	varchar(2)           null
	constraint PK_S_ROLE primary key nonclustered (roleid)
)
/*==============================================================*/
/* Table: t_event                                               */
/*==============================================================*/
create table t_event (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   eventid              varchar(100)         not null,
   originateid          varchar(100)         null,
   dailycycle           varchar(1)           null,
   eventtype			varchar(1)           null,
   eventstart           date                 null,
   eventend             date                 null,
   eventstarthm         varchar(10)          null,
   eventendhm           varchar(10)          null,
   eventstarttime       datetime             null,
   eventendtime         datetime             null,
   title                varchar(50)          null,
   comment              varchar(255)         null,
   status               varchar(1)           null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_event primary key nonclustered (eventid)
)
go
ALTER TABLE t_event ADD  CONSTRAINT DF_t_event_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_eventconnect                                        */
/*==============================================================*/
create table t_eventconnect (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   eventid              varchar(100)         not null,
   empid                varchar(100)         not null,  
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_eventconnect primary key nonclustered (eventid,empid)
)
go
ALTER TABLE t_eventconnect ADD  CONSTRAINT DF_t_eventconnect_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_eventdevice                                         */
/*==============================================================*/
create table t_eventdevice (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   eventid              varchar(100)         not null,
   dailydeviceid        varchar(100)         not null,  
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_eventdevice primary key nonclustered (eventid,dailydeviceid)
)
go
ALTER TABLE t_eventdevice ADD  CONSTRAINT DF_t_eventdevice_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_eventtime                                               */
/*==============================================================*/
create table t_eventtime (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   eventtimeid			varchar(100)         not null,
   eventid              varchar(100)         null,
   daily                date                 null,
   eventstarttime       datetime             null,
   eventendtime         datetime             null,
   remark1              varchar(255)         null,
   remark2              varchar(255)         null,
   remark3              varchar(255)         null,
   constraint PK_t_eventtime primary key nonclustered (eventtimeid)
)
go
ALTER TABLE t_eventtime ADD  CONSTRAINT DF_t_eventtime_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_applyform		                                    */
/*==============================================================*/
create table t_applyform (
	creator				varchar(100)		 null,
	createtime          datetime             null,
	updator				varchar(100)		 null,
	updatetime          datetime             null,
	exclusivefg			varchar(32)		 	 null,
	orgid				varchar(255)		 null,
	deletefg			char(1)		 		 not null,
	applyid             varchar(100)         not null,
	sourceid            varchar(100)         null,   
	applyno				Varchar(30)         null, 
	applyempid			Varchar(100)         null, 
	processempid		Varchar(100)         null,
	processtime			datetime             null,
	managercheckid		Varchar(100)         null,
	managerorgcdid		Varchar(100)         null,			
	managerdepid		Varchar(100)         null,
	personnelcheckid	Varchar(100)         null,
	personnelorgcdid	Varchar(100)         null,				
	personneldepid		Varchar(100)         null,
	vicepresicheckid	Varchar(100)         null,
	vicepresiorgcdid	Varchar(100)         null,				
	vicepresidepid		Varchar(100)         null,
	presicheckid		Varchar(100)         null,
	presiorgcdid		Varchar(100)         null,			
	presidepid			Varchar(100)         null,
	personfilecheckid	Varchar(100)         null,
	personfileorgcdid	Varchar(100)         null,				
	personfiledepid		Varchar(100)         null,
	applytype			Varchar(3)           null,
	vacatereasontype	Varchar(2)           null,
	otherremark			Varchar(100)         null,
	applyreason			Varchar(100)         null,
	applystart			date                 null,
	applyend			date                 null,
	applystarthm		Varchar(10)         null,
	applyendhm			Varchar(10)         null,
	applystarttime		datetime             null,
	applyendtime		datetime             null,
	extraworkapplytype	Varchar(1)         null,
	evectionworkflag	Varchar(1)         null,
	extraworkstart		date                 null,
	extraworkend		date                 null,
	extraworkstarthm	Varchar(10)         null,
	extraworkendhm		Varchar(10)         null,
	extraworkstarttime	datetime             null,
	extraworkendtime	datetime             null,
	evectionaddress 	Varchar(2)          null,
	evectioncountry		Varchar(2)         null,
	evectionprovince	Varchar(2)         null,
	evectioncity		Varchar(2)         null,
	evectionaddress1	Varchar(20)         null,
	evectionaddress2	Varchar(20)         null,
	evectionstart		Varchar(1)         null,
	airplaneflag		Varchar(1)         null,
	totalhours			Varchar(3)         null,
	evectionmoney		decimal(18, 2)     null,
	evectionallowance	decimal(18, 2)     null,
	totalmoney			decimal(18, 2)     null,
	status				Varchar(1)         null,
	checklevel			Varchar(1)         null,
	remark				Varchar(255)         null,
	remark1				Varchar(255)         null,
	remark2				Varchar(255)         null,
	remark3				Varchar(255)         null
   constraint PK_t_applyform primary key nonclustered (applyid)
)
go
ALTER TABLE t_applyform ADD  CONSTRAINT DF_t_applyform_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: his_applyform                                               */
/*==============================================================*/
create table his_applyform (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   hisid				varchar(100)         not null,
   pid              	varchar(100)         null,
   operatorid           varchar(100)         null,
   operatorname         varchar(20)          null,
   operationcd          varchar(10)          null,
   viewflg              varchar(1)           null,
   replaceflg           varchar(1)           null,
   remark               varchar(255)         null
   constraint PK_his_applyform primary key nonclustered (hisid)
)
go
ALTER TABLE his_applyform ADD  CONSTRAINT DF_his_applyform_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_emprole                                             */
/*==============================================================*/
create table t_emprole (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   empid				varchar(100)         not null,
   roleid              	varchar(100)         not null,
   remark1              varchar(255)        null,
   remark2              varchar(255)        null,
   remark3              varchar(255)        null,
   constraint PK_t_emprole primary key nonclustered (empid,roleid)
)
go
ALTER TABLE t_emprole ADD  CONSTRAINT DF_t_emprole_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_emprole                                             */
/*==============================================================*/
create table t_emprole (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   empid				varchar(100)         not null,
   roleid              	varchar(100)         not null,
   remark1              varchar(255)        null,
   remark2              varchar(255)        null,
   remark3              varchar(255)        null,
   constraint PK_t_emprole primary key nonclustered (empid,roleid)
)
go
ALTER TABLE t_emprole ADD  CONSTRAINT DF_t_emprole_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_applyconnect                                             */
/*==============================================================*/
create table t_applyconnect (
   creator				varchar(100)		 null,
   createtime           datetime             null,
   updator				varchar(100)		 null,
   updatetime           datetime             null,
   exclusivefg			varchar(32)		 	 null,
   orgid				varchar(255)		 null,
   deletefg				char(1)		 		 not null,
   applyid				varchar(100)         not null,
   empid              	varchar(100)         not null,
   remark1              varchar(255)        null,
   remark2              varchar(255)        null,
   remark3              varchar(255)        null,
   constraint PK_t_applyconnect primary key nonclustered (applyid,empid)
)
go
ALTER TABLE t_applyconnect ADD  CONSTRAINT DF_t_applyconnect_deletefg  DEFAULT '0' FOR deletefg
GO
/*==============================================================*/
/* Table: t_ticketdetail                                             */
/*==============================================================*/
create table t_ticketdetail (
   creator				varchar(100)		null,
   createtime           datetime            null,
   updator				varchar(100)		null,
   updatetime           datetime            null,
   exclusivefg			varchar(32)		 	null,
   orgid				varchar(255)		null,
   deletefg				char(1)		 		not null,
   ticketdetailid		varchar(100)        not null,
   applyid              varchar(100)        not null,
   orderdate            date 				null,
   flight				varchar(30)		 	null,
   start				varchar(20)		 	null,
   reach				varchar(20)		 	null,
   discountflag			varchar(1)		 	null,
   ticketflag			varchar(1)		 	null,
   remark1              varchar(255)        null,
   remark2              varchar(255)        null,
   remark3              varchar(255)        null,
   constraint PK_t_ticketdetail primary key nonclustered (ticketdetailid)
)
go
ALTER TABLE t_ticketdetail ADD  CONSTRAINT DF_t_ticketdetail_deletefg  DEFAULT '0' FOR deletefg
GO