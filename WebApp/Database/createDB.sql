CREATE DATABASE equivalent_score;
-- 
USE equivalent_score;

-- DROP DATABASE equivalent_score;
        
        
CREATE TABLE DimProvince
(
  ProvinceCode DECIMAL     NOT NULL,
  ProvinceName VARCHAR(50) NOT NULL,
  PRIMARY KEY (ProvinceCode)
);

CREATE TABLE DimYear
(
  year DEC(4,0) NOT NULL,
  PRIMARY KEY (year)
);

CREATE TABLE FactScore
(
  studentID    VARCHAR(8) NOT NULL,
  literature   DECIMAL(4,2) NOT NULL,
  math         DECIMAL(4,2) NOT NULL,
  english      DECIMAL(4,2) NOT NULL,
  physics      DECIMAL(4,2) NULL    ,
  chemistry    DECIMAL(4,2) NULL    ,
  biology      DECIMAL(4,2) NULL    ,
  history      DECIMAL(4,2) NULL    ,
  geography    DECIMAL(4,2) NULL    ,
  civil        DECIMAL(4,2) NULL    ,
  ProvinceCode DECIMAL    NOT NULL,
  year         DEC(4,0)   NOT NULL,
  PRIMARY KEY (studentID, ProvinceCode, year)
);

CREATE TABLE SubjectGroup
(
  SubjectGroup VARCHAR(3) NOT NULL,
  math         BIT(1)     NULL    ,
  literature   BIT(1)     NULL    ,
  english      BIT(1)     NULL    ,
  physics      BIT(1)     NULL    ,
  chemistry    BIT(1)     NULL    ,
  biology      BIT(1)     NULL    ,
  history      BIT(1)     NULL    ,
  geography    BIT(1)     NULL    ,
  civil        BIT(1)     NULL    ,
  PRIMARY KEY (SubjectGroup)
);

CREATE TABLE University
(
  UniCode      VARCHAR(4)   NOT NULL,
  UniName      VARCHAR(200) NOT NULL,
  MajorCode    VARCHAR(26)  NOT NULL,
  MajorName    VARCHAR(320) NOT NULL,
  SubjectGroup VARCHAR(3)   NOT NULL,
  BenchMark    DECIMAL(5,2)   NOT NULL,
  YEAR         DECIMAL(4,0) NOT NULL
);

ALTER TABLE FactScore
  ADD CONSTRAINT FK_DimProvince_TO_FactScore
    FOREIGN KEY (ProvinceCode)
    REFERENCES DimProvince (ProvinceCode);

ALTER TABLE FactScore
  ADD CONSTRAINT FK_DimYear_TO_FactScore
    FOREIGN KEY (year)
    REFERENCES DimYear (year);

