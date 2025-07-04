﻿CREATE TABLE [BOLDTC_CouponLogType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(max) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_COUPONLOGTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_CouponLog] (
	Id int IDENTITY(1,1) NOT NULL,
	CouponLogTypeId int NOT NULL,
	PaymentLogId uniqueidentifier,
	LogComments int NOT NULL,
	CreatedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_COUPONLOG] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantPaymentSubscription] (
	Id uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	StripeCustomerId nvarchar(255) NOT NULL UNIQUE,
	SubscriptionId nvarchar(255) NOT NULL UNIQUE,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTPAYMENTSUBSCRIPTION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantInvoiceDetails] (
	Id uniqueidentifier NOT NULL,
	SubscriptionId uniqueidentifier NOT NULL,
	Amount int NOT Null,
	InvoiceId nvarchar(255) NOT NULL,
	ChargeId nvarchar(255) NOT NULL,
	PaymentDate datetime NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTINVOICEDETIALS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantPaymentLog] (
	Id uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	SubscriptionId uniqueidentifier NOT NULL,
	LogComments nvarchar(max) NOT NULL,
	CreatedDate datetime NOT NULL,
	Status nvarchar(255) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTPAYMENTLOG] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_ServerVersion](
	[Id] [int] PRIMARY KEY NOT NULL,
	[VersionNumber] [nvarchar](20) NOT NULL)
;
CREATE TABLE [BOLDTC_SqlServer] (
	Id int IDENTITY(1,1) NOT NULL,
	ServerName nvarchar(255) NOT NULL UNIQUE,
	Username nvarchar(255) NOT NULL,
	Password nvarchar(255) NOT NULL,
	DatabaseLimit int NOT NULL,
	SqlServerType int NOT NULL,
	TenantType int NOT NULL,
	IsAvailable bit NOT NULL DEFAULT '1',
	IsActive bit NOT NULL DEFAULT '1',
  CONSTRAINT [PK_BOLDTC_SQLSERVER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SqlElasticPool] (
	Id int IDENTITY(1,1) NOT NULL,
	PoolName nvarchar(255) NOT NULL UNIQUE,
	SqlServerId int NOT NULL,
	DatabaseLimit int NOT NULL,
	SqlServerType int NOT NULL,
	TenantType int NOT NULL,
	IsAvailable bit NOT NULL DEFAULT '1',
	IsActive bit NOT NULL DEFAULT '1',
  CONSTRAINT [PK_BOLDTC_SQLELASTICPOOL] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_Tenant] (
	Id uniqueidentifier NOT NULL,
	DNS nvarchar(255) NOT NULL,
	Subdomain nvarchar(255) NULL,
	TenantIdentifier nvarchar(255) NULL,
	TenantName nvarchar(255)NOT NULL,
	CustomDomain nvarchar(255) NULL,
	UseSiteIdentifier bit NOT NULL DEFAULT 1,
	UserId uniqueidentifier NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	IsInternal bit NOT NULL DEFAULT 0,
  CONSTRAINT [PK_BOLDTC_TENANT] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SaaSPlan] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	PlanSchema nvarchar(max),
	ModifiedDate datetime NOT NULL,
	IsInternal bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SAASPLAN] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantLogType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100),
	IsActive bit,
  CONSTRAINT [PK_BOLDTC_TENANTLOGTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantLog] (
	Id uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	TenantLogType int NOT NULL,
	LogComments nvarchar(max),
	IpAddress nvarchar(100) NULL,
	FromStatus int Null,
	ToStatus int Not Null,
	UpdatedUserId uniqueidentifier NULL,
	SourceTypeId int Null,
	OptionalData nvarchar(max) NULL,
	CreatedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTLOG] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantStatus] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTSTATUS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_Coupon] (
	Id int IDENTITY(1,1) NOT NULL,
	Coupon nvarchar(255) NOT NULL UNIQUE,
	CouponLimit int NOT NULL,
	CouponDuration int NOT NULL,
	CouponExpirationDate int NOT NULL,
	CreateDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	CreatedById uniqueidentifier NOT NULL,
	ModifiedById uniqueidentifier NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_COUPON] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_UserPreference] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	Language nvarchar(4000),
	TimeZone nvarchar(100),
	RecordSize int,
	ItemSort nvarchar(4000),
	ItemFilters nvarchar(4000),
	Notifications nvarchar(4000),
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_USERPREFERENCE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_User] (
	Id uniqueidentifier NOT NULL,
	FirstName nvarchar(255) NOT NULL,
	LastName nvarchar(255),
	DisplayName nvarchar(512),
	Username nvarchar(255) NOT NULL,
	Email nvarchar(350) NOT NULL UNIQUE,
	Password nvarchar(512) NOT NULL,
	Contact nvarchar(20),
	Company nvarchar(255) NULL,
	Picture nvarchar(100),
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime,
	LastLogin datetime,
	PasswordChangedDate datetime,
	ActivationExpirationDate datetime NOT NULL,
	ActivationCode nvarchar(255) NOT NULL,
	VerificationCode nvarchar(100) NULL,
	ResetPasswordCode nvarchar(255),
	LastResetAttempt datetime,
	ExternalProviderId nvarchar(512),
	DirectoryTypeId int NOT NULL,
	IsActivated bit NOT NULL,
    ActivationMethod nvarchar(20),
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	Status int NULL,
	IsMfaEnabled bit NOT NULL DEFAULT '0',
	MfaType int NULL,
  CONSTRAINT [PK_BOLDTC_USER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_UserLogin] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	SessionId uniqueidentifier NULL,
	DirectoryTypeId int not null,
	ClientToken nvarchar(4000) NOT NULL,
	LoggedInDomain nvarchar(255) NOT NULL,
	IpAddress nvarchar(255) NOT NULL,
	Browser nvarchar(255) NULL,
	LoggedInTime datetime NOT NULL,
	LastActive datetime NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_USERLOGIN] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;
CREATE TABLE [BOLDTC_TMUserGroup] (
	Id int IDENTITY(1,1) NOT NULL,
	GroupId int NOT NULL,
	UserId uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TMUSERGROUP] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TMGroup] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	Description nvarchar(1026),
	Color nvarchar(255) NOT NULL,
	DirectoryTypeId int NOT NULL,
	ExternalProviderId nvarchar(512),
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TMGroup] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantUser] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	IsFavorite bit NOT NULL DEFAULT '0',
	IsActive bit NOT NULL,
    LastAccessedDate datetime NULL,
  CONSTRAINT [PK_BOLDTC_TENANTUSER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_DirectoryType] (
	Id int IDENTITY(1,1) NOT NULL,
	DirectoryName nvarchar(100) NOT NULL UNIQUE,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_DIRECTORYTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_RecurrenceType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_RECURRENCETYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_Schedule] (
	Id int IDENTITY(1,1) NOT NULL,
	RecurrenceInfo nvarchar(4000) NOT NULL,
	RecurrenceTypeId int NOT NULL,
	ScheduleTypeId int NOT NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	EndAfter int NOT NULL,
	NextSchedule datetime NOT NULL,
	IsEnabled bit NOT NULL,
	CreatedById uniqueidentifier NOT NULL,
	ModifiedById uniqueidentifier NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SCHEDULE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_ScheduleType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SCHEDULETYPE] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_ScheduleLog] (
	Id int IDENTITY(1,1) NOT NULL,
	ScheduleId int NOT NULL,
	ScheduleStatusId int NOT NULL,
	ExecutedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SCHEDULELOG] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_ScheduleStatus] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SCHEDULESTATUS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SAMLSettings] (
	Id int IDENTITY(1,1) NOT NULL,
	ApplicationId nvarchar(100),
	ApplicationIdURI nvarchar(4000),
	TenantName nvarchar(100),
	MobileApplicationId nvarchar(100),
	IsSloEnabled bit NOT NULL,
	IsEnabled bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SAMLSETTINGS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SystemSettings] (
	Id int IDENTITY(1,1) NOT NULL,
	SystemKey nvarchar(255) NOT NULL UNIQUE,
	SystemValue nvarchar(4000),
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SYSTEMSETTINGS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_AzureADCredential] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantName nvarchar(255),
	ClientId nvarchar(100),
	ClientSecret nvarchar(100),
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_AZUREADCREDENTIAL] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantType] (
	Id int IDENTITY(1,1) NOT NULL,
	Type nvarchar(255) NOT NULL UNIQUE,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantInfo] (
	Id uniqueidentifier NOT NULL,
	TenantId uniqueidentifier NOT NULL,
	TenantTypeId int NOT NULL,
	ClientSecret nvarchar(512) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	SaaSPlanId int,
	DatabaseType int Default 0,
	BlobConnectionString nvarchar(max),
	ConnectionString nvarchar(max),
	SchemaName nvarchar(max),
	Prefix nvarchar(max),
	AdditionalParameters nvarchar(max),
	MaintenanceDatabase nvarchar(255) NULL,
	TenantSQLServerId int,
	ElasticPoolId int,
	ImDbDatabaseType int Default 0,
	ImDbConnectionString nvarchar(max),
	ImDbSqlServerId int,
	ImDbElasticPoolId int,
	ImDbMaintenanceDatabase nvarchar(255) NULL,
	ImDbAdditionalParameters nvarchar(max),
	TenantStatus int NOT NULL,
	BillingAddressId uniqueidentifier,
	StatusUpdatedDate datetime NOT NULL,
	PaymentStatus nvarchar(50),
	RecurringPaymentDate datetime,
	IsTrialExpired bit NOT NULL,
	IsActive bit NOT NULL,
	IsDeleted bit NOT NULL,
	IsMaster bit NOT NULL,
	IsolationCode nvarchar(4000),
	IsTenantIsolationCodeEnabled bit NOT NULL DEFAULT '0',
	IsRowLevelSecurityEnabled bit NOT NULL DEFAULT '1',
    ResourceLimitationSettings nvarchar(max),
	UseCustomBranding bit NOT NULL,
	IsNewImDbDatabase bit NOT NULL,
	IsNewDatabase bit NOT NULL,
	StorageType int NOT NULL
  CONSTRAINT [PK_BOLDTC_TENANTINFO] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_UserBillingAddress] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	BillingEmail nvarchar(255) NOT NULL,
	BillingAddress nvarchar(max) NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_USERBILLINGADDRESS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_AccountDeleteRequest] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	UserTenantStatus nvarchar(max) NULL,
	RequestedTime datetime NOT NULL,
	CancelledTime datetime,
	DeletedTime datetime,
	IsCancelled bit,
	IsDeleted bit NOT NULL,
	IsActive bit NOT NULL
  CONSTRAINT [PK_BOLDTC_ACCOUNTDELETEREQUEST] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_Addon] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	StripePlanId nvarchar(255) NOT NULL,
	PlanSchema nvarchar(max),
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_ADDON] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TenantAddon] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	AddonId int NOT NULL,
	Quantity int NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	LastPaymentDate datetime NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TENANTADDON] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_CustomPlan] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	Price int NOT NULL,
	PlanInfo nvarchar(max),
	HasTrial bit NOT NULL,
	TrialDays int NOT NULL,
	IsEnterprise bit Null,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_CUSTOMPLAN] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_Country] (
  [Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
  [Name] [nvarchar](100) NOT NULL,
  [CountryCode] [nvarchar](2) NOT NULL,
  [IsActive] [bit] NOT NULL
)
;
CREATE TABLE [BOLDTC_ExternalIdP] (
	Id uniqueidentifier NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	Detail nvarchar(max) NOT NULL,
	DirectoryTypeId int NOT NULL,
	CredentialTypeId int NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_EXTERNALIDP] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_IdPCredentialType] (
	Id int IDENTITY(1,1) NOT NULL,
	CredentialType nvarchar(255) NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_IDPCREDENTIALTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SqlElasticPoolEdition] (
	Id int IDENTITY(1,1) NOT NULL,
	PoolEditionName varchar(255) NOT NULL,
	PoolDtu int NOT NULL,
	PoolStorageinGB int NOT NULL,
	DatabaseDtuMinInGB int NOT NULL,
	DatabaseDtuMaxInGB int NOT NULL,
	DatabaseLimit int NOT NULL,
	Region varchar(255) NOT NULL,
	IsCurrent bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_ELASTICPOOLEDITION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SqlServerEdition] (
	Id int IDENTITY(1,1) NOT NULL,
	Version varchar(255) NOT NULL,
	DatabaseLimit int NOT NULL,
	Region nvarchar(100) NOT NULL,
	IsCurrent bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SQLSERVEREDITION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TMUser] (
	Id int IDENTITY(1,1) NOT NULL,
	UserId uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TMUSER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_SqlServerType] (
	Id int IDENTITY(1,1) NOT NULL,
	SqlServerType nvarchar(255) NOT NULL UNIQUE,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SQLSERVERTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;
CREATE TABLE [BOLDTC_OAuthToken](
    [Id] int IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](max) NULL,
	[Ticket] [nvarchar](max) NULL,
	[ModifiedDate] [datetime] NULL,
	CONSTRAINT [PK_BOLDTC_OAUTHTOKEN] PRIMARY KEY CLUSTERED
	  (  [Id] ASC  ) WITH (IGNORE_DUP_KEY = OFF)
)
;
CREATE TABLE [BOLDTC_InternalApps](
	[Id] int IDENTITY(1,1) NOT NULL,
	[ClientId] uniqueidentifier NOT NULL UNIQUE,
	[ClientSecret] nvarchar(max) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[URL] nvarchar(100) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[IsActive] bit NOT NULL,
	CONSTRAINT [PK_BOLDTC_INTERNALAPPS] PRIMARY KEY CLUSTERED
	  (  [Id] ASC  ) WITH (IGNORE_DUP_KEY = OFF)
)
;
CREATE TABLE [BOLDTC_FormType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	Url nvarchar(4000) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_FORMTYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_RegistrationFormVersion] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	FormTypeId int NOT NULL,
	Location nvarchar(255) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsLatest bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_REGISTRATIONFORMVERSION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_TermsOfUseVersion] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	Location nvarchar(255) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsLatest bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TermsOfUseVersion] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_PrivacyPolicyVersion] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(255) NOT NULL,
	Location nvarchar(255) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsLatest bit NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_PRIVACYPOLICYVERSION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_PrivacyAcceptance] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	PrivacyPolicyVersion int NOT NULL,
	TermsOfUseVersion int NOT NULL,
	RegistrationFormVersion int NOT NULL,
	IpAddress nvarchar(50) NOT NULL,
	Country nvarchar(100) NOT NULL,
	Url nvarchar(4000) NOT NULL,
	HttpHeaders nvarchar(max) NOT NULL,
	DateTime datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_PRIVACYACCEPTANCE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;
CREATE TABLE [BOLDTC_FeedBack] (
	Id int IDENTITY(1,1) NOT NULL,
	UserId uniqueidentifier NOT NULL,
	IncidentId int NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	FeedbackFormId int NOT NULL,
	Experience Nvarchar(20) Null,
	FeedbackSubject Nvarchar(20) Null,
	CancelReason Nvarchar(max) Null,
	Comments Nvarchar(max) NULL,
	CanContact bit NOT NULL,
	CreatedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_FEEDBACK] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)

;
CREATE TABLE [BOLDTC_Support] (
	Id int IDENTITY(1,1) NOT NULL,
	IncidentId int NOT NULL,
	UpdateId int NOT NULL,
	TenantInfoId uniqueidentifier NULL,
	IsConciergeSupport bit NOT NULL,
	CreatedBy uniqueidentifier NOT NULL,
	CreatedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_Support] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)

;
CREATE TABLE [BOLDTC_TenantActivity] (
	Id int IDENTITY(1,1) NOT NULL,
	ItemId uniqueidentifier NULL,
	ChildId nvarchar(max) NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	ItemType nvarchar(max) NOT NULL,
	ItemSubType nvarchar(max) NOT NULL,
	Action nvarchar(max) NOT NULL,
	DetailActionId int NOT NULL DEFAULT 0,
	ActivityLogInfo nvarchar(max) NULL,
	LoggedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TenantActivity] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;
;
CREATE TABLE [BOLDTC_PreviewFeatures] (
	Id int IDENTITY(1,1) NOT NULL,
	FeatureName nvarchar(255) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	Value nvarchar(max) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_PreviewFeatures] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)

;
CREATE TABLE [BOLDTC_KcTenants](
    [Id] [uniqueidentifier] NOT NULL,
    [TenantInfoId] [uniqueidentifier] NOT NULL,
    [KcId] [int] Not NULL,
    [KcName] nvarchar(1024) NOT NULL,
    [CreatedDate] [datetime] NULL,
    [ModifiedDate] [datetime] NULL,
    [IsActive] [bit] NOT NULL,
    CONSTRAINT [BOLDTC_KcTenants_PK] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (IGNORE_DUP_KEY = OFF))
;
CREATE TABLE [BOLDTC_SSLCertificate](
    [Id] [uniqueidentifier] NOT NULL,
	[ThumbPrint] nvarchar(1024) NOT NULL,
	[HostNames] nvarchar(max) NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[CreatedById] uniqueidentifier NOT NULL,
	[ModifiedById] uniqueidentifier NOT NULL,
    [CreatedDate] [datetime] NOT NULL,
    [ModifiedDate] [datetime] NOT NULL,
    [IsActive] [bit] NOT NULL,
    CONSTRAINT [BOLDTC_SSLCertificate_PK] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (IGNORE_DUP_KEY = OFF))
;
CREATE TABLE [BOLDTC_SSLMapping](
    [Id] int IDENTITY(1,1) NOT NULL,
	[TenantId] uniqueidentifier NOT NULL,
	[CertificateId] uniqueidentifier NOT NULL,
	[CreatedById] uniqueidentifier NOT NULL,
    [CreatedDate] [datetime] NOT NULL,
    [IsActive] [bit] NOT NULL,
    CONSTRAINT [BOLDTC_SSLMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (IGNORE_DUP_KEY = OFF))
;

;
CREATE TABLE [BOLDTC_SalesRequests] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	CreatedDate datetime NOT NULL,
	IsActive bit NOT NULL,
	CONSTRAINT [PK_BOLDTC_SALESREQUESTS] PRIMARY KEY CLUSTERED
	(
	[Id] ASC
	) WITH (IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [BOLDTC_IntranetProductType](
    [Id] int IDENTITY(1,1) NOT NULL,
	[ProductId] int NOT NULL,
	[ProductName] nvarchar(1024) NOT NULL,
    [IsActive] [bit] NOT NULL,
    CONSTRAINT [BOLDTC_IntranetProductType_PK] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (IGNORE_DUP_KEY = OFF))
;

CREATE TABLE [BOLDTC_SourceType] (
	Id int IDENTITY(1,1) NOT NULL,
	Name nvarchar(100) NOT NULL,
	URL nvarchar(100) NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SOURCETYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_AuthType] (
    Id int IDENTITY(1,1) NOT NULL,
    Name nvarchar (255) NOT NULL UNIQUE,
    ModifiedDate DateTime NOT NULL,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_AuthType] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_AuthProvider] (
    Id int IDENTITY(1,1) NOT NULL,
    Name nvarchar (255) NOT NULL UNIQUE,
    AuthTypeId int NOT NULL,
    ModifiedDate DateTime NOT NULL,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_AuthProvider] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_GlobalAuthControl] (
    Id int IDENTITY(1,1) NOT NULL,  
    TenantInfoId  uniqueidentifier NOT NULL,
	AuthTypeId int NOT NULL,
    IsEnabled bit NOT NULL,
    CreatedBy uniqueidentifier NOT NULL,
    ModifiedBy uniqueidentifier NOT NULL,
    CreatedDate datetime NOT NULL,
    ModifiedDate datetime NOT NULL,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_GlobalAuthControl] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_AuthSettings] (
    Id int IDENTITY(1,1) NOT NULL,  
    TenantInfoId uniqueidentifier NULL,
    AuthProviderId int NOT NULL,
    Settings nvarchar(max),
    EncryptionValues nvarchar(max),
    IsEnabled bit NOT NULL,
    CreatedBy uniqueidentifier NULL,
    ModifiedBy uniqueidentifier NULL,
    CreatedDate datetime NOT NULL,
    ModifiedDate datetime NOT NULL,
	IsDefaultAuthentication bit NOT NULL Default 0,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_AuthSettings] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_UserLog] (
	Id int IDENTITY(1,1) NOT NULL,
	LogAction nvarchar(255) NOT NULL,
	UserId uniqueidentifier NULL,
	Message nvarchar(max) NOT NULL,
	RequestedById uniqueidentifier NULL,
	IpAddress nvarchar(100) NOT NULL,
	LogDate datetime NOT NULL,
	ReferrerUrl nvarchar(max) NULL,
	IsActive bit NOT NULL,
	AdditionalData nvarchar(max) NULL,
	Source int NULL,
  CONSTRAINT [PK_BOLDTC_UserLog] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_ActivityLog]
(
	Id int IDENTITY(1,1) NOT NULL,
	EventCategory nvarchar(100) NOT NULL,
	EventType nvarchar(100) NOT NULL,
	EventDate datetime NOT NULL,
	InitiatedBy nvarchar(255) NULL,
	TargetUser nvarchar(255) NULL,
	IpAddress nvarchar(100) NOT NULL,
    AppSource nvarchar(255) NULL,
	AppType nvarchar(255) NULL,
	EventLog nvarchar(max) NULL,
	ClientId nvarchar(100) NULL,
	UserAgent nvarchar(255) NULL,
	IsActive bit NOT NULL,
	CanDelete bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_ActivityLog] PRIMARY KEY CLUSTERED
    (
    [Id] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
;


CREATE TABLE [BOLDTC_AzureBlob] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	AccountName nvarchar(max) NOT NULL,
	AccessKey nvarchar(max) NOT NULL,
	Uri nvarchar(max) NULL,
	ContainerName nvarchar(max) NOT NULL,
	ConnectionType nvarchar(max) NOT NULL,
	ConnectionString nvarchar(max) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_AzureBlob] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_UserStatus] (
	Id int IDENTITY(1,1) NOT NULL,
	Status nvarchar(100) NOT NULL,
	Value int NOT NULL UNIQUE,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_USERSTATUS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;

CREATE TABLE [BOLDTC_UserToken] (
	Id uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	Name nvarchar(255) NOT NULL,
	Value nvarchar(255) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_USERTOKEN] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;

CREATE TABLE [BOLDTC_MfaType] (
	Id int IDENTITY(1,1) NOT NULL,
	Type nvarchar(100) NOT NULL,
	Value int NOT NULL UNIQUE,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_MFATYPE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;

CREATE TABLE [BOLDTC_Source] (
	Id int IDENTITY(1,1) NOT NULL,
	Type nvarchar(100) NOT NULL,
	Value int NOT NULL UNIQUE,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_SOURCE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
;

CREATE TABLE [BOLDTC_EmailActivityLog](
	Id int IDENTITY(1,1) NOT NULL,
	Event nvarchar(255) NOT NULL,
	RecipientEmail nvarchar(255) NOT NULL,
	SenderEmail nvarchar(255) NOT NULL,
	MailSubject nvarchar(255) NOT NULL,
	MailBody nvarchar(max) NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NULL,
	InitiatedBy nvarchar(255) NULL,
	UserId uniqueidentifier NOT NULL,
	Status int NOT NULL,
	StatusMessage nvarchar(max) NULL,
	IsActive bit NOT NULL
	 CONSTRAINT [PK_BOLDTC_EMAILACTIVITYLOG] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
  
  )
;

CREATE TABLE [BOLDTC_QueryMetrics] ( 
    Id int IDENTITY(1,1),
    DashboardID nvarchar(100),
    WidgetID nvarchar(100), 
    WidgetName nvarchar(100) , 
    QueryStartTime datetimeoffset, 
    QueryEndTime datetimeoffset, 
    Query nvarchar(max) , 
    QueryStatus nvarchar(100), 
    Rowsretrieved bigint, 
    QueryPlan nvarchar(max), 
    TrackingId nvarchar(100), 
    QueryType nvarchar(100), 
    QueryExecutiontime nvarchar(100), 
    DashboardName nvarchar(100), 
    UserName nvarchar(100), 
    TenantId uniqueidentifier, 
    UserId nvarchar(100), 
    DataSourceID nvarchar(100), 
    DataSourceName nvarchar(100),
    CONSTRAINT [PK_BOLDTC_QUERYMETRICS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_Credentials] (
    Id uniqueidentifier NOT NULL,
    Name nvarchar(100) NOT NULL,
    Description nvarchar(100) NOT NULL,
    Credentials nvarchar(1026) NOT NULL,
    CredentialTypeId int NOT NULL,
    CreatedDate datetime NOT NULL,
    ModifiedDate datetime NOT NULL,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_Credentials] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
);

CREATE TABLE [BOLDTC_TenantSettings] (
	Id int IDENTITY(1,1) NOT NULL,
	TenantInfoId uniqueidentifier NOT NULL,
	Settings nvarchar(max) NOT NULL,
	CreatedDate datetime NOT NULL,
	ModifiedDate datetime NOT NULL,
	IsActive bit NOT NULL,
  CONSTRAINT [PK_BOLDTC_TenantSettings] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
;

CREATE TABLE [BOLDTC_UserAttributes](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](4000) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Encrypt] [bit] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedById] [uniqueidentifier] NULL,
	[ModifiedById] [uniqueidentifier] NULL,
    [CreatedDate] [datetime] NOT NULL,
    [ModifiedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL)
;

CREATE TABLE [BOLDTC_BackUp](
    Id int IDENTITY(1,1) NOT NULL,
    ConfigurationData nvarchar(max) NOT NULL,
    PrivateKey nvarchar(max) NOT NULL,
    ModifiedDate datetime NOT NULL,
    IsActive bit NOT NULL
);

CREATE TABLE [BOLDTC_CustomEmailTemplate](
[Id] [int] IDENTITY(1,1) primary key NOT NULL,
[IsEnabled] [bit] NULL,
[DisclaimerContent] [nvarchar](255) NOT NULL,
[HeaderContent] [nvarchar](255) NULL,
[Subject] [nvarchar](255) NULL,
[TemplateName] [nvarchar](255) NULL,
[Language] [nvarchar](255) NOT NULL,
[MailBody] [nvarchar](max) NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedDate] [datetime] NULL,
[SendEmailAsHTML] [bit] NOT NULL,
[IsActive] [bit] NOT NULL,
[TemplateId] [int] NOT NULL,
[IsDefaultTemplate][bit] NOT NULL,
[IsSystemDefault][bit] NOT NULL,
[Description][nvarchar](255) NULL,
[ModifiedBy][uniqueidentifier] NOT NULL,
[TemplateLocalizationKey][nvarchar](255) NULL);

CREATE TABLE [BOLDTC_AICredentials](
    [Id] uniqueidentifier NOT NULL,
    [AIModel] [int] NOT NULL,
    [AIConfiguration] [nvarchar](4000) NULL,
    [CreatedById] [uniqueidentifier] NULL,
    [ModifiedById] [uniqueidentifier] NULL,
    [CreatedDate] [datetime] NOT NULL,
    [ModifiedDate] [datetime] NOT NULL,
    [IsActive] [bit] NOT NULL)
;

CREATE TABLE [BOLDTC_TenantStorageDetails] (
    Id uniqueidentifier NOT NULL,
    TenantInfoId uniqueidentifier NOT NULL,
    StorageType int NOT NULL,
    ConnectionInfo nvarchar(1026),
    CreatedDate datetime NOT NULL,
    ModifiedDate datetime NOT NULL,
    IsActive bit NOT NULL,
    CONSTRAINT [PK_BOLDTC_TenantStorageDetails] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
);

INSERT [BOLDTC_TenantLogType] ([Name], [IsActive]) VALUES (N'Registration', 1)
INSERT [BOLDTC_TenantLogType] ([Name], [IsActive]) VALUES (N'StatusUpdated', 1)
INSERT [BOLDTC_TenantLogType] ([Name], [IsActive]) VALUES (N'PaymentUpdated', 1)
INSERT [BOLDTC_TenantLogType] ([Name], [IsActive]) VALUES (N'SubscriptionUpdated', 1)
INSERT [BOLDTC_TenantLogType] ([Name], [IsActive]) VALUES (N'BillingAddressUpdated', 1)

INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'AccountActivationPending', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'PaymentPending', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'SubscriptionCreationInProgress', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'SubscriptionCreationFailed', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'DeploymentPending', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'DBDeploymentInProgress', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'DBDeploymentFailed', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'StorageDeploymentInProgress', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'StorageDeploymentFailed', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'ServerDeploymentInProgress', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'ServerDeploymentFailed', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'DeploymentFailed', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'Active', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'SubscriptionCancelled', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'MarkedForSuspension', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'Suspended', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'MarkedForDeletion', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'Expired', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'SubscriptionDeleted', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'DBDeleted', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'StorageDeleted', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'Deleted', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'Trial', 1)
INSERT [BOLDTC_TenantStatus] ([Name], [IsActive]) VALUES (N'ActivePaymentRequired', 1)

INSERT into [BOLDTC_ScheduleStatus] (Name,IsActive) VALUES (N'Success', 1)
INSERT into [BOLDTC_ScheduleStatus] (Name,IsActive) VALUES (N'Failure', 1)


INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Daily', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'DailyWeekDay', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Weekly', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Monthly', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'MonthlyDOW', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Yearly', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'YearlyDOW', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Time', 1)
INSERT into [BOLDTC_RecurrenceType] (Name,IsActive) VALUES (N'Hourly',1)

INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'AccountActivationReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'PaymentDetailsUpdateReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'SuspendGraceReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'DeletionGraceReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'NewTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'SuspensionPendingTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'DeletionPendingTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'SuspendedTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'DeletedTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'SubscriptionCancelledTenantListReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'ServerAvailabilityCheckReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'ResourceDeletionGraceReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'ResourceDeletedReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'CreateBlobSnapshotReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'DeleteExpiredBlobSnapshotReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'MarkForSuspensionReminder', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'SubscriptionCancelled', 1)
INSERT into [BOLDTC_ScheduleType] (Name,IsActive) VALUES (N'KnownCompanyExcessStorageUsageReminder', 1)

INSERT into [BOLDTC_CouponLogType] (Name,IsActive) VALUES (N'Added',1)
INSERT into [BOLDTC_CouponLogType] (Name,IsActive) VALUES (N'Updated',1)
INSERT into [BOLDTC_CouponLogType] (Name,IsActive) VALUES (N'Used',1)
INSERT into [BOLDTC_CouponLogType] (Name,IsActive) VALUES (N'Suspended',1)
INSERT into [BOLDTC_CouponLogType] (Name,IsActive) VALUES (N'Deleted',1)

INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'Local',1)
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'AzureAD',1)
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'ExternalDatabase',1)
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'GSuite',1)
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'WindowsAD',1)
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'Syncfusion',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'OAuth2',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'OpenIDConnect',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'LinkedIn',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'Google',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'GitHub',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'Facebook',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'Twitter',1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'JWTSSO',1);

INSERT into [BOLDTC_TMGroup] ([Name],[Description],[Color],[DirectoryTypeId],[ModifiedDate],[IsActive]) VALUES (N'System Administrator','Has administrative rights for the dashboards','#ff0000',1,GETUTCDATE(), 1)

INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'5 Users', N'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'25 Users', N'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'50 Users', N'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'75 Users', N'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'100 Users', N'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'KC Benefits', N'NA', GETDATE(), 1, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) VALUES (N'Bold Bi', N'jOS8fQeRafN+OmuhkdZzib0vs/mdtxFFcqEvSrU+PgxyYJpSQ0aFq3fJQH8lY9dBEyuxDuN6o0St2yX46CmVbqz8JwG8rjHiUlw2FdR8y8vkmeUSFtf82U3fUq+8nemokA4r0JMk/K8mSkbAE6/2E9KodobNGV+uOQSgl4cmcaT4zH8fdfwbS+AeUB0jUmOYJpmOxGYJnRDcolin9CW6g8wv7FSEcYpIPST26ifmxGSLG+W+hVYNY7oXV3Pk4iqBirlGftktvkvaG1ua0xAKacjq0zND/JLWj2fmouQqGhZ1M+dvKyLiTcvIVBWkCxRXdFEaf7pCuGWuxVlhSgfBvq+ZWTuevkoerL6Dv3xANqnMs7rpSRJSF62B4q7MNSa5M/uvdiQ9d/chGsENg1YxS3ZSk6/tRtbP5H4Pmog0rFmkvvImEyGFmYrBo5rq5vHm7vj3O8RlBXWi7oaoNxopp5aoTAfEILO1E0+UGf6rzWDiyYa3JzPtRALnVbWi8fW7vNAGp+sYtcflwCf/EUbz4GJC1bYzU5GnL0y9ijQ+MywNJ4pZWLtA4wDIhrYCF9eB1/yViU/4EtAOWNUeav23T3miiurnc1DMHeM9KRDg/c7+QGhNySPcuYCjYlOsW+XqXTzsxji0okUEUvTk5seJIdqELLR42jNya5s4NW21Mc9lE7iGzOMeJWyWAHqV8Wnj3Rmmmf2F+9yKL3Qlx7GEeAD2Jswo3+iMPm54VGpiMuHOAm/WM63bxl9w/1EpXpM1vRZux8WBoRjH9BGMKSw0lQ==', GETDATE(), 1, 1)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) values ('Business 10', 'NA', GETDATE(), 0, 0)
INSERT [BOLDTC_SaaSPlan] ([Name], [PlanSchema], [ModifiedDate], [IsInternal], [IsActive]) values ('Business 25', 'NA', GETDATE(), 0, 0)

INSERT into [BOLDTC_TenantType] ([Type],IsActive) VALUES (N'BoldBI',1)
INSERT into [BOLDTC_TenantType] ([Type],IsActive) VALUES (N'BoldReports',1)
INSERT into [BOLDTC_TenantType] ([Type],IsActive) VALUES (N'BoldBIOn-Premise',1)
INSERT into [BOLDTC_TenantType] ([Type],IsActive) VALUES (N'BoldReportsOn-Premise',1)

INSERT [BOLDTC_Addon] ([Name], [StripePlanId], [PlanSchema], [ModifiedDate], [IsActive]) VALUES (N'AdditionalDataStorage', N'additional_data_storage', '', GETUTCDATE(), N'True')
INSERT [BOLDTC_Addon] ([Name], [StripePlanId], [PlanSchema], [ModifiedDate], [IsActive]) VALUES (N'CustomDomain', N'custom_domain', '', GETUTCDATE(), N'True')

INSERT INTO [BOLDTC_SqlServerEdition] VALUES('V12', 4000, 'East US', 1, 1)
;

INSERT INTO [BOLDTC_SqlElasticPoolEdition] ([PoolEditionName],[PoolDtu],[PoolStorageinGB],[DatabaseDtuMinInGB],[DatabaseDtuMaxInGB],[DatabaseLimit],[IsCurrent],[IsActive],[Region]) VALUES('Standard', 50, 50, 0, 50, 100, 1, 1, 'East US')
;

INSERT into [BOLDTC_SqlServerType] ([SqlServerType],[ModifiedDate],[IsActive]) VALUES (N'TenantSqlServer',GETUTCDATE(),1)
;
INSERT into [BOLDTC_SqlServerType] ([SqlServerType],[ModifiedDate],[IsActive]) VALUES (N'IntermediateSqlServer',GETUTCDATE(),1)
;

INSERT INTO [BOLDTC_SqlServer] ([ServerName],[UserName],[Password],[DatabaseLimit],[SqlServerType],[TenantType],[IsAvailable],[IsActive]) VALUES (N'dev-boldbi-tenants',N'dashboard-admin',N'',3900,1,1,N'True',N'True');
;
INSERT INTO [BOLDTC_SqlElasticPool] ([PoolName],[SqlServerId],[DatabaseLimit],[SqlServerType],[TenantType],[IsAvailable],[IsActive]) VALUES (N'dev-boldbi-tenant-pool',1,95,1,1,N'True',N'True');
;
INSERT INTO [BOLDTC_SqlServer] ([ServerName],[UserName],[Password],[DatabaseLimit],[SqlServerType],[TenantType],[IsAvailable],[IsActive]) VALUES (N'dev-boldbi-datastore',N'datastore-admin',N'',3900,2,1,N'True',N'True');
;
INSERT INTO [BOLDTC_SqlElasticPool] ([PoolName],[SqlServerId],[DatabaseLimit],[SqlServerType],[TenantType],[IsAvailable],[IsActive]) VALUES (N'dev-boldbi-data-pool',2,95,2,1,N'True',N'True');
;

INSERT [BOLDTC_AuthType] ([Name], [ModifiedDate], [IsActive]) VALUES ( N'OAuth', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthType] ([Name], [ModifiedDate], [IsActive]) VALUES ( N'OIDC', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthType] ([Name], [ModifiedDate], [IsActive]) VALUES ( N'SAML', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthType]([Name],[ModifiedDate],[IsActive])VALUES( N'DefaultAuth', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthType]([Name],[ModifiedDate],[IsActive])VALUES( N'JWTSSO', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthType]([Name],[ModifiedDate],[IsActive])VALUES( N'WindowsAD', GETUTCDATE(), 1);

INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES ( N'CustomOAuth', 1, GETUTCDATE(), 1);
INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES ( N'CustomOIDC', 2, GETUTCDATE(), 1);
INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES ( N'AzureAD', 3, GETUTCDATE(), 1);
INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES ( N'JWTSSO', 5, GETUTCDATE(), 1);
INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES ( N'WindowsAD', 6, GETUTCDATE(), 1);

INSERT into [BOLDTC_UserStatus] ([Status],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'NotActivated', 0, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_UserStatus] ([Status],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Activated', 1, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_UserStatus] ([Status],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Locked', 2, GETUTCDATE(), GETUTCDATE(), 1)
;

INSERT into [BOLDTC_MfaType] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Authenticator', 1, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_MfaType] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Email', 2, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_MfaType] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'SMS', 3, GETUTCDATE(), GETUTCDATE(), 1)
;

INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Identity Provider Web', 1, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Identity Provider API', 2, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Tenant Management Web', 3, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Dashboard Server Web', 4, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Dashboard Server API', 5, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Dashboard Server Jobs', 6, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Report Server Web', 7, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Report Server API', 8, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Report Server Jobs', 9, GETUTCDATE(), GETUTCDATE(), 1)
;
INSERT into [BOLDTC_Source] ([Type],[Value],[CreatedDate],[ModifiedDate],[IsActive]) VALUES (N'Admin Utility', 10, GETUTCDATE(), GETUTCDATE(), 1)
;

INSERT [BOLDTC_AuthType]([Name],[ModifiedDate],[IsActive])VALUES( N'AzureADB2C', GETUTCDATE(), 1);
INSERT [BOLDTC_AuthProvider] ([Name], [AuthTypeId], [ModifiedDate], [IsActive]) VALUES (N'AzureADB2C', 7, GETUTCDATE(), 1);
INSERT into [BOLDTC_DirectoryType] (DirectoryName,IsActive) VALUES (N'AzureADB2C',1);



ALTER TABLE [BOLDTC_CouponLog] WITH CHECK ADD CONSTRAINT [BOLDTC_CouponLog_fk0] FOREIGN KEY ([CouponLogTypeId]) REFERENCES [BOLDTC_CouponLogType]([Id])

;
ALTER TABLE [BOLDTC_CouponLog] CHECK CONSTRAINT [BOLDTC_CouponLog_fk0]
;
ALTER TABLE [BOLDTC_CouponLog] WITH CHECK ADD CONSTRAINT [BOLDTC_CouponLog_fk1] FOREIGN KEY ([PaymentLogId]) REFERENCES [BOLDTC_TenantPaymentLog]([id])

;
ALTER TABLE [BOLDTC_CouponLog] CHECK CONSTRAINT [BOLDTC_CouponLog_fk1]
;

ALTER TABLE [BOLDTC_TenantPaymentSubscription] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantPaymentSubscription_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;
ALTER TABLE [BOLDTC_TenantPaymentSubscription] CHECK CONSTRAINT [BOLDTC_TenantPaymentSubscription_fk0]
;

ALTER TABLE [BOLDTC_TenantInvoiceDetails] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInvoiceDetails_fk0] FOREIGN KEY ([SubscriptionId]) REFERENCES [BOLDTC_TenantPaymentSubscription]([Id])
;

ALTER TABLE [BOLDTC_TenantPaymentLog] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantPaymentLog_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;
ALTER TABLE [BOLDTC_TenantPaymentLog] CHECK CONSTRAINT [BOLDTC_TenantPaymentLog_fk0]
;
ALTER TABLE [BOLDTC_TenantPaymentLog] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantPaymentLog_fk1] FOREIGN KEY ([SubscriptionId]) REFERENCES [BOLDTC_TenantPaymentSubscription]([Id])

;
ALTER TABLE [BOLDTC_TenantPaymentLog] CHECK CONSTRAINT [BOLDTC_TenantPaymentLog_fk1]
;

ALTER TABLE [BOLDTC_SqlElasticPool] WITH CHECK ADD CONSTRAINT [BOLDTC_SqlElasticPool_fk0] FOREIGN KEY ([SqlServerId]) REFERENCES [BOLDTC_SqlServer]([Id])

;
ALTER TABLE [BOLDTC_SqlElasticPool] CHECK CONSTRAINT [BOLDTC_SqlElasticPool_fk0]
;


ALTER TABLE [BOLDTC_Tenant] WITH CHECK ADD CONSTRAINT [BOLDTC_Tenant_fk0] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_Tenant] CHECK CONSTRAINT [BOLDTC_Tenant_fk0]
;

ALTER TABLE [BOLDTC_TenantLog] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantLog_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;
ALTER TABLE [BOLDTC_TenantLog] CHECK CONSTRAINT [BOLDTC_TenantLog_fk0]
;
ALTER TABLE [BOLDTC_TenantLog] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantLog_fk1] FOREIGN KEY ([TenantLogType]) REFERENCES [BOLDTC_TenantLogType]([Id])

;
ALTER TABLE [BOLDTC_TenantLog] CHECK CONSTRAINT [BOLDTC_TenantLog_fk1]
;
ALTER TABLE [BOLDTC_TenantLog] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantLog_fk2] FOREIGN KEY ([ToStatus]) REFERENCES [BOLDTC_TenantStatus]([Id])

;
ALTER TABLE [BOLDTC_TenantLog] CHECK CONSTRAINT [BOLDTC_TenantLog_fk2]
;

ALTER TABLE [BOLDTC_Coupon] WITH CHECK ADD CONSTRAINT [BOLDTC_Coupon_fk0] FOREIGN KEY ([CreatedById]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_Coupon] CHECK CONSTRAINT [BOLDTC_Coupon_fk0]
;
ALTER TABLE [BOLDTC_Coupon] WITH CHECK ADD CONSTRAINT [BOLDTC_Coupon_fk1] FOREIGN KEY ([ModifiedById]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_Coupon] CHECK CONSTRAINT [BOLDTC_Coupon_fk1]
;

ALTER TABLE [BOLDTC_UserPreference] WITH CHECK ADD CONSTRAINT [BOLDTC_UserPreference_fk0] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_UserPreference] CHECK CONSTRAINT [BOLDTC_UserPreference_fk0]
;

ALTER TABLE [BOLDTC_User] WITH CHECK ADD CONSTRAINT [BOLDTC_User_fk0] FOREIGN KEY ([DirectoryTypeId]) REFERENCES [BOLDTC_DirectoryType]([Id])

;
ALTER TABLE [BOLDTC_User] CHECK CONSTRAINT [BOLDTC_User_fk0]
;

ALTER TABLE [BOLDTC_UserLogin] WITH CHECK ADD CONSTRAINT [BOLDTC_UserLogin_fk0] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])
;
ALTER TABLE [BOLDTC_UserLogin] CHECK CONSTRAINT [BOLDTC_UserLogin_fk0]
;
ALTER TABLE [BOLDTC_UserLogin] WITH CHECK ADD CONSTRAINT [BOLDTC_UserLogin_fk1] FOREIGN KEY ([DirectoryTypeId]) REFERENCES [BOLDTC_DirectoryType]([Id])
;
ALTER TABLE [BOLDTC_UserLogin] CHECK CONSTRAINT [BOLDTC_UserLogin_fk1]
;

ALTER TABLE [BOLDTC_TMUserGroup] WITH CHECK ADD CONSTRAINT [BOLDTC_TMUserGroup_fk0] FOREIGN KEY ([GroupId]) REFERENCES [BOLDTC_TMGroup]([Id])

;
ALTER TABLE [BOLDTC_TMUserGroup] CHECK CONSTRAINT [BOLDTC_TMUserGroup_fk0]
;
ALTER TABLE [BOLDTC_TMUserGroup] WITH CHECK ADD CONSTRAINT [BOLDTC_TMUserGroup_fk1] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_TMUserGroup] CHECK CONSTRAINT [BOLDTC_TMUserGroup_fk1]
;

ALTER TABLE [BOLDTC_TMGroup] WITH CHECK ADD CONSTRAINT [BOLDTC_TMGroup_fk0] FOREIGN KEY ([DirectoryTypeId]) REFERENCES [BOLDTC_DirectoryType]([Id])

;
ALTER TABLE [BOLDTC_TMGroup] CHECK CONSTRAINT [BOLDTC_TMGroup_fk0]
;

ALTER TABLE [BOLDTC_TenantUser] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantUser_fk0] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])

;
ALTER TABLE [BOLDTC_TenantUser] CHECK CONSTRAINT [BOLDTC_TenantUser_fk0]
;
ALTER TABLE [BOLDTC_TenantUser] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantUser_fk1] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;
ALTER TABLE [BOLDTC_TenantUser] CHECK CONSTRAINT [BOLDTC_TenantUser_fk1]
;

ALTER TABLE [BOLDTC_Schedule] WITH CHECK ADD CONSTRAINT [BOLDTC_Schedule_fk0] FOREIGN KEY ([RecurrenceTypeId]) REFERENCES [BOLDTC_RecurrenceType]([Id])

;
ALTER TABLE [BOLDTC_Schedule] CHECK CONSTRAINT [BOLDTC_Schedule_fk0]
;
ALTER TABLE [BOLDTC_Schedule] WITH CHECK ADD CONSTRAINT [BOLDTC_Schedule_fk1] FOREIGN KEY ([ScheduleTypeId]) REFERENCES [BOLDTC_ScheduleType]([id])

;
ALTER TABLE [BOLDTC_Schedule] CHECK CONSTRAINT [BOLDTC_Schedule_fk1]
;
ALTER TABLE [BOLDTC_ScheduleLog] WITH CHECK ADD CONSTRAINT [BOLDTC_ScheduleLog_fk0] FOREIGN KEY ([ScheduleId]) REFERENCES [BOLDTC_Schedule]([id])

;
ALTER TABLE [BOLDTC_ScheduleLog] CHECK CONSTRAINT [BOLDTC_ScheduleLog_fk0]
;
ALTER TABLE [BOLDTC_ScheduleLog] WITH CHECK ADD CONSTRAINT [BOLDTC_ScheduleLog_fk1] FOREIGN KEY ([ScheduleStatusId]) REFERENCES [BOLDTC_ScheduleStatus]([Id])

;
ALTER TABLE [BOLDTC_ScheduleLog] CHECK CONSTRAINT [BOLDTC_ScheduleLog_fk1]
;

ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk0] FOREIGN KEY ([TenantId]) REFERENCES [BOLDTC_Tenant]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk0]
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk1] FOREIGN KEY ([TenantTypeId]) REFERENCES [BOLDTC_TenantType]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk1]
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk2] FOREIGN KEY ([SaaSPlanId]) REFERENCES [BOLDTC_SaaSPlan]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk2]
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk3] FOREIGN KEY ([TenantSQLServerId]) REFERENCES [BOLDTC_SqlServer]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk3]
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk4] FOREIGN KEY ([ElasticPoolId]) REFERENCES [BOLDTC_SqlElasticPool]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk4]
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantInfo_fk5] FOREIGN KEY ([TenantStatus]) REFERENCES [BOLDTC_TenantStatus]([Id])

;
ALTER TABLE [BOLDTC_TenantInfo] CHECK CONSTRAINT [BOLDTC_TenantInfo_fk5]
;

ALTER TABLE [BOLDTC_UserBillingAddress] WITH CHECK ADD CONSTRAINT [BOLDTC_UserBillingAddress_fk1] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;

ALTER TABLE [BOLDTC_TenantAddon] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantAddon_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;
ALTER TABLE [BOLDTC_TenantAddon] CHECK CONSTRAINT [BOLDTC_TenantAddon_fk0]
;
ALTER TABLE [BOLDTC_TenantAddon] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantAddon_fk1] FOREIGN KEY ([AddonId]) REFERENCES [BOLDTC_Addon]([Id])
;
ALTER TABLE [BOLDTC_TenantAddon] CHECK CONSTRAINT [BOLDTC_TenantAddon_fk1]
;

ALTER TABLE [BOLDTC_CustomPlan] WITH CHECK ADD CONSTRAINT [BOLDTC_CustomPlan_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;
ALTER TABLE [BOLDTC_CustomPlan] CHECK CONSTRAINT [BOLDTC_CustomPlan_fk0]
;

ALTER TABLE [BOLDTC_ExternalIdP] WITH CHECK ADD CONSTRAINT [BOLDTC_ExternalIdP_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;
ALTER TABLE [BOLDTC_ExternalIdP] CHECK CONSTRAINT [BOLDTC_ExternalIdP_fk0]
;
ALTER TABLE [BOLDTC_ExternalIdP] WITH CHECK ADD CONSTRAINT [BOLDTC_ExternalIdP_fk1] FOREIGN KEY ([DirectoryTypeId]) REFERENCES [BOLDTC_DirectoryType]([Id])
;
ALTER TABLE [BOLDTC_ExternalIdP] CHECK CONSTRAINT [BOLDTC_ExternalIdP_fk1]
;
ALTER TABLE [BOLDTC_ExternalIdP] WITH CHECK ADD CONSTRAINT [BOLDTC_ExternalIdP_fk2] FOREIGN KEY ([CredentialTypeId]) REFERENCES [BOLDTC_IdPCredentialType]([Id])
;
ALTER TABLE [BOLDTC_ExternalIdP] CHECK CONSTRAINT [BOLDTC_ExternalIdP_fk2]
;

ALTER TABLE [BOLDTC_SqlServer] WITH CHECK ADD CONSTRAINT [BOLDTC_SqlServer_fk0] FOREIGN KEY ([SqlServerType]) REFERENCES [BOLDTC_SqlServerType]([Id])
;
ALTER TABLE [BOLDTC_SqlElasticPool] WITH CHECK ADD CONSTRAINT [BOLDTC_SqlElasticPool_fk1] FOREIGN KEY ([SqlServerType]) REFERENCES [BOLDTC_SqlServerType]([Id])
;
ALTER TABLE [BOLDTC_SqlElasticPool] WITH CHECK ADD CONSTRAINT [BOLDTC_SqlElasticPool_fk2] FOREIGN KEY ([TenantType]) REFERENCES [BOLDTC_TenantType]([Id])
;
ALTER TABLE [BOLDTC_SqlServer] WITH CHECK ADD CONSTRAINT [BOLDTC_SqlServer_fk1] FOREIGN KEY ([TenantType]) REFERENCES [BOLDTC_TenantType]([Id])
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_ImDbElasticPoolId] FOREIGN KEY ([ImDbElasticPoolId]) REFERENCES [BOLDTC_SqlElasticPool]([Id])
;
ALTER TABLE [BOLDTC_TenantInfo] WITH CHECK ADD CONSTRAINT [BOLDTC_IDbSqlServerId] FOREIGN KEY ([ImDbSqlServerId]) REFERENCES [BOLDTC_SqlServer]([Id])
;
ALTER TABLE [BOLDTC_RegistrationFormVersion] WITH CHECK ADD CONSTRAINT [BOLDTC_RegistrationFormVersion_fk0] FOREIGN KEY ([FormTypeId]) REFERENCES [BOLDTC_FormType]([Id])

;

ALTER TABLE [BOLDTC_PrivacyAcceptance] WITH CHECK ADD CONSTRAINT [BOLDTC_PrivacyAcceptance_fk0] FOREIGN KEY ([PrivacyPolicyVersion]) REFERENCES [BOLDTC_PrivacyPolicyVersion]([Id])

;

ALTER TABLE [BOLDTC_PrivacyAcceptance] WITH CHECK ADD CONSTRAINT [BOLDTC_PrivacyAcceptance_fk1] FOREIGN KEY ([TermsOfUseVersion]) REFERENCES [BOLDTC_TermsOfUseVersion]([Id])

;

ALTER TABLE [BOLDTC_PrivacyAcceptance] WITH CHECK ADD CONSTRAINT [BOLDTC_PrivacyAcceptance_fk2] FOREIGN KEY ([RegistrationFormVersion]) REFERENCES [BOLDTC_RegistrationFormVersion]([Id])

;
ALTER TABLE [BOLDTC_FeedBack] WITH CHECK ADD CONSTRAINT [BOLDTC_FeedBack_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;

ALTER TABLE [BOLDTC_Support] WITH CHECK ADD CONSTRAINT [BOLDTC_Support_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;

ALTER TABLE [BOLDTC_TenantActivity] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantActivity_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;

ALTER TABLE [BOLDTC_PreviewFeatures] WITH CHECK ADD CONSTRAINT [BOLDTC_PreviewFeatures_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;

ALTER TABLE [BOLDTC_KcTenants] WITH CHECK ADD CONSTRAINT [BOLDTC_KcTenant_FK0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])

;

ALTER TABLE [BOLDTC_SSLMapping] WITH CHECK ADD CONSTRAINT [BOLDTC_SSLMapping_fk1] FOREIGN KEY ([TenantId]) REFERENCES [BOLDTC_Tenant]([Id])

;

ALTER TABLE [BOLDTC_SSLMapping] WITH CHECK ADD CONSTRAINT [BOLDTC_SSLMapping_fk2] FOREIGN KEY ([CertificateId]) REFERENCES [BOLDTC_SSLCertificate]([Id])

;

ALTER TABLE [BOLDTC_AuthProvider] WITH CHECK ADD CONSTRAINT [BOLDTC_AuthProvider_fk0] FOREIGN KEY ([AuthTypeId]) REFERENCES [BOLDTC_AuthType]([Id])
;

ALTER TABLE [BOLDTC_GlobalAuthControl] WITH CHECK ADD CONSTRAINT [BOLDTC_GlobalAuthControl_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;
ALTER TABLE [BOLDTC_GlobalAuthControl] WITH CHECK ADD CONSTRAINT [BOLDTC_GlobalAuthControl_fk1] FOREIGN KEY ([AuthTypeId]) REFERENCES [BOLDTC_AuthType]([Id])
;
ALTER TABLE [BOLDTC_GlobalAuthControl] WITH CHECK ADD CONSTRAINT [BOLDTC_GlobalAuthControl_fk2] FOREIGN KEY ([CreatedBy]) REFERENCES [BOLDTC_User]([Id])
;
ALTER TABLE [BOLDTC_GlobalAuthControl] WITH CHECK ADD CONSTRAINT [BOLDTC_GlobalAuthControl_fk3] FOREIGN KEY ([ModifiedBy]) REFERENCES [BOLDTC_User]([Id])
;

ALTER TABLE [BOLDTC_AuthSettings] WITH CHECK ADD CONSTRAINT [BOLDTC_AuthSettings_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;
ALTER TABLE [BOLDTC_AuthSettings] WITH CHECK ADD CONSTRAINT [BOLDTC_AuthSettings_fk1] FOREIGN KEY ([AuthProviderId]) REFERENCES [BOLDTC_AuthProvider]([Id])
;
ALTER TABLE [BOLDTC_AuthSettings] WITH CHECK ADD CONSTRAINT [BOLDTC_AuthSettings_fk2] FOREIGN KEY ([CreatedBy]) REFERENCES [BOLDTC_User]([Id])
;
ALTER TABLE [BOLDTC_AuthSettings] WITH CHECK ADD CONSTRAINT [BOLDTC_AuthSettings_fk3] FOREIGN KEY ([ModifiedBy]) REFERENCES [BOLDTC_User]([Id])
;

ALTER TABLE [BOLDTC_UserLog] WITH CHECK ADD CONSTRAINT [BOLDTC_UserLog_fk1] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])
;
ALTER TABLE [BOLDTC_UserLog] CHECK CONSTRAINT [BOLDTC_UserLog_fk1]
;
ALTER TABLE [BOLDTC_UserLog] WITH CHECK ADD CONSTRAINT [BOLDTC_UserLog_fk2] FOREIGN KEY ([RequestedById]) REFERENCES [BOLDTC_User]([Id])
;
ALTER TABLE [BOLDTC_UserLog] CHECK CONSTRAINT [BOLDTC_UserLog_fk2]
;

ALTER TABLE [BOLDTC_AzureBlob] WITH CHECK ADD CONSTRAINT [BOLDTC_AzureBlob_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;

ALTER TABLE [BOLDTC_User] WITH CHECK ADD CONSTRAINT [BOLDTC_User_fk1] FOREIGN KEY ([Status]) REFERENCES [BOLDTC_UserStatus]([Value])
;
ALTER TABLE [BOLDTC_User] CHECK CONSTRAINT [BOLDTC_User_fk1]
;

ALTER TABLE [BOLDTC_User] WITH CHECK ADD CONSTRAINT [BOLDTC_User_fk2] FOREIGN KEY ([MfaType]) REFERENCES [BOLDTC_MfaType]([Value])
;
ALTER TABLE [BOLDTC_User] CHECK CONSTRAINT [BOLDTC_User_fk2]
;

ALTER TABLE [BOLDTC_UserLog] WITH CHECK ADD CONSTRAINT [BOLDTC_UserLog_fk3] FOREIGN KEY ([Source]) REFERENCES [BOLDTC_Source]([Value])
;
ALTER TABLE [BOLDTC_UserLog] CHECK CONSTRAINT [BOLDTC_UserLog_fk3]
;

ALTER TABLE [BOLDTC_EmailActivityLog] WITH CHECK ADD CONSTRAINT [BOLDTC_EmailActivityLog_fk0] FOREIGN KEY ([UserId]) REFERENCES [BOLDTC_User]([Id])
;

ALTER TABLE [BOLDTC_TenantSettings] WITH CHECK ADD CONSTRAINT [BOLDTC_TenantSettings_fk0] FOREIGN KEY ([TenantInfoId]) REFERENCES [BOLDTC_TenantInfo]([Id])
;

ALTER TABLE [BOLDTC_TenantSettings] CHECK CONSTRAINT [BOLDTC_TenantSettings_fk0]
;

ALTER TABLE [BOLDTC_UserAttributes] ADD FOREIGN KEY([UserId]) REFERENCES [BOLDTC_User] ([Id])
;