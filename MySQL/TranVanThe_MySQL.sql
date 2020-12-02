DROP DATABASE IF EXISTS `ManangeStudent`;
CREATE DATABASE `ManangeStudent`;
USE `ManangeStudent`;
-- Question :Tạo table với các ràng buộc và kiểu dữ liệu
-- Create table Student
DROP TABLE IF EXISTS `Student`;
CREATE TABLE `Student`
(
  RN     TINYINT AUTO_INCREMENT PRIMARY KEY,
  `Name` NVARCHAR(50) NOT NULL,
  Age    INT NOT NULL,
  Gender ENUM('Male','Female','Unknown')
);
-- Create table Subject
DROP TABLE IF EXISTS `Subject`;
CREATE TABLE `Subject`
(
  sID    TINYINT AUTO_INCREMENT PRIMARY KEY,
  sName  NVARCHAR(50) NOT NULL
);
-- Create table StudentSubject
DROP TABLE IF EXISTS `StudentSubject` ;
CREATE TABLE IF NOT EXISTS `StudentSubject`(
					RN        TINYINT UNSIGNED,
					sID       VARCHAR(10),
					Mark      TINYINT UNSIGNED,
					Date    DATETIME DEFAULT NOW(),
					PRIMARY KEY(RN,sID) 
);

 -- Thêm 3 bản ghi vào tablbe student
INSERT INTO `Student` 			(`Name`  ,	Age,	Gender	 ) 
VALUES 
								(N'Tra'  , 	21 ,	'Female' ),
								(N'The'	 , 	21 ,    'Male'   ),
								(N'Thao' , 	21 ,	'Unknown');
SELECT * FROM `Student`;    
-- Thêm 3 bản ghi vào tablbe subject

INSERT INTO `Subject` 			(sName		) 
VALUES 
								(N'Toan'	),
								(N'Ly'		),
								(N'Hoa'		);
   SELECT * FROM `Subject` ;                 
-- Thêm 3 bản ghi vào tablbe StudentSubject

INSERT INTO  `StudentSubject`	(RN,	sID,	Mark,	`Date`		          ) 
VALUES 
								(1,		4  ,		9.0 ,'2020-09-09 08:00:00'),
								(2,		5  ,		8.0 ,'2020-12-09 08:00:00'),
								(3,		6  ,		7.0 ,'2020-12-09 08:00:00'),
								(4,		7  ,		NULL ,'2020-09-09 08:00:00'),
								(5,		8  ,		NULL ,'2020-12-09 08:00:00'),
								(6,		9  ,		NULL,'2020-12-09 08:00:00');
           SELECT * FROM `StudentSubject`;                     
-- Question 2:
-- a. Lấy tất cả các môn học không có bất kì điểm nào
   SELECT *
   FROM
     `Subject` S
     JOIN
     `StudentSubject` SS ON S.sID = SS.sID
   WHERE SS.Mark IS NULL;

-- b. Lấy danh sách các môn học có ít nhất 2 điểm
   SELECT S.*, COUNT(SS.sID) AS C_Mark
   FROM
     `Subject` S
     JOIN
     `StudentSubject` SS ON S.sID = SS.sID
     GROUP BY S.sID
     HAVING COUNT(SS.sID) > 2;
     
-- Question 3: Tạo "StudentInfo" view có các thông tin về học sinh bao gồm:
-- RN,sID,Name, Age, Gender, sName, Mark, Date. Với cột Gender show
-- Male để thay thế cho 0, Female thay thế cho 1 và Unknow thay thế cho
-- null.

 CREATE VIEW StudentInfo AS
  SELECT S.RN,Su.sID,`Name`,Age,Gender,sName,Mark,`Date`,
  CASE 
    WHEN Gender = 'Male' THEN 0
    WHEN Gender = 'Female' THEN 1
    ELSE 'Null'
    END AS NewGender
  FROM   `student` S
    JOIN `StudentSubject` SS ON S.RN = SS.RN
    JOIN `Subject` Su   ON (SS.sID = Su.sID 
    );
    
	SELECT * FROM StudentInfo; 
    DROP VIEW StudentInfo; 
-- Question 4: tao trigger cho table Subject 
-- trigger CasUpdate: thay doi sID thi sID trong bang studentsubject cung thay doi
DROP TRIGGER IF EXISTS 			CasUpdate ;

DELIMITER $$
	CREATE TRIGGER 				CasUpdate
    BEFORE DELETE  ON 			`subject`
    FOR EACH ROW 
		BEGIN 
			DELETE
            FROM 				`StudentSubject`
            WHERE 				sID = OLD.sID;
		END $$
DELIMITER ;
DROP TRIGGER CasUpdate ;

-- trigger casDel: Khi xóa 1 student, các dữ liệu của table
-- StudentSubject cũng sẽ bị xóa theo

DROP TRIGGER IF EXISTS 			casDel ;

DELIMITER $$
	CREATE TRIGGER 				casDel
    BEFORE DELETE  ON 			`Student`
    FOR EACH ROW 
		BEGIN 
			DELETE
            FROM 				`StudentSubject`
            WHERE 				RN = OLD.RN;
		END $$
DELIMITER ;
 
 -- Question 5: Viết 1 thủ tục (có 2 parameters: student name, mark). Thủ tục sẽ xóa tất cả
-- các thông tin liên quan tới học sinh có cùng tên như parameter và tất cả
-- các điểm nhỏ hơn của các học sinh đó.
-- Trong trường hợp nhập vào "*" thì thủ tục sẽ xóa tất cả các học sinh
DROP PROCEDURE IF EXISTS 		Delete_Info_Student;

DELIMITER $$

CREATE PROCEDURE 				Delete_Info_Student ( IN StudentName NVARCHAR(30),IN MarkInput FLOAT)
	BEGIN

    -- Xóa tất cả các thông tin có liên quan tới học sinh có cũng tên như prameter
		DELETE 
        FROM  					`StudentSubject`
        WHERE 					sID IN (SELECT DISTINCT sID FROM `student` WHERE `Name` = StudentName);
		DELETE 
        FROM  					student
        WHERE 					`Name` = StudentName;
	
    --  Tất cả các điểm nhỏ hơn của các học sinh đó 
		DELETE 			
        FROM 					`StudentSubject`
        WHERE					Mark < MarkInput;
    --  Nếu nhập vào '*' thì xóa tất cả các học sinh
        IF 						StudentName = '*' THEN 
        DELETE
        FROM 					`Student`;
        DELETE		
        FROM					`StudentSubject`;
        END IF;
	END $$
DELIMITER ;
