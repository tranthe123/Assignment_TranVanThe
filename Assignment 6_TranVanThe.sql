USE testingsystem;
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó
DELIMITER $$
 CREATE PROCEDURE Nhap_ten_phong_ban_va_in_ra(IN IN_DepartmentName VARCHAR(50))
  BEGIN
    SELECT 		A.* 
    FROM		`Department` AS D INNER JOIN `Account` AS A ON D.DepartmentID = A.DepartmentID
    WHERE		DepartmentName = IN_DepartmentName;
  END $$
DELIMITER ;
-- 
 SELECT * FROM `department`;
 -- 
 CALL Nhap_ten_phong_ban_va_in_ra('Truyen thong');

-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DELIMITER $$
 CREATE PROCEDURE In_ra_so_luong_acc_trong_group(IN_GroupID VARCHAR(50))
  BEGIN
	SELECT 		GroupID, COUNT(AccountID)
    FROM		`groupaccount`
    WHERE		GroupID = IN_GroupID
    GROUP BY	GroupID;
  END $$
DELIMITER ;
-- 
SELECT * FROM `groupaccount`;
-- 
CALL In_ra_so_luong_acc_trong_group(1);
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
DELIMITER $$
 CREATE PROCEDURE Type_question(IN_CreateDate DATETIME)
  BEGIN
    SELECT COUNT(TypeID)
    FROM `Question`
    WHERE MONTH(CreateDate) = IN_CreateDate;
  END $$
DELIMITER ;

--
SELECT * FROM `Question`;
-- 
CALL Type_question(NOW());
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DELIMITER $$
 CREATE PROCEDURE ID_type_question( )
  BEGIN
    SELECT TypeID
	FROM `Question` 
	GROUP BY TypeID
	HAVING COUNT(TypeID) = (SELECT COUNT(TypeID)
		                         FROM `Question`
		                         GROUP BY TypeID
								 ORDER BY COUNT(TypeID) DESC
		                         LIMIT 1);
  END $$
  
DELIMITER ;
--
WITH MAX_Count_TypeID AS(
		SELECT		COUNT(TypeID)
		FROM		Question 
		GROUP BY	TypeID
        ORDER BY	COUNT(TypeID) DESC
		LIMIT 		1
    )
    SELECT 		TypeID
    FROM		Question
    GROUP BY 	TypeID
    HAVING		COUNT(TypeID) = (SELECT * FROM MAX_Count_TypeID);
SELECT * FROM `Question`;
--
CALL ID_type_question();
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DELIMITER $$
 CREATE PROCEDURE Name_type_question()
  BEGIN
    SELECT 		TQ.TypeName
    FROM		`Question` AS Q INNER JOIN `TypeQuestion` AS TQ ON Q.TypeID = TQ.TypeID
    GROUP BY 	Q.TypeID
    HAVING		COUNT(Q.TypeID) = (SELECT COUNT(TypeID)
		                         FROM `Question`
		                         GROUP BY TypeID
								 ORDER BY COUNT(TypeID) DESC
		                         LIMIT 1);
  END $$
  
DELIMITER ;
--
CALL Name_type_question()

-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của
-- người dùng nhập vào
DELIMITER $$
CREATE PROCEDURE Group_co_ten_chua_chuoi_vua_nhap_hoac_user(IN	IN_String VARCHAR(50))
BEGIN
	IF IN_String = 1 THEN
		SELECT 	*
        FROM	`Group`
        WHERE	GroupName LIKE ConceIN_String;
	ELSE 
		SELECT 	Email, Username, FullName
        FROM	`Account`
        WHERE	Username LIKE IN_String;
	END IF;
END$$
DELIMITER ;
--
CALL Group_co_ten_chua_chuoi_vua_nhap_hoac_user('nguyen');

DROP PROCEDURE Group_co_ten_chua_chuoi_vua_nhap_hoac_user;
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công

DELIMITER $$
CREATE PROCEDURE Nguoi_dung_truy_cap(	IN	in_email VARCHAR(50), IN in_fullName NVARCHAR(50))						
BEGIN
	DECLARE Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(in_email,'@',1);
    DECLARE PositionID TINYINT UNSIGNED DEFAULT 1;
    DECLARE DepartmentID TINYINT UNSIGNED DEFAULT 10;
    DECLARE CreateDate DATETIME DEFAULT NOW();
	
	INSERT INTO `Account` 	(Email		,Username, FullName		, DepartmentID,	PositionID,	CreateDate)
    VALUE					(in_email	,Username, in_fullName	, DepartmentID, PositionID, CreateDate);
	
    SELECT 	*
    FROM 	`Account`A
    WHERE	A.Username = Username;
	
END$$
DELIMITER ;

CALL  Nguoi_dung_truy_cap;
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
DELIMITER $$
CREATE PROCEDURE Cau_hoi_dai_nhat(IN IN_TypeName VARCHAR(50))
BEGIN
	IF (IN_TypeName = 'Essay') THEN
		SELECT	Content, MAX(LENGTH(Content))
		FROM	`Question`
		WHERE	TypeID = 1;
	ELSEIF (IN_TypeName = 'Multiple-Choice') THEN
		SELECT	`Content`, MAX(LENGTH(Content))
		FROM	Question
		WHERE	TypeID = 2;
	END IF;
END$$
DELIMITER ;
--
SELECT * FROM `Question`;
--
CALL  Cau_hoi_dai_nhat('Essay');

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID

DELIMITER $$
CREATE PROCEDURE Xoa_exam_bang_ID(IN IN_ExamID TINYINT)
BEGIN
	DELETE 	
    FROM 	Exam 
    WHERE	ExamID = IN_ExamID;	
END$$
DELIMITER ;
--
SELECT *FROM EXAM;
--
CALL  Xoa_exam_bang_ID (1);

-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa), sau đó in số lượng record đã remove từ các table liên quan
-- trong khi removing

DELIMITER $$
CREATE PROCEDURE Xoa_exam_3_nam_truoc()
BEGIN
	WITH Exam3YearAgo AS(
		SELECT 	ExamID
		FROM 	Exam
		WHERE	(YEAR(NOW()) - YEAR(CreateDate)) > 3
    )
	DELETE
    FROM 	Exam
    WHERE 	ExamID = (SELECT * FROM Exam3YearAgor);
   -- GỌI RA NHỮNG DÒNG ĐÃ BỊ THAY ĐỔI TRONG CÂU LỆNH TRƯỚC.
   -- DELETE|UPDATE|INSERT
  SELECT ROW_COUNT();                   
END$$
DELIMITER ;
-- 
CALL Xoa_exam_3_nam_truoc;
DROP PROCEDURE Xoa_exam_3_nam_truoc;

-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng
-- ban default là phòng ban chờ việc

DELIMITER $$
CREATE PROCEDURE Xoa_Department(IN	IN_DepartmentName NVARCHAR(50))
BEGIN
	UPDATE 	`Account`
    SET		DepartmentID = 10
    WHERE	DepartmentID = (SELECT 	DepartmentID	
							FROM	Department
							WHERE 	DepartmentName = IN_DepartmentName);
	DELETE 
    FROM	Department
    WHERE	DepartmentName = IN_DepartmentName;
END$$
DELIMITER ;

CALL Xoa_Department
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
-- nay
DELIMITER $$
CREATE PROCEDURE CountQuesInMonth()
BEGIN
		SELECT Thangin1nam.MONTH, COUNT(QuestionID) AS COUNT
		FROM
		(
             SELECT 1 AS MONTH
             UNION SELECT 2 AS MONTH
             UNION SELECT 3 AS MONTH
             UNION SELECT 4 AS MONTH
             UNION SELECT 5 AS MONTH
             UNION SELECT 6 AS MONTH
             UNION SELECT 7 AS MONTH
             UNION SELECT 8 AS MONTH
             UNION SELECT 9 AS MONTH
             UNION SELECT 10 AS MONTH
             UNION SELECT 11 AS MONTH
             UNION SELECT 12 AS MONTH
        ) AS Thangin1nam
		LEFT JOIN Question ON Thangin1nam.MONTH = MONTH(CreateDate)
		GROUP BY Thangin1nam.MONTH
		ORDER BY Thangin1nam.MONTH ASC;
END$$
DELIMITER ;

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất (nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào
-- trong tháng")
DELIMITER $$
CREATE PROCEDURE 6_thang_gan_nhat()
BEGIN
		SELECT 6_Month.MONTH, COUNT(QuestionID) AS COUNT
		FROM
		(
			SELECT MONTH(CURRENT_DATE - INTERVAL 5 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 4 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 3 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 2 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AS MONTH
			UNION
			SELECT MONTH(CURRENT_DATE - INTERVAL 0 MONTH) AS MONTH
        ) AS 6_Month
		LEFT JOIN Question ON 6_Month.MONTH = MONTH(CreateDate)
		GROUP BY 6_Month.MONTH
		ORDER BY 6_Month.MONTH ASC;
END$$
DELIMITER ;

CALL  6_thang_gan_nhat;
DROP PROCEDURE 6_thang_gan_nhat;