DROP DATABASE IF EXISTS TestingSystem;

CREATE DATABASE IF NOT EXISTS TestingSystem; 

USE TestingSystem;

-- create table1: Department
DROP TABLE IF EXISTS  Department;

CREATE TABLE        Department
(
 DepartmentID    TINYINT AUTO_INCREMENT PRIMARY KEY,
 DepartmentName  VARCHAR(50) NOT NULL
  );
  
-- create table2: Position1
  DROP TABLE IF EXISTS Position1;
  
  CREATE TABLE Position1
(
 PositionID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 PositionName    ENUM('Dev','Test','Scrum Master','PM')
  );
  
-- create table3: Acount1
   DROP TABLE IF EXISTS  Account1;
   
   CREATE TABLE Account1
(
 AcountID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 Email           VARCHAR(50) NOT NULL,
 UserName        VARCHAR(50) NOT NULL,
 FullName        VARCHAR(50) NOT NULL,
 DepartmentID    TINYINT NOT NULL,
 PositionID      TINYINT NOT NULL,
 CreateDate      DATE,
 FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
 FOREIGN KEY (PositionID) REFERENCES Position1 (PositionID)
  );
-- create table4: Group1

  DROP TABLE IF  EXISTS Group1;
  
  CREATE TABLE          Group1
(
 GroupID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 GroupName    VARCHAR(50) NOT NULL,
 CreatorID    TINYINT,
 CreateDate   DATE
  );
  
-- create table5: GroupAcount
  DROP TABLE IF EXISTS  GroupAcount;
  
  CREATE TABLE          GroupAcount
(
 GroupID      TINYINT AUTO_INCREMENT,
 AcountID     TINYINT,
 PRIMARY KEY(GroupID, AcountID),
 JoinDate   DATE
  );
    
-- create table6: TypeQuestion
  DROP TABLE IF EXISTS  TypeQuestion;
  
  CREATE TABLE          TypeQuestion
(
 TypeID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 TypeName    ENUM('Easy','Multiple-Choice')

  );
  
-- create table7: 	CategoryQuestion
  DROP TABLE IF EXISTS  CategoryQuestion;
  
  CREATE TABLE          CategoryQuestion
(
 CategoryID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 CategoryName    VARCHAR(50)

  );
  
-- create table8: 	Question
  DROP TABLE IF EXISTS   Question;
  
  CREATE TABLE           Question
(
 QuestionID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 Content         VARCHAR(1000),
 CategoryID      TINYINT NOT NULL,
 TypeID          TINYINT NOT NULL,
 CreatorID       TINYINT NOT NULL,
 CreateDate      DATE,
 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
 FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
  );
  
-- create table9: Answer
  DROP TABLE IF EXISTS   Answer;
  
  CREATE TABLE           Answer
(
 AnswerID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 Content         VARCHAR(100),
 QuestionID      TINYINT NOT NULL,
 isCorrect       ENUM('True','False'),
 FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID) 
  );
  
    -- create table10: Exam
  DROP TABLE IF EXISTS   Exam;
  
  CREATE TABLE           Exam
(
 ExamID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 Code_1        CHAR(50),
 Title         CHAR(50),
 CategoryID    TINYINT NOT NULL,
 Duration      DATETIME,
 CreatorID     TINYINT,
 CreateDate    DATE,
 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID)
  );
  
-- create table11: ExamQuestion
  DROP TABLE IF EXISTS   ExamQuestion;
  
  CREATE TABLE           ExamQuestion
(
 ExamID        TINYINT AUTO_INCREMENT ,
 QuestionID      TINYINT NOT NULL,
 PRIMARY KEY(ExamID,QuestionID)
  );
        