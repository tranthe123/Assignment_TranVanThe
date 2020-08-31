USE `classicmodels`;
-- Question 1: Tính tổng giá trị của các order đã xuất kho (‘shipped’) trong tháng Tám năm 2004
SELECT SUM(Od.priceEach * Od.quantityOrdered) AS Sum_values
FROM `orderdetails` AS Od JOIN `orders` AS O ON Od.orderNumber = O.orderNumber
WHERE shippedDate BETWEEN  '2004-08-01' AND '2004-08-31'AND `status` = 'shipped';
-- Question 2: Tính lợi nhuận (profit) thu được từ mỗi khách hàng dựa trên các orders mà họ thực hiện.
-- Liệt kê theo tên khách hàng


SELECT C.customerName, IFNULL(SUM(Od.quantityOrdered),0) AS total_orders, IFNULL(SUM(Od.quantityOrdered*(Od.priceEach-P.buyPrice)),0) AS Profit
FROM `customers` AS C
LEFT JOIN `orders` AS O  ON C.customerNumber = O.customerNumber
LEFT JOIN `orderdetails` AS Od  ON Od.orderNumber = O.orderNumber
LEFT JOIN `products` AS P  ON P.productCode = Od.productCode
GROUP BY C.customerName
ORDER BY C.customerName;

-- Question 3: Tính doanh thu (revenue) mà mỗi sản phẩm mang lại. Liệt kê theo tên sản phẩm.
SELECT P.productCode, IFNULL(SUM(Od.quantityOrdered),0) AS total_orders, IFNULL(SUM(Od.quantityOrdered*Od.priceEach),0) AS Revenue
FROM `orderdetails` AS Od  RIGHT JOIN `products` AS P 
ON Od.productCode = P.productCode
GROUP BY productCode;
