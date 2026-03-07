/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      Dim_Model.DM1
 *
 * Date Created : Tuesday, April 02, 2024 19:57:20
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: address_dim 
 */

CREATE TABLE address_dim(
    address_sk              int            IDENTITY(1,1),
    street_name             varchar(60)    NOT NULL,
    latitude                varchar(25)    NULL,
    longitude               varchar(25)    NULL,
    city                    varchar(8)     NOT NULL,
    country                 varchar(13)    NOT NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (address_sk)
)

go


IF OBJECT_ID('address_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE address_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE address_dim >>>'
go

/* 
 * TABLE: contrib_factor_dim 
 */

CREATE TABLE contrib_factor_dim(
    contrib_factor_sk       int             IDENTITY(1,1),
    contrib_factor_dk       int             NOT NULL,
    contrib_factor          varchar(100)    NULL,
    start_dt                date            NULL,
    end_dt                  date            NULL,
    scd_version             int             NULL,
    is_active               int             NULL,
    DI_Workflow_FileName    varchar(50)     NULL,
    DI_CreatedDate          date            NULL,
    pid                     varchar(10)     NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (contrib_factor_sk)
)

go


IF OBJECT_ID('contrib_factor_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE contrib_factor_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE contrib_factor_dim >>>'
go

/* 
 * TABLE: crash_fct 
 */

CREATE TABLE crash_fct(
    crash_sk                        int             IDENTITY(1,1),
    crash_date_sk                   int             NOT NULL,
    time_sk                         int             NOT NULL,
    address_sk                      int             NOT NULL,
    source_id                       int             NOT NULL,
    crash_id                        varchar(250)    NOT NULL,
    pedestrian_fl                   int             NOT NULL,
    tot_injry_cnt                   int             NOT NULL,
    motorist_injry_or_killed_cnt    int             NOT NULL,
    tot_fatal_cnt                   int             NOT NULL,
    pedestrian_falal_cnt            int             NOT NULL,
    motorist_fatal_cnt              int             NOT NULL,
    DI_CreatedDate                  date            NULL,
    DI_Workflow_FileName            varchar(50)     NULL,
    pid                             varchar(10)     NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (crash_sk)
)

go


IF OBJECT_ID('crash_fct') IS NOT NULL
    PRINT '<<< CREATED TABLE crash_fct >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE crash_fct >>>'
go

/* 
 * TABLE: date_dim 
 */

CREATE TABLE date_dim(
    date_sk                       int            NOT NULL,
    date                          date           NULL,
    full_date_description         varchar(50)    NULL,
    calendar_day_in_words         varchar(30)    NULL,
    calendar_day                  int            NULL,
    calendar_month                varchar(10)    NULL,
    calendar_month_num            int            NULL,
    calendar_year                 int            NULL,
    day_of_the_week               int            NULL,
    weekend_indicator             int            NULL,
    weekend_indicator_in_words    varchar(10)    NULL,
    season                        varchar(20)    NULL,
    DI_CreatedDate                date           NULL,
    DI_Workflow_FileName          varchar(50)    NULL,
    pid                           varchar(10)    NULL,
    CONSTRAINT PK2_1 PRIMARY KEY NONCLUSTERED (date_sk)
)

go


IF OBJECT_ID('date_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE date_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE date_dim >>>'
go

/* 
 * TABLE: most_common_factor_bdg 
 */

CREATE TABLE most_common_factor_bdg(
    most_com_factor_sk      int            IDENTITY(1,1),
    crash_sk                int            NOT NULL,
    contrib_factor_sk       int            NOT NULL,
    contrib_factor_dk       int            NOT NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (most_com_factor_sk)
)

go


IF OBJECT_ID('most_common_factor_bdg') IS NOT NULL
    PRINT '<<< CREATED TABLE most_common_factor_bdg >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE most_common_factor_bdg >>>'
go

/* 
 * TABLE: source_dim 
 */

CREATE TABLE source_dim(
    source_id               int            IDENTITY(1,1),
    source_name             varchar(50)    NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (source_id)
)

go


IF OBJECT_ID('source_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE source_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE source_dim >>>'
go

/* 
 * TABLE: time_dim 
 */

CREATE TABLE time_dim(
    time_sk                 int            NOT NULL,
    time                    time(0)        NULL,
    hour                    int            NULL,
    minute                  int            NULL,
    am_or_pm                varchar(2)     NULL,
    time_category           varchar(10)    NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (time_sk)
)

go


IF OBJECT_ID('time_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE time_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE time_dim >>>'
go

/* 
 * TABLE: vehicle_involved_bdg 
 */

CREATE TABLE vehicle_involved_bdg(
    vehicle_involved_sk     int            IDENTITY(1,1),
    crash_sk                int            NOT NULL,
    vehicle_sk              int            NOT NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (vehicle_involved_sk)
)

go


IF OBJECT_ID('vehicle_involved_bdg') IS NOT NULL
    PRINT '<<< CREATED TABLE vehicle_involved_bdg >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE vehicle_involved_bdg >>>'
go

/* 
 * TABLE: vehicle_type_dim 
 */

CREATE TABLE vehicle_type_dim(
    vehicle_sk              int            IDENTITY(1,1),
    vehicle_type            varchar(50)    NOT NULL,
    DI_CreatedDate          date           NULL,
    DI_Workflow_FileName    varchar(50)    NULL,
    pid                     varchar(10)    NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (vehicle_sk)
)

go


IF OBJECT_ID('vehicle_type_dim') IS NOT NULL
    PRINT '<<< CREATED TABLE vehicle_type_dim >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE vehicle_type_dim >>>'
go

/* 
 * TABLE: crash_fct 
 */

ALTER TABLE crash_fct ADD CONSTRAINT Refdate_dim2 
    FOREIGN KEY (crash_date_sk)
    REFERENCES date_dim(date_sk)
go

ALTER TABLE crash_fct ADD CONSTRAINT Reftime_dim8 
    FOREIGN KEY (time_sk)
    REFERENCES time_dim(time_sk)
go

ALTER TABLE crash_fct ADD CONSTRAINT Refaddress_dim10 
    FOREIGN KEY (address_sk)
    REFERENCES address_dim(address_sk)
go

ALTER TABLE crash_fct ADD CONSTRAINT Refsource_dim19 
    FOREIGN KEY (source_id)
    REFERENCES source_dim(source_id)
go


/* 
 * TABLE: most_common_factor_bdg 
 */

ALTER TABLE most_common_factor_bdg ADD CONSTRAINT Refcrash_fct17 
    FOREIGN KEY (crash_sk)
    REFERENCES crash_fct(crash_sk)
go

ALTER TABLE most_common_factor_bdg ADD CONSTRAINT Refcontrib_factor_dim18 
    FOREIGN KEY (contrib_factor_sk)
    REFERENCES contrib_factor_dim(contrib_factor_sk)
go


/* 
 * TABLE: vehicle_involved_bdg 
 */

ALTER TABLE vehicle_involved_bdg ADD CONSTRAINT Refcrash_fct20 
    FOREIGN KEY (crash_sk)
    REFERENCES crash_fct(crash_sk)
go

ALTER TABLE vehicle_involved_bdg ADD CONSTRAINT Refvehicle_type_dim21 
    FOREIGN KEY (vehicle_sk)
    REFERENCES vehicle_type_dim(vehicle_sk)
go


