DROP DATABASE IF EXISTS TestingSystem;

CREATE DATABASE IF NOT EXISTS TestingSystem; 

USE TestingSystem;

-- create table1: Department
DROP TABLE IF EXISTS  `Department`;

CREATE TABLE        Department
(
 DepartmentID    TINYINT AUTO_INCREMENT PRIMARY KEY,
 DepartmentName  NVARCHAR(50) NOT NULL UNIQUE KEY
  );
  
-- create table2: Position
  DROP TABLE IF EXISTS `Position`;
  
  CREATE TABLE `Position`
(
 PositionID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 PositionName    ENUM('Dev','Test','Scrum Master','PM') NOT NULL 
  );
  
-- create table3: ACcount
   DROP TABLE IF EXISTS  `Account`;
   
   CREATE TABLE `Account`
(
 AccountID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 Email           VARCHAR(50) NOT NULL UNIQUE KEY,
 UserName        VARCHAR(50) NOT NULL UNIQUE KEY,
 FullName        VARCHAR(50) NOT NULL,
 DepartmentID    TINYINT NOT NULL,
 PositionID      TINYINT NOT NULL,
 CreateDate      DATETIME DEFAULT NOW() ,
 FOREIGN KEY (DepartmentID) REFERENCES `Department` (DepartmentID)ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID) ON DELETE CASCADE ON UPDATE CASCADE
  );
-- create table4: Group

  DROP TABLE IF EXISTS `Group`;
  
  CREATE TABLE `Group`
(
 GroupID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 GroupName    VARCHAR(50) NOT NULL UNIQUE KEY,
 CreatorID    TINYINT ,
 CreateDate   DATETIME DEFAULT NOW()
  );
  
-- create table5: GroupAccount
  DROP TABLE IF EXISTS  `GroupAccount`;
  
  CREATE TABLE `GroupAccount`
(
 GroupID      TINYINT AUTO_INCREMENT,
 AccountID     TINYINT,
 PRIMARY KEY(GroupID, AccountID),
 JoinDate   DATETIME DEFAULT NOW()
  );
    
-- create table6: TypeQuestion
  DROP TABLE IF EXISTS ` TypeQuestion`;
  
  CREATE TABLE          `TypeQuestion`
(
 TypeID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 TypeName    ENUM('Easy','Multiple-Choice') NOT NULL 

  );
  
-- create table7: 	CategoryQuestion
  DROP TABLE IF EXISTS  `CategoryQuestion`;
  
  CREATE TABLE          `CategoryQuestion`
(
 CategoryID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 CategoryName    VARCHAR(50) NOT NULL UNIQUE KEY

  );
  
-- create table8: 	Question
  DROP TABLE IF EXISTS   `Question`;
  
  CREATE TABLE           `Question`
(
 QuestionID      TINYINT AUTO_INCREMENT PRIMARY KEY,
 Content         VARCHAR(1000) NOT NULL,
 CategoryID      TINYINT NOT NULL,
 TypeID          TINYINT NOT NULL,
 CreatorID       TINYINT NOT NULL,
 CreateDate      DATETIME DEFAULT NOW(),
 FOREIGN KEY (CategoryID) REFERENCES `CategoryQuestion`(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (TypeID) REFERENCES `TypeQuestion`(TypeID) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
-- create table9: Answer
  DROP TABLE IF EXISTS   `Answer`;
  
  CREATE TABLE           `Answer`
(
 AnswerID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 Content         VARCHAR(100) NOT NULL,
 QuestionID      TINYINT NOT NULL,
 isCorrect       ENUM('True','False'),
 FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
    -- create table10: Exam
  DROP TABLE IF EXISTS   `Exam`;
  
  CREATE TABLE           `Exam`
(
 ExamID        TINYINT AUTO_INCREMENT PRIMARY KEY,
 `Code`        CHAR(50) UNIQUE KEY,
 Title         CHAR(50) NOT NULL,
 CategoryID    TINYINT NOT NULL,
 Duration      DATETIME DEFAULT NOW(),
 CreatorID     TINYINT,
 CreateDate    DATETIME DEFAULT NOW(),
 FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
  );
  
-- create table11: ExamQuestion
  DROP TABLE IF EXISTS   `ExamQuestion`;
  
  CREATE TABLE          `ExamQuestion`
(
 ExamID        TINYINT AUTO_INCREMENT ,
 QuestionID      TINYINT,
 FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY(ExamID,QuestionID)
  );

-- QUESTION 1
-- INSERT INTO name_table()  VALUES ();
-- Table 1:
INSERT INTO `Department` (DepartmentID,DepartmentName ) 
VALUES                   (NULL       ,N'Sale'        ),
                         (NULL       ,N'Marketting'  ),
						 (NULL       ,N'Nhân sự'     ),
                         (NULL       ,N'Kế toán'     ),
                         (NULL       ,N'Lễ tân'      ),
                         (NULL       ,N'Bảo vệ'      ),
						 (NULL       ,N'Giám đốc'    ),
                         (NULL       ,N'Trainning'   ),
						 (NULL       ,N'Kinh doanh'  ),
                         (NULL       ,N'Truyền thông');

-- Table 2:
INSERT INTO `Position` (PositionID,PositionName  ) 
VALUES                 (NULL      ,'Dev'         ),
                       (NULL      ,'Test'        ),
                       (NULL      ,'Scrum Master'),
                       (NULL      ,'PM'          ),
                       (NULL      ,'Test'        ),
                       (NULL      ,'PM'          ),
                       (NULL      ,'Dev'         ),
					   (NULL      ,'Scrum Master'),
                       (NULL      ,'Test'        ),
                       (NULL      ,'Dev'         );
 
 -- Table 3:
INSERT INTO `Account` (AccountID,Email                 ,UserName       ,FullName        ,DepartmentID,PositionID,CreateDate           ) 
VALUES                (NULL     ,'vantrung@gmail.com'  ,'vantrung123'  ,'tran van tung'        , 1   , 1        ,'2014-04-02 01:00:00'),
                      (NULL     ,'vanhai@gmail.com'    ,'vanhai123'    ,'ngo van hai'          , 2   , 2        ,'2020-05-02 02:00:00'),
                      (NULL     ,'vantan@gmail.com'    ,'vantan123'    ,'pham van tan'         , 3   , 3        ,'2020-06-02 03:00:00'),
                      (NULL     ,'thilinh@gmail.com'   ,'thilinh123'   ,'vu thi linh'          , 4   , 4        ,'2020-07-02 04:00:00'),
					  (NULL     ,'vanphu@gmail.com'    ,'vanphu123'    ,'le van phu'           , 5   , 5        ,'2017-08-02 05:00:00'),
                      (NULL     ,'vandung@gmail.com'   ,'vandung123'   ,'tran van dung'        , 6   , 6        ,'2018-09-02 06:00:00'),
                      (NULL     ,'vanlong@gmail.com'   ,'vanlong123'   ,'hoang van long'       , 7   , 7        ,'2019-10-02 00:30:00'),
                      (NULL     ,'duyquan@gmail.com'   ,'duyquan123'   ,'do duy quan'          , 8   , 8        ,'2019-11-02 00:50:00'),
                      (NULL     ,'vanquang@gmail.com'  ,'vanquang123'  ,'mac van quang'        , 9   , 9        ,'2019-12-02 00:45:00'),
                      (NULL     ,'thientrong@gmail.com','thientrong123','nguy hoang thien long',10   , 10       ,'2020-02-02 00:48:00');
 
 -- Table 4:
INSERT INTO `Group` (GroupID,GroupName     ,CreatorID,CreateDate           ) 
VALUES              (NULL   ,'Dev'         ,NULL     ,'2019-04-06 00:00:00'),
                    (NULL   ,'Test'        ,NULL     ,'2019-05-27 00:00:00'),
                    (NULL   ,'Scrum Master',NULL     ,'2019-03-07 00:00:00'),
                    (NULL   ,'PM'          ,NULL     ,'2018-07-21 00:00:00'),
                    (NULL   ,'Sale'        ,NULL     ,'2019-12-20 00:00:00'),
                    (NULL   ,'BA'          ,NULL     ,'2020-01-20 00:00:00'),
					(NULL   ,'Java'        ,NULL     ,'2019-03-20 00:00:00'),
                    (NULL   ,'Buy'         ,NULL     ,'2019-06-20 00:00:00'),
                    (NULL   ,'Derector'    ,NULL     ,'2019-11-20 00:00:00'),
					(NULL   ,'Acc'         ,NULL     ,'2020-02-20 00:00:00');
 
  -- Table 5:
INSERT INTO `GroupAccount` (GroupID,AccountID,JoinDate             ) 
VALUES                    (NULL   ,1        ,'2019-10-07 00:00:00' ),
                          (NULL   ,2        ,'2019-09-08 00:00:00' ),
                          (NULL   ,3        ,'2019-08-09 00:00:00' ),
						  (NULL   ,4        ,'2019-07-10 00:00:00' ),
                          (NULL   ,5        ,'2019-06-11 00:00:00' ),
                          (NULL   ,6        ,'2019-05-12 00:00:00' ),
                          (NULL   ,7        ,'2019-04-13 00:00:00' ),
                          (NULL   ,8        ,'2019-03-14 00:00:00' ),
                          (NULL   ,9        ,'2019-02-15 00:00:00' ),
                          (NULL   ,10       ,'2019-01-16 00:00:00');
 
   -- Table 6:
INSERT INTO `TypeQuestion` (TypeID,TypeName       ) 
VALUES                     (NULL  ,'Easy'         ),
                           (NULL,'Multiple-Choice'),
                           (NULL,'Multiple-Choice'),
						   (NULL,'Easy'           ),
                           (NULL,'Multiple-Choice'),
                           (NULL,'Easy'           ),
                           (NULL,'Easy'           ),
						   (NULL,'Multiple-Choice'),
                           (NULL,'Easy'           ),
						   (NULL,'Easy'           );
  -- Table 7:
 INSERT INTO `CategoryQuestion` (CategoryID,CategoryName)
  VALUES                        (NULL      ,'Java'      ),
                                (NULL      ,'.NET'      ),
                                (NULL      ,'SQL'       ),
								(NULL      ,'C++'       ),
                                (NULL      ,'Ruby'      ),
								(NULL      ,'C#'        ),
                                (NULL      ,'Python'    ),
                                (NULL      ,'Algorithm' ),
                                (NULL      ,'Properties'),
                                (NULL      ,'Constraint');
 
   -- Table 8:
INSERT INTO `Question` (QuestionID,Content  ,CategoryID,TypeID,CreatorID,CreateDate           )
VALUES                 (NULL      ,'      ' ,1         ,1     ,1        ,'2019-11-01 00:00:00'),
					   (NULL      ,'      ' ,2         ,2     ,2        ,'2019-12-01 00:00:00'),
                       (NULL      ,'Cau hoi',3         ,3     ,3        ,'2019-04-01 00:00:00'),
                       (NULL      ,'      ' ,4         ,4     ,4        ,'2019-05-01 00:00:00'),
                       (NULL      ,'      ' ,5         ,5     ,5        ,'2019-06-01 00:00:00'),
                       (NULL      ,'      ' ,6         ,6     ,6        ,'2019-07-01 00:00:00'),
                       (NULL      ,'      ' ,7         ,7     ,7        ,'2019-08-01 00:00:00'),
                       (NULL      ,'      ' ,8         ,8     ,8        ,'2019-09-01 00:00:00'),
					   (NULL      ,'      ' ,9         ,9     ,9        ,'2020-03-01 00:00:00'),
                       (NULL      ,'      ' ,10        ,10    ,10       ,'2020-05-07 00:00:00');
 
    -- Table 9:
INSERT INTO `Answer` (AnswerID,Content ,QuestionID,isCorrect)
VALUES               (NULL    ,'      ',1         ,'True'   ),
                     (NULL    ,'      ',2         ,'False'  ),
                     (NULL    ,'      ',3         ,'True'   ),
                     (NULL    ,'      ',4         ,'False'  ),
                     (NULL    ,'      ',5         ,'True'   ),
                     (NULL    ,'      ',6         ,'True'   ),
                     (NULL    ,'      ',7         ,'False'  ),
                     (NULL    ,'      ',8         ,'True'   ),
					 (NULL    ,'      ',9         ,'False'  ),
                     (NULL    ,'      ',10        ,'True'   );
 
 
     -- Table 10:
INSERT INTO `Exam` (ExamID,`Code`,Title       ,CategoryID ,Duration             ,CreatorID  ,CreateDate   ) 
VALUES             (NULL  ,'A01' ,'bai tap 1' ,1          ,'2019-02-16 00:50:08',NULL       ,'2020-03-07'),
                   (NULL  ,'A02' ,'bai tap 2' ,2          ,'2019-02-16 00:50:08',NULL       ,'2020-04-07'),
                   (NULL  ,'A03' ,'bai tap 3' ,3          ,'2019-02-16 00:50:08',NULL       ,'2020-05-07'),
                   (NULL  ,'A04' ,'bai tap 4' ,4          ,'2019-02-16 00:50:08',NULL       ,'2020-06-07'),
                   (NULL  ,'A05' ,'bai tap 5' ,5          ,'2019-02-16 00:50:08',NULL       ,'2019-07-07'),
                   (NULL  ,'A06' ,'bai tap 6' ,6          ,'2019-02-16 00:50:08',NULL       ,'2019-08-07'),
                   (NULL  ,'A07' ,'bai tap 7' ,7          ,'2019-02-16 00:50:08',NULL       ,'2019-09-07'),
                   (NULL  ,'A08' ,'bai tap 8' ,8          ,'2019-02-16 00:50:08',NULL       ,'2019-10-07'),
                   (NULL  ,'A09' ,'bai tap 9' ,9          ,'2019-02-16 00:50:08',NULL       ,'2019-11-07'),
                   (NULL  ,'A010','bai tap 10',10         ,'2019-02-16 00:50:08',NULL       ,'2019-12-07');
 
 -- Table 11:
INSERT INTO `ExamQuestion` (ExamID,QuestionID) 
VALUES                     (NULL  ,1         ),
                           (NULL  ,2         ),
                           (NULL  ,3         ),
						   (NULL  ,4         ),
                           (NULL  ,5         ),
                           (NULL  ,6         ),
						   (NULL  ,7         ),
                           (NULL  ,9         ),
                           (NULL  ,10        );
 
 -- QUESTION 2:
 
SELECT * FROM `Department`;

SELECT * FROM `Position`;

SELECT * FROM `Account`;

SELECT * FROM `Group`;

SELECT * FROM `GroupAccount`;

SELECT * FROM `TypeQuestion`;

SELECT * FROM `CategoryQuestion`;

SELECT * FROM `Question`;

SELECT * FROM `Answer`;

SELECT * FROM `Exam`;

SELECT * FROM `ExamQuestion`;

-- QUESTION 3:

SELECT DepartmentID AS DeID
 
 FROM  `Department` 
 
 WHERE DepartmentName = 'Sale';

-- QUESTION 4:

SELECT * from `Account`;

    SELECT AccountID,Email,UserName,DepartmentID,PositionID,CreateDate,FullName,MAX(LENGTH(Fullname)) 
    FROM `Account`
    ORDER BY FullName DESC;
    

-- QUESTION 5:

SELECT * from `Account`;

SELECT * FROM 	`Account`
WHERE			LENGTH(FullName) = 
(SELECT 		MAX(LENGTH(FullName))
FROM 			`Account`)
AND 			DepartmentID =3;
    
-- QUESTION 6:

SELECT * from `Group`;

    SELECT GroupName AS GrName
    FROM `Group`
    WHERE  CreateDate < '2020-12-29';
    
    -- QUESTION 7:

SELECT * from 	`Question`;

SELECT 		QuestionID AS QuID
FROM 		`Answer`
GROUP BY 	QuestionID
HAVING 		COUNT(Content) >= 4;
    -- QUESTION 8:

SELECT * from 	`Exam`;

    SELECT 	`Code`,HOUR(Duration)
    FROM `Exam`
    WHERE 	HOUR(Duration) >= '01:00:00' AND CreateDate <  '2019-12-29';
    
    -- QUESTION 9:
    
    SELECT * FROM `Group` 
    ORDER BY CreateDate DESC LIMIT 5;
    
    -- QUESTION 10:
    SELECT COUNT(DepartmentID) 
    FROM `Department` 
    WHERE DepartmentID=2;
    
    -- QUESTION 11:
    SELECT DepartmentName 
    FROM `Department` 
    WHERE  DepartmentName LIKE 'D%o';
    
   -- QUESTION 12:
  
   DELETE FROM `Exam` 
   WHERE CreateDate < '2019-12-20';
   
    -- QUESTION 13:
    
	DELETE FROM 	`Question` 
    WHERE 	Content = 'cau hoi%';
    
 -- QUESTION 14:
 
 UPDATE `Account` 
 SET FullName = 'Nguyễn Bá Lộc' , Email = 'loc.nguyenba@vti.com.vn' 
 WHERE AccountID = 5;
 SELECT * FROM `Account`;
  -- QUESTION 15:
  
 UPDATE `GroupAccount` 
 SET  AccountID = 5 
 WHERE GroupID = 4;
 
 SELECT * FROM `GroupAccount`;
 
    
    
 
  





