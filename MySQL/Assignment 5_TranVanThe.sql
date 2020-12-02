USE  testingsystem;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

 CREATE VIEW List_Sale AS
	SELECT		A.*, D.DepartmentName
	FROM 		`Account` A JOIN 	`Department` D ON A.DepartmentID = D.DepartmentID
	WHERE		D.DepartmentName = 'Sale';
    
SELECT 	* 
FROM 	List_Sale;
DROP VIEW List_Sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW AccountgrMAX AS
SELECT A.*, COUNT(GA.AccountID) AS Maxgr 
FROM `account` AS A JOIN groupaccount AS GA ON A.AccountID = GA.AccountID
GROUP BY 		GA.AccountID
HAVING			Maxgr = (SELECT MAX(MAXS.Maxgr) 
                         FROM (SELECT AccountID, COUNT(GA.AccountID) AS Maxgr
                               FROM	groupaccount GA
                               GROUP BY GA.AccountID) AS MAXS);
SELECT * FROM AccountgrMAX;
						--
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
CREATE VIEW Contensolong AS
SELECT 	LENGTH(Content)
FROM	`Question`
WHERE	LENGTH(Content) > 300;
--
SELECT * FROM Contensolong;
-- 
DELETE FROM `Question`
WHERE LENGTH(Content) > 300;
-- 
DROP VIEW Contensolong;
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

--
CREATE VIEW DepartmentMaxAcc AS
SELECT D.*,COUNT(A.DepartmentID) AS MaxAcc 
FROM `account` AS A JOIN `department` AS D ON A.DepartmentID = D.DepartmentID
GROUP BY 		D.DepartmentID
HAVING			MaxAcc = (SELECT MAX(MAXS.MaxAcc) 
                         FROM (SELECT DepartmentID, COUNT(A.DepartmentID) AS MaxAcc
                               FROM	`account` AS A
                               GROUP BY A.DepartmentID) AS MAXS);
                               -- 
SELECT 		* FROM DepartmentMaxAcc;
-- 
DROP VIEW DepartmentMaxAcc;
										
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW QuestionHoNguyentao AS
	SELECT 		Q.*, A.FullName
	FROM 		`Question` AS Q JOIN `Account` AS A ON Q.CreatorID = A.AccountID
	WHERE		SUBSTRING_INDEX(FullName,' ',1) = 'Nguyen';
-- 
SELECT * FROM QuestionHoNguyentao;
-- 
DROP VIEW QuestionHoNguyentao;