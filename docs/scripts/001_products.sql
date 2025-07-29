CREATE TABLE products (
    `productId` int(11) NOT NULL AUTO_INCREMENT,
    `productName` varchar(255) NOT NULL,
    `productDescription` text NOT NULL,
    `productPrice` decimal(10,2) NOT NULL,
    `productImgUrl` varchar(255) NOT NULL,
    `productStatus` char(3) NOT NULL,
    PRIMARY KEY (`productId`)
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

  USE nwdb;

INSERT INTO products (productName, productDescription, productPrice, productImgUrl, productStatus) VALUES

('Laptop Lenovo', 'Laptop Lenovo IdeaPad con procesador i5 y 8GB RAM', 579.99, '/PoryectNegociosWeb/public/imgs/products/laptop_lenovo.jpeg', 'ACT'),
('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 29.50, '/PoryectNegociosWeb/public/imgs/products/auriculares.jpeg', 'ACT'),
('Smartwatch X1', 'Reloj inteligente con monitor de ritmo cardíaco', 89.90, '/PoryectNegociosWeb/public/imgs/products/Smartwatch.jpeg', 'ACT'),
('Gorra Negra', 'Gorra deportiva ajustable, color negro', 7.80, '/PoryectNegociosWeb/public/imgs/products/GorraNegra.jpeg', 'ACT'),
('Cargador Portátil', 'Power bank 10000mAh con carga rápida', 25.60, '/PoryectNegociosWeb/public/imgs/products/CargadorPortátil.jpeg', 'ACT');
