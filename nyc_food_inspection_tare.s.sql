/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      NYC_FoodInspection.DM1
 *
 * Date Created : Thursday, October 06, 2022 16:43:18
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    DATE_ID_SK    int    NOT NULL,
    DAY           int    NULL,
    MONTH         int    NULL,
    YEAR          int    NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DATE_ID_SK)
)

go


IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimInspection 
 */

CREATE TABLE DimInspection(
    INSPECTION_ID_SK    int               NOT NULL,
    [INSPECTION TYPE]   nvarchar(4000)    NULL,
    [INSPECTION DATE]   date              NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (INSPECTION_ID_SK)
)

go


IF OBJECT_ID('DimInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE DimInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimInspection >>>'
go

/* 
 * TABLE: DimLocation 
 */

CREATE TABLE DimLocation(
    LOCATION_ID_SK      int                 NOT NULL,
    BORO                nvarchar(100)       NULL,
    BUILDING            nvarchar(500)       NULL,
    SREET               nvarchar(50)        NULL,
    ZIPCODE             nvarchar(10)        NULL,
    LATITUDE            double precision    NULL,
    LONGITUDE           double precision    NULL,
    BIN                 int                 NULL,
    BBL                 int                 NULL,
    NTA                 nvarchar(5)         NULL,
    [Community Board]   int                 NULL,
    [Council District]  int                 NULL,
    [Location Point]    nvarchar(1)         NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (LOCATION_ID_SK)
)

go


IF OBJECT_ID('DimLocation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimLocation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimLocation >>>'
go

/* 
 * TABLE: DimRestaurant 
 */

CREATE TABLE DimRestaurant(
    RESTAURANT_ID_SK       int             NOT NULL,
    CAMIS                  int             NULL,
    DBA                    nvarchar(95)    NULL,
    PHONE                  nvarchar(12)    NULL,
    [CUISINE DESCRIPTION]  nvarchar(30)    NULL,
    [GRADE DATE]           date            NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (RESTAURANT_ID_SK)
)

go


IF OBJECT_ID('DimRestaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimRestaurant >>>'
go

/* 
 * TABLE: DimViolation 
 */

CREATE TABLE DimViolation(
    VIOLATION_ID_SK          int               NOT NULL,
    ACTION                   nvarchar(140)     NULL,
    [VIOLATION CODE]         nvarchar(6)       NULL,
    [VIOLATION DESCRIPTION]  nvarchar(1000)    NULL,
    [CRITICAL FLAG]          nvarchar(15)      NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (VIOLATION_ID_SK)
)

go


IF OBJECT_ID('DimViolation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimViolation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimViolation >>>'
go

/* 
 * TABLE: Fact_nyc_food_inspection 
 */

CREATE TABLE Fact_nyc_food_inspection(
    FACT_NYC_ID_SK      int            NOT NULL,
    LOCATION_ID_SK      int            NULL,
    VIOLATION_ID_SK     int            NULL,
    INSPECTION_ID_SK    int            NULL,
    RESTAURANT_ID_SK    int            NULL,
    DATE_ID_SK          int            NULL,
    SCORE               nvarchar(1)    NULL,
    GRADE               nvarchar(1)    NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (FACT_NYC_ID_SK)
)

go


IF OBJECT_ID('Fact_nyc_food_inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_nyc_food_inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_nyc_food_inspection >>>'
go

/* 
 * TABLE: Fact_nyc_food_inspection 
 */

ALTER TABLE Fact_nyc_food_inspection ADD CONSTRAINT RefDimLocation2 
    FOREIGN KEY (LOCATION_ID_SK)
    REFERENCES DimLocation(LOCATION_ID_SK)
go

ALTER TABLE Fact_nyc_food_inspection ADD CONSTRAINT RefDimViolation4 
    FOREIGN KEY (VIOLATION_ID_SK)
    REFERENCES DimViolation(VIOLATION_ID_SK)
go

ALTER TABLE Fact_nyc_food_inspection ADD CONSTRAINT RefDimDate5 
    FOREIGN KEY (DATE_ID_SK)
    REFERENCES DimDate(DATE_ID_SK)
go

ALTER TABLE Fact_nyc_food_inspection ADD CONSTRAINT RefDimInspection6 
    FOREIGN KEY (INSPECTION_ID_SK)
    REFERENCES DimInspection(INSPECTION_ID_SK)
go

ALTER TABLE Fact_nyc_food_inspection ADD CONSTRAINT RefDimRestaurant7 
    FOREIGN KEY (RESTAURANT_ID_SK)
    REFERENCES DimRestaurant(RESTAURANT_ID_SK)
go


