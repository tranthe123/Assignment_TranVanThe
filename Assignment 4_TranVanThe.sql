USE `classicmodels`;
-- Question 1: Tính tổng giá trị của các order đã xuất kho (‘shipped’) trong tháng Tám năm 2004
SELECT SUM(priceEach) AS Sum_values
FROM `orderdetails` AS Od JOIN `orders` AS O ON Od.orderNumber = O.orderNumber
WHERE shippedDate BETWEEN  '2004-08-01' AND '2004-08-30';
-- Question 2: Tính lợi nhuận (profit) thu được từ mỗi khách hàng dựa trên các orders mà họ thực hiện.
-- Liệt kê theo tên khách hàng
SELECT SUM(amount) AS Profit,customerName AS CName
FROM `customers` AS C JOIN `payments` AS P ON C.customerNumber = P.customerNumber
GROUP BY customerName;

-- Question 3: Tính doanh thu (revenue) mà mỗi sản phẩm mang lại. Liệt kê theo tên sản phẩm.
SELECT SUM(priceEach),productName AS PName
FROM `orderdetails` AS Od   CROSS JOIN `products` AS Pducts 
GROUP BY productName;