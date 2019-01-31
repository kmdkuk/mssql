CREATE TABLE employee.dbo.departments
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128)
);

CREATE TABLE employee.dbo.groups
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128)
)

CREATE TABLE employee.dbo.domains
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128)
)

CREATE TABLE employee.dbo.administrators
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128),
    pass NVARCHAR(128),
    mailAddress NVARCHAR(128)
)

CREATE TABLE employee.dbo.tenants
(
    id int PRIMARY KEY NOT NULL,
    companyName NVARCHAR(128),
    creditInfo NVARCHAR(128),
    amount NVARCHAR(128),
    administratorId int FOREIGN KEY REFERENCES [employee].[dbo].[administrators]
)

CREATE TABLE employee.dbo.employees
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128),
    furigana NVARCHAR(128),
    pass NVARCHAR(128),
    departmentId int FOREIGN KEY REFERENCES [employee].[dbo].[departments],
    groupId int FOREIGN KEY REFERENCES [employee].[dbo].[groups],
    domainId int FOREIGN KEY REFERENCES [employee].[dbo].[domains],
    tenantId int FOREIGN KEY REFERENCES [employee].[dbo].[tenants],
)

CREATE TABLE employee.dbo.applications
(
    id int PRIMARY KEY NOT NULL,
    name NVARCHAR(128),
)

CREATE TABLE employee.dbo.tenantApplications
(
    id int PRIMARY KEY NOT NULL,
    tenantId int FOREIGN KEY REFERENCES [employee].[dbo].[tenants],
    applicationId int FOREIGN KEY REFERENCES [employee].[dbo].[applications],
)