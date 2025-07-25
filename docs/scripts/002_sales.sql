CREATE TABLE sales(
    `saleId` int(11) NOT NULL AUTO_INCREMENT,
    `productId` int(11) NOT NULL,
    `salePrice` decimal(10,2) NOT NULL,
    `saleStart` datetime NOT NULL,
    `saleEnd` datetime NOT NULL,
    PRIMARY KEY (`saleId`),
    KEY `fk_sales_products_idx` (`productId`),
    CONSTRAINT `fk_sales_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

  INSERT INTO sales (productId, salePrice, saleStart, saleEnd) VALUES
(1, 7.99, '2025-07-20 00:00:00', '2025-07-27 23:59:59'),
(2, 499.99, '2025-07-21 08:00:00', '2025-07-28 22:00:00'),
(3, 24.99, '2025-07-23 00:00:00', '2025-07-30 23:59:59'),
(5, 10.50, '2025-07-22 10:00:00', '2025-07-26 22:00:00'),
(6, 44.99, '2025-07-25 00:00:00', '2025-08-01 23:59:59'),
(8, 79.90, '2025-07-24 12:00:00', '2025-07-31 12:00:00');
