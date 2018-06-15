/*
 * Project:       Retail_DW
 * Author:        Rick Sherman
 * Modified:      4/7/2018
 * Target DBMS:   MySQL
 */

/* 
 * TABLE: dbo.Dim_SOR 
 */

CREATE TABLE Dim_SOR(
    SOR_ID              int             NOT NULL,
    SOR_SystemID       int             NOT NULL,
    SOR_TableName      nchar(80)       NULL,
    SOR_Description     nchar(80)       NULL,
    DI_JobID           nvarchar(20)    NULL,
    DI_CreateDate      datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (SOR_ID)
);

/* 
 * TABLE: dbo.Dim_SOR_System 
 */

CREATE TABLE Dim_SOR_System(
    SOR_SystemID       int             NOT NULL,
    SOR_Name            nchar(20)       NULL,
    SOR_Description     nchar(80)       NULL,
    SOR_Type            varchar(80)     NULL,
    SOR_DBMS            varchar(80)     NULL,
    SOR_DBName          varchar(80)     NULL,
    SOR_DBSchema        varchar(80)     NULL,
    SOR_FileType        varchar(80)     NULL,
    SOR_Filename        varchar(255)    NULL,
    SOR_AppName         varchar(255)    NULL,
    SOR_AppModule       varchar(255)    NULL,
    DI_JobID           nvarchar(20)    NULL,
    DI_CreateDate      datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (SOR_SystemID)
);

CREATE TABLE Dim_Reject_Codes(
    DI_Reject_ID            int              AUTO_INCREMENT NOT NULL,
    DI_Reject_Code          int              NOT NULL,
    DI_Reject_Reason        nchar(80)        NULL, 
    DI_Reject_Description   nchar(255)      NULL,
    SOR_ID                  int              DEFAULT -1 NOT NULL,
    DI_JobID               nvarchar(20)     NOT NULL,
    DI_CreateDate          datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (DI_Reject_ID)
);

/* ************************************************************************** */

/* 
 * TABLE: DimAccount 
 */

CREATE TABLE DimAccount(
    AccountSK              int              AUTO_INCREMENT,
    AccountKey             int              NOT NULL,
    ParentAccountSK        int              NULL,
    ParentAccountKey       int              NULL,
    AccountLabel           nvarchar(100)    NULL,
    AccountName            nvarchar(50)     NULL,
    AccountDescription     nvarchar(50)     NULL,
    AccountType            nvarchar(50)     NULL,
    Operator               nvarchar(50)     NULL,
    SOR_ID                 int              DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime         NULL,
    SOR_UpdateDate         datetime         NULL,
    DI_JobID              nvarchar(20)     NOT NULL,
    DI_CreateDate         datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (AccountSK)
);

/* 
 * TABLE: DimChannel 
 */

CREATE TABLE DimChannel(
    ChannelSK             int              AUTO_INCREMENT,
    ChannelKey            int              NOT NULL,
    ChannelLabel          nvarchar(100)    NOT NULL,
    ChannelName           nvarchar(20)     NULL,
    ChannelDescription    nvarchar(50)     NULL,
    SOR_ID                int              DEFAULT -1 NOT NULL,
    SOR_LoadDate          datetime         NULL,
    SOR_UpdateDate        datetime         NULL,
    DI_JobID             nvarchar(20)     NOT NULL,
    DI_CreateDate        datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate      datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (ChannelSK)
);

/* 
 * TABLE: DimCurrency 
 */
 
CREATE TABLE DimCurrency(
    CurrencySK             int             AUTO_INCREMENT,
    CurrencyKey            int             NOT NULL,
    CurrencyLabel          nvarchar(10)    NOT NULL,
    CurrencyName           nvarchar(20)    NOT NULL,
    CurrencyDescription    nvarchar(50)    NOT NULL,
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (CurrencySK)
);

/* 
 * TABLE: DimCustomer_Company 
 */

CREATE TABLE DimCustomer_Company(
    CustomerSK          int               AUTO_INCREMENT,
    CustomerID          int               NOT NULL,
    CustomerKey         int               NOT NULL,
    CustomerLabel       nchar(5)          NOT NULL,
    GeographySK         int               NOT NULL,
    YearlyIncome        numeric(15, 2)    NULL,
    CustomerType        nvarchar(15)      NULL,
    CompanyName         nvarchar(100)     NULL,
    GeographyKey        int               NOT NULL,
    SOR_ID              int               DEFAULT -1 NOT NULL,
    SOR_LoadDate        datetime          NULL,
    SOR_UpdateDate      datetime          NULL,
    DI_JobID           nvarchar(20)      NOT NULL,
    DI_CreateDate      datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (CustomerSK)
);

/* 
 * TABLE: DimCustomer_Person 
 */

CREATE TABLE DimCustomer_Person(
    CustomerSK              int               AUTO_INCREMENT,
    CustomerID              int               NOT NULL,
    CustomerKey             int               NOT NULL,
    CustomerLabel           nchar(5)          NOT NULL,
    GeographySK             int               NOT NULL,
    Title                   nvarchar(8)       NULL,
    FirstName               nvarchar(50)      NULL,
    MiddleName              nvarchar(50)      NULL,
    LastName                nvarchar(50)      NULL,
    NameStyle               tinyint               NULL,
    BirthDate               date              NULL,
    MaritalStatus           nchar(1)          NULL,
    Suffix                  nvarchar(10)      NULL,
    Gender                  nvarchar(1)       NULL,
    EmailAddress            nvarchar(50)      NULL,
    YearlyIncome            numeric(15, 2)    NULL,
    TotalChildren           int               NULL,
    NumberChildrenAtHome    int               NULL,
    Education               nvarchar(40)      NULL,
    Occupation              nvarchar(100)     NULL,
    HouseOwnerFlag          nchar(1)          NULL,
    NumberCarsOwned         int               NULL,
    AddressLine1            nvarchar(120)     NULL,
    AddressLine2            nvarchar(120)     NULL,
    Phone                   nvarchar(20)      NULL,
    DateFirstPurchase       date              NULL,
    SOR_ID                  int               DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime          NULL,
    SOR_UpdateDate          datetime          NULL,
    DI_JobID               nvarchar(20)      NOT NULL,
    DI_CreateDate          datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (CustomerSK)
);

/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(

    DateSK                int             NOT NULL,
    FullDateAK            date            NULL,
    FullDateTimeAK        datetime        NULL,
    YearID                int             NULL,
    MonthID               int             NULL,
    DayID                 int             NULL,
    YearQtr               int             NULL,
    YearMonth             int             NULL,
    DayOfYear             int             NULL,
    WeekOfYear            int             NULL,
    DayofWeek             int             NULL,
    MonthAbr              char(3)         NULL,
    DayAbr                char(3)         NULL,
    MonthFull             varchar(12)     NULL,
    DayFull               varchar(12)     NULL,
    FullDateUSA           char(10)        NULL,
    DayOfMonth            varchar(2)      NULL,
    DaySuffix             varchar(4)      NULL,
    DayName               varchar(9)      NULL,
    DayOfWeekUSA          char(1)         NULL,
    DayOfWeekInMonth      varchar(2)      NULL,
    DayOfWeekInYear       varchar(2)      NULL,
    DayOfQuarter          varchar(3)      NULL,
    DayOfYearChar         varchar(3)      NULL,
    WeekOfMonth           varchar(1)      NULL,
    WeekOfQuarter         varchar(2)      NULL,
    WeekOfYearChar        varchar(2)      NULL,
    MonthChar             varchar(2)      NULL,
    MonthName             varchar(9)      NULL,
    MonthOfQuarter        varchar(2)      NULL,
    Quarter               char(1)         NULL,
    QuarterName           varchar(9)      NULL,
    YearChar              char(4)         NULL,
    YearName              char(7)         NULL,
    MonthYear             char(10)        NULL,
    MMYYYY                char(6)         NULL,
    FirstDayOfMonth       date            NULL,
    LastDayOfMonth        date            NULL,
    FirstDayOfQuarter     date            NULL,
    LastDayOfQuarter      date            NULL,
    FirstDayOfYear        date            NULL,
    LastDayOfYear         date            NULL,
    IsWeekday             int             NULL,
    IsHolidayUSA          int             NULL,
    HolidayUSA            varchar(50)     NULL,
    EuropeSeason          varchar(50)     NULL,
    NorthAmericaSeason    varchar(50)     NULL,
    AsiaSeason            varchar(50)     NULL,
    SOR_ID                int             DEFAULT -1 NOT NULL,
    SOR_LoadDate          datetime        NULL,
    SOR_UpdateDate        datetime        NULL,
    DI_JobID             nvarchar(20)    NOT NULL,
    DI_CreateDate        datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate      datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (DateSK)
);

/* 
 * TABLE: DimEntity 
 */

CREATE TABLE DimEntity(
    EntitySK             int              AUTO_INCREMENT,
    EntityKey            int              NOT NULL,
    EntityLabel          nvarchar(100)    NULL,
    ParentEntitySK       int              NULL,
    ParentEntityKey      int              NULL,
    ParentEntityLabel    nvarchar(100)    NULL,
    EntityName           nvarchar(50)     NULL,
    EntityDescription    nvarchar(100)    NULL,
    EntityType           nvarchar(100)    NULL,
    StartDate            date             NULL,
    EndDate              date             NULL,
    StartDateSK          int              NULL,
    EndDateSK            int              NULL,
    Status               nvarchar(50)     DEFAULT (NULL) NOT NULL,
    SOR_ID               int              DEFAULT -1 NOT NULL,
    SOR_LoadDate         datetime         NULL,
    SOR_UpdateDate       datetime         NULL,
    DI_JobID            nvarchar(20)     NOT NULL,
    DI_CreateDate       datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate     datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (EntitySK)
);

/* 
 * TABLE: DimGeography 
 */

CREATE TABLE DimGeography(
    GeographySK           int                AUTO_INCREMENT,
    GeographyKey          int                NOT NULL,
    GeographyType         nvarchar(50)       NOT NULL,
    ContinentName         nvarchar(50)       NOT NULL,
    ContinentCode         nchar(2)           NULL,
    Country               nvarchar(100)      NULL,
    Country_name          nvarchar(100)      NULL,
    RegionCountryName     nvarchar(100)      NULL,
    ISO_3166_numeric      int                NULL,
    ISO_3166_alpha_2      nchar(2)           NULL,
    ISO_3166_alpha_3      nchar(3)           NULL,
    Region                nvarchar(100)      NULL,
    Subdiv_name           nvarchar(100)      NULL,    
    ISO_3166_2_subdiv     varchar(10)        NULL,   
    Subdiv_code           nvarchar(10)       NULL,    
    StateProvinceName     nvarchar(100)      NULL,
    StateProvinceCode     nvarchar(3)        NULL,
    City                  nvarchar(100)      NULL,
    CityName              nvarchar(100)      NULL,
    Latitude              decimal(28, 10)    NULL,
    Longitude             decimal(28, 10)    NULL,
    SOR_ID                int                DEFAULT -1 NOT NULL,
    SOR_LoadDate          datetime           NULL,
    SOR_UpdateDate        datetime           NULL,
    DI_JobID             nvarchar(20)       NOT NULL,
    DI_CreateDate        datetime           DEFAULT now() NOT NULL,
    DI_ModifiedDate      datetime           DEFAULT now() NOT NULL,
    PRIMARY KEY (GeographySK)
);

/* 
 * TABLE: DimProduct 
 */

CREATE TABLE DimProduct(
    ProductSK                        int              AUTO_INCREMENT,
    ProductKey                       int              NOT NULL,
    Product_ID                       nvarchar(24)     NOT NULL,
    Brand_ID                         nvarchar(24)     NOT NULL,
    ProductLabel                     nvarchar(24)     NOT NULL,
    ProductName                      nvarchar(500)    NULL,
    ProductDescription               nvarchar(400)    NULL,
    ProductSubcategoryKey            int              NULL,
    ProductSubcategoryLabel          nvarchar(100)    NULL,
    ProductSubcategoryName           nvarchar(50)     NOT NULL,
    ProductSubcategoryDescription    nvarchar(100)    NULL,
    ProductCategoryKey               int              NULL,
    ProductCategoryLabel             nvarchar(100)    NOT NULL,
    ProductCategoryName              nvarchar(30)     NOT NULL,
    ProductCategoryDescription       nvarchar(50)     NOT NULL,
    Manufacturer                     nvarchar(50)     NULL,
    BrandName                        nvarchar(50)     NULL,
    ClassID                          nvarchar(10)     NULL,
    ClassName                        nvarchar(20)     NULL,
    StyleID                          nvarchar(10)     NULL,
    StyleName                        nvarchar(20)     NULL,
    ColorID                          nvarchar(10)     NULL,
    ColorName                        nvarchar(20)     NULL,
    ProductSize                      nvarchar(50)     NULL,
    SizeRange                        nvarchar(50)     NULL,
    SizeUnitMeasureID                nvarchar(20)     NULL,
    Weight                           double            NULL,
    WeightUnitMeasureID              nvarchar(20)     NULL,
    UnitOfMeasureID                  nvarchar(10)     NULL,
    UnitOfMeasureName                nvarchar(40)     NULL,
    StockTypeID                      nvarchar(10)     NULL,
    StockTypeName                    nvarchar(40)     NULL,
    AvailableForSaleDate             datetime         NULL,
    StopSaleDate                     datetime         NULL,
    Status                           nvarchar(7)      NULL,
    SOR_ID                           int              DEFAULT -1 NOT NULL,
    SOR_LoadDate                     datetime         NULL,
    SOR_UpdateDate                   datetime         NULL,
    DI_JobID                        nvarchar(20)     NOT NULL,
    DI_CreateDate                   datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate                 datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (ProductSK)
);

/* 
 * TABLE: DimProductCategory 
 */

CREATE TABLE DimProductCategory(
    ProductCategoryKey                  int              NOT NULL,
    ProductCategoryLabel                nvarchar(100)    NOT NULL,
    ProductCategoryName                 nvarchar(30)     NOT NULL,
    ProductCategoryDescription          nvarchar(50)     NOT NULL,
    DI_JobID           nvarchar(20)    NULL,
    DI_CreateDate      datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (ProductcategoryKey)
);

/* 
 * TABLE: DimProductCost 
 */

CREATE TABLE DimProductCost(
    SCD_ProductCostSK      int               AUTO_INCREMENT,
    ProductSK              int               NOT NULL,
    CurrencyKey            int               NOT NULL,
    UnitCost               numeric(15, 2)    NULL,
    SCD_EffectiveDate      date              NULL,
    SCD_IneffectiveDate    date              NULL,
    SCD_Current_Flag       int               DEFAULT (1) NOT NULL,
    SOR_ID                 int               DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime          NULL,
    SOR_UpdateDate         datetime          NULL,
    DI_JobID              nvarchar(20)      NOT NULL,
    DI_CreateDate         datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (SCD_ProductCostSK)
);

/* 
 * TABLE: DimProductPrice 
 */

CREATE TABLE DimProductPrice(
    SCD_ProductPriceSK     int               AUTO_INCREMENT,
    ProductSK              int               NOT NULL,
    CurrencyKey            int               NOT NULL,
    UnitPrice              numeric(15, 2)    NULL,
    SCD_EffectiveDate      date              NULL,
    SCD_IneffectiveDate    date              NULL,
    SCD_Current_Flag       int               DEFAULT (1) NOT NULL,
    SOR_ID                 int               DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime          NULL,
    SOR_UpdateDate         datetime          NULL,
    DI_JobID              nvarchar(20)      NOT NULL,
    DI_CreateDate         datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (SCD_ProductPriceSK)
);

/* 
 * TABLE: DimPromotion 
 */

CREATE TABLE DimPromotion(
    PromotionSK             int              AUTO_INCREMENT,
    PromotionID             int              NOT NULL,
    PromotionKey            int              NOT NULL,
    PromotionLabel          nvarchar(12)     NOT NULL,
    PromotionName           nvarchar(100)    NULL,
    PromotionDescription    nvarchar(255)    NULL,
    DiscountPercent         double            NULL,
    PromotionType           nvarchar(50)     NULL,
    PromotionCategory       nvarchar(50)     NULL,
    StartDate               date             NOT NULL,
    EndDate                 date             NULL,
    MinQuantity             int              NULL,
    MaxQuantity             int              NULL,
    SOR_ID                  int              DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime         NULL,
    SOR_UpdateDate          datetime         NULL,
    DI_JobID               nvarchar(20)     NOT NULL,
    DI_CreateDate          datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (PromotionSK)
);

/* 
 * TABLE: DimSalesTerritory 
 */

CREATE TABLE DimSalesTerritory(
    SalesTerritorySK         int              AUTO_INCREMENT,
    SalesTerritoryKey        int              NOT NULL,
    GeographySK              int              NOT NULL,
    SalesTerritoryLabel      nvarchar(100)    NULL,
    SalesTerritoryName       nvarchar(50)     NOT NULL,
    SalesTerritoryRegion     nvarchar(50)     NOT NULL,
    SalesTerritoryCountry    nvarchar(50)     NOT NULL,
    SalesTerritoryGroup      nvarchar(50)     NULL,
    SalesTerritoryLevel      nvarchar(10)     NULL,
    SalesTerritoryManager    int              NULL,
    StartDate                date             NULL,
    EndDate                  date             NULL,
    Status                   nvarchar(50)     NULL,
    SOR_ID                   int              DEFAULT -1 NOT NULL,
    SOR_LoadDate             datetime         NULL,
    SOR_UpdateDate           datetime         NULL,
    DI_JobID                nvarchar(20)     NOT NULL,
    DI_CreateDate           datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate         datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesTerritorySK)
);

/* 
 * TABLE: DimScenario 
 */

CREATE TABLE DimScenario(
    ScenarioSK             int              AUTO_INCREMENT,
    ScenarioKey            int              NOT NULL,
    ScenarioLabel          nvarchar(100)    NOT NULL,
    ScenarioName           nvarchar(20)     NULL,
    ScenarioDescription    nvarchar(50)     NULL,
    SOR_ID                 int              DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime         NULL,
    SOR_UpdateDate         datetime         NULL,
    DI_JobID              nvarchar(20)     NOT NULL,
    DI_CreateDate         datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (ScenarioSK)
);


/* 
 * TABLE: DimStore 
 */

CREATE TABLE DimStore(
    StoreSK             int              AUTO_INCREMENT,
    StoreID             int              NOT NULL,
    StoreKey            int              NOT NULL,
    SalesTerritorySK    int              NULL,
    StoreManager        int              NULL,
    StoreType           nvarchar(15)     NULL,
    StoreName           nvarchar(100)    NOT NULL,
    StoreDescription    nvarchar(300)    NOT NULL,
    Status              nvarchar(20)     NOT NULL,
    OpenDate            date             NOT NULL,
    CloseDate           date             NULL,
    EntityKey           int              NULL,
    ZipCode             nvarchar(20)     NULL,
    ZipCodeExtension    nvarchar(10)     NULL,
    StorePhone          nvarchar(15)     NULL,
    StoreFax            nvarchar(14)     NULL,
    AddressLine1        nvarchar(100)    NULL,
    AddressLine2        nvarchar(100)    NULL,
    GeographySK         int              NOT NULL,
    CloseReason         nvarchar(20)     NULL,
    EmployeeCount       int              NULL,
    SellingAreaSize     double            NULL,
    LastRemodelDate     datetime         NULL,
    SOR_ID              int              DEFAULT -1 NOT NULL,
    SOR_LoadDate        datetime         NULL,
    SOR_UpdateDate      datetime         NULL,
    DI_JobID           nvarchar(20)     NOT NULL,
    DI_CreateDate      datetime         DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (StoreSK)
);

/* 
 * TABLE: FactExchangeRate 
 */

CREATE TABLE FactExchangeRate(
    ExchangeRateSK      int               AUTO_INCREMENT,
    CurrencyDateSK      int               NOT NULL,
    CurrencyDateKey     date              NOT NULL,
    CurrencySK          int               NOT NULL,
    EndOfDayRate        numeric(19, 4)    NOT NULL,
    SOR_ID              int               DEFAULT -1 NOT NULL,
    SOR_LoadDate        datetime          NULL,
    SOR_UpdateDate      datetime          NULL,
    DI_JobID           nvarchar(20)      NOT NULL,
    DI_CreateDate      datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate    datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (ExchangeRateSK)
);

/* 
 * TABLE: FactInventory 
 */

CREATE TABLE FactInventory(
    InventorySK            int             AUTO_INCREMENT,
    InventoryDateSK        int             NOT NULL,
    InventoryDate          date            NOT NULL,
    StoreSK                int             NOT NULL,
    ProductSK              int             NOT NULL,
    GeographySK            int             NOT NULL,
    OnHandQuantity         int             NULL,
    OnOrderQuantity        int             NULL,
    SafetyStockQuantity    int             NULL,
    DaysInStock            int             NULL,
    MinDayInStock          int             NULL,
    MaxDayInStock          int             NULL,
    Aging                  int             NULL,
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (InventorySK)
);

/* 
 * TABLE: FactInventory_Rejects 
 */

CREATE TABLE FactInventory_Rejects(
    InventorySK            int             AUTO_INCREMENT,
    InventoryDateSK        int             NOT NULL,
    InventoryDate          date            NOT NULL,
    StoreSK                int             NOT NULL,
    ProductSK              int             NOT NULL,
    GeographySK            int             NOT NULL,
    OnHandQuantity         int             NOT NULL,
    OnOrderQuantity        int             NOT NULL,
    SafetyStockQuantity    int             NULL,
    DaysInStock            int             NULL,
    MinDayInStock          int             NULL,
    MaxDayInStock          int             NULL,
    Aging                  int             NULL,
    DI_Reject_Code         int             DEFAULT -1 NULL,  
    InventoryID             int NULL,
    StoreID                 int NULL,
    ProductLabel            nvarchar(24) NULL,
    Brand_ID                nvarchar(24) NULL,
    Product_ID              nvarchar(24) NULL,
    GeographyID             int NULL,  
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (InventorySK)
);

/* 
 * TABLE: FactOnlineSales 
 */

CREATE TABLE FactOnlineSales(
    SalesSK                 int               AUTO_INCREMENT,
    SalesDateSK             int               NULL,
    SalesDate               date              NULL,
    CustomerSK              int               NULL,
    ChannelSK               int               NULL,
    StoreSK                 int               NULL,
    ProductSK               int               NULL,
    PromotionSK             int               NULL,
    GeographySK             int               NULL,
    SalesOrderNumber        nvarchar(20)      NULL,
    SalesOrderLineNumber    int               NULL,
    SalesQuantity           int               NOT NULL,
    ReturnQuantity          int               NULL,
    SalesAmount             numeric(15, 2)    NOT NULL,
    ReturnAmount            numeric(15, 2)    NULL,
    DiscountAmount          numeric(15, 2)    NULL,
    TotalCost               numeric(15, 2)    NULL,
    Local_CurrencySK        int               NULL,
    SalesAmount_Local       numeric(15, 2)    NULL,
    ReturnAmount_Local      numeric(15, 2)    NULL,
    DiscountAmount_Local    numeric(15, 2)    NULL,
    TotalCost_Local         numeric(15, 2)    NULL,
    SOR_ID                  int               DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime          NULL,
    SOR_UpdateDate          datetime          NULL,
    DI_JobID               nvarchar(20)      NOT NULL,
    DI_CreateDate          datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesSK)
);

/* 
 * TABLE: FactOnlineSales_Rejects 
 */


CREATE TABLE FactOnlineSales_Rejects(
    SalesSK                 int               AUTO_INCREMENT,
    SalesDateSK             int               NULL,
    SalesDate               date              NULL,
    CustomerSK              int               NULL,
    ChannelSK               int               NULL,
    StoreSK                 int               NULL,
    ProductSK               int               NULL,
    PromotionSK             int               NULL,
    GeographySK             int               NULL,
    SalesOrderNumber        nvarchar(20)      NULL,
    SalesOrderLineNumber    int               NULL,
    SalesQuantity           int               NULL,
    ReturnQuantity          int               NULL,
    SalesAmount             numeric(15, 2)    NULL,
    ReturnAmount            numeric(15, 2)    NULL,
    DiscountAmount          numeric(15, 2)    NULL,
    TotalCost               numeric(15, 2)    NULL,
    Local_CurrencySK        int               NULL,
    SalesAmount_Local       numeric(15, 2)    NULL,
    ReturnAmount_Local      numeric(15, 2)    NULL,
    DiscountAmount_Local    numeric(15, 2)    NULL,
    TotalCost_Local         numeric(15, 2)    NULL,
    DI_Reject_Code          int             DEFAULT -1 NULL,
    SalesID                 int NULL,
    ChannelKey              int NULL,
    StoreID                 int NULL,
    ProductLabel            nvarchar(24) NULL,
    Brand_ID                nvarchar(24) NULL,
    Product_ID              nvarchar(24) NULL,
    PromotionID             int NULL,
    PromotionLabel          nvarchar(12) NULL,
    CustomerKey             int NULL,
    CustomerLabel           nvarchar(5) NULL,
    GeographyID             int NULL,
    SOR_ID                  int             DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime        NULL,
    SOR_UpdateDate          datetime        NULL,
    DI_JobID               nvarchar(20)    NOT NULL,
    DI_CreateDate          datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY  (SalesSK)
);

/* 
 * TABLE: FactSales 
 */

CREATE TABLE FactSales(
    SalesSK             int               AUTO_INCREMENT,
    SalesDateSK         int               NOT NULL,
    SalesDate           date              NOT NULL,
    ChannelSK           int               NOT NULL,
    StoreSK             int               NOT NULL,
    ProductSK           int               NOT NULL,
    PromotionSK         int               NOT NULL,
    GeographySK         int               NOT NULL,
    SalesQuantity       int               NOT NULL,
    ReturnQuantity      int               NULL,
    SalesAmount         numeric(15, 2)    NOT NULL,
    ReturnAmount        numeric(15, 2)    NULL,
    DiscountAmount      numeric(15, 2)    NULL,
    TotalCost           numeric(15, 2)    NULL,
    Local_CurrencySK        int               NULL,
    SalesAmount_Local       numeric(15, 2)    NULL,
    ReturnAmount_Local      numeric(15, 2)    NULL,
    DiscountAmount_Local    numeric(15, 2)    NULL,
    TotalCost_Local         numeric(15, 2)    NULL,
    SOR_ID                  int               DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime          NULL,
    SOR_UpdateDate          datetime          NULL,
    DI_JobID               nvarchar(20)      NOT NULL,
    DI_CreateDate          datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesSK)
);

/* 
 * TABLE: FactSales_Rejects 
 */

CREATE TABLE FactSales_Rejects(
    SalesSK             int               AUTO_INCREMENT,
    SalesDateSK         int               NULL,
    SalesDate           date              NULL,
    ChannelSK           int               NULL,
    StoreSK             int               NULL,
    ProductSK           int               NULL,
    PromotionSK         int               NULL,
    GeographySK         int               NULL,
    SalesQuantity       int               NULL,
    ReturnQuantity      int               NULL,
    SalesAmount         numeric(15, 2)    NULL,
    ReturnAmount        numeric(15, 2)    NULL,
    DiscountAmount      numeric(15, 2)    NULL,
    TotalCost           numeric(15, 2)    NULL,
    Local_CurrencySK        int               NULL,
    SalesAmount_Local       numeric(15, 2)    NULL,
    ReturnAmount_Local      numeric(15, 2)    NULL,
    DiscountAmount_Local    numeric(15, 2)    NULL,
    TotalCost_Local         numeric(15, 2)    NULL,
    DI_Reject_Code         int             DEFAULT -1 NULL,  
    SalesID                 int NULL,
    ChannelKey              int NULL,
    StoreID                 int NULL,
    ProductLabel            nvarchar(24) NULL,
    Brand_ID                nvarchar(24) NULL,
    Product_ID              nvarchar(24) NULL,
    PromotionID             int NULL,
    PromotionLabel          nvarchar(12) NULL,
    GeographyID             int NULL,
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesSK)
);


/* 
 * TABLE: FactSalesQuota 
 */

CREATE TABLE FactSalesQuota(
    SalesQuotaSK          int               AUTO_INCREMENT,
    SalesQuotaKey         int               NOT NULL,
    ChannelSK             int               NOT NULL,
    StoreSK               int               NOT NULL,
    ProductSK             int               NOT NULL,
    QuotaDateSK           int               NOT NULL,
    QuotaDateKey          date              NOT NULL,
    CurrencySK            int               NOT NULL,
    ScenarioSK            int               NOT NULL,
    SalesQuantityQuota    int               NOT NULL,
    GrossMarginPct        numeric(15, 4)    NOT NULL,
    Local_CurrencySK        int               NULL,
    SalesAmountQuota_Local  numeric(15, 2)    NULL,
    SOR_ID                  int               DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime          NULL,
    SOR_UpdateDate          datetime          NULL,
    DI_JobID               nvarchar(20)      NOT NULL,
    DI_CreateDate          datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesQuotaSK)
);

/* 
 * TABLE: FactSalesQuota_Rejects 
 */

CREATE TABLE FactSalesQuota_Rejects(
    SalesQuotaSK          int               AUTO_INCREMENT,
    SalesQuotaKey         int               NULL,
    ChannelSK             int               NULL,
    StoreSK               int               NULL,
    ProductSK             int               NULL,
    QuotaDateSK           int               NULL,
    QuotaDateKey          date              NULL,
    CurrencySK            int               NULL,
    ScenarioSK            int               NULL,
    SalesQuantityQuota    int               NULL,
    GrossMarginPct        numeric(15, 4)    NULL,
    Local_CurrencySK      int               NULL,
    SalesAmountQuota_Local  numeric(15, 2)  NULL,
    DI_Reject_Code        int               DEFAULT -1 NULL,    
    ChannelKey              int NULL,
    StoreID                 int NULL,
    ProductLabel            nvarchar(24) NULL,
    Brand_ID                nvarchar(24) NULL,
    Product_ID              nvarchar(24) NULL,
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (SalesQuotaSK)
);

/* 
 * TABLE: FactStrategyPlan 
 */

CREATE TABLE FactStrategyPlan(
    StrategyPlanSK        int               AUTO_INCREMENT,
    PlanDateSK            int               NOT NULL,
    PlanDatekey           date              NOT NULL,
    EntitySK              int               NOT NULL,
    ScenarioSK            int               NOT NULL,
    AccountSK             int               NOT NULL,
    ProductCategoryKey    int               NULL,
    PlanAmount            numeric(15, 2)    NOT NULL,
    Local_CurrencySK      int               NULL,
    PlanAmount_Local      numeric(15, 2)    NULL,
    SOR_ID                  int               DEFAULT -1 NOT NULL,
    SOR_LoadDate            datetime          NULL,
    SOR_UpdateDate          datetime          NULL,
    DI_JobID               nvarchar(20)      NOT NULL,
    DI_CreateDate          datetime          DEFAULT now() NOT NULL,
    DI_ModifiedDate        datetime          DEFAULT now() NOT NULL,
    PRIMARY KEY (StrategyPlanSK)
);

/* 
 * TABLE: FactStrategyPlan_Rejects 
 */

CREATE TABLE FactStrategyPlan_Rejects(
    StrategyPlanSK        int               AUTO_INCREMENT,
    PlanDateSK            int               NULL,
    PlanDatekey           date              NULL,
    EntityDK             int               NULL,
    ScenarioSK           int               NULL,
    AccountSK            int               NULL,
    ProductCategoryKey    int               NULL,
    PlanAmount            numeric(15, 2)    NULL,
    Local_CurrencySK      int               NULL,
    PlanAmount_Local      numeric(15, 2)    NULL,
    DI_Reject_Code        int               DEFAULT -1 NULL,
    EntityKey             int               NULL,
    ScenarioKey           int               NULL,
    AccountKey            int               NULL, 
    SOR_ID                 int             DEFAULT -1 NOT NULL,
    SOR_LoadDate           datetime        NULL,
    SOR_UpdateDate         datetime        NULL,
    DI_JobID              nvarchar(20)    NOT NULL,
    DI_CreateDate         datetime        DEFAULT now() NOT NULL,
    DI_ModifiedDate       datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (StrategyPlanSK)
);

