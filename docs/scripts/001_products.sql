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
('Camiseta Básica', 'Camiseta de algodón 100% para uso diario', 9.99, 'img/products/camiseta_basica.jpg', 'ACT'),
('Laptop Lenovo', 'Laptop Lenovo IdeaPad con procesador i5 y 8GB RAM', 579.99, 'img/products/laptop_lenovo.jpg', 'ACT'),
('Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 29.50, 'img/products/auriculares_bt.jpg', 'ACT'),
('Silla Gamer', 'Silla ergonómica ideal para gamers o trabajo remoto', 139.00, 'img/products/silla_gamer.jpg', 'ACT'),
('Mouse Inalámbrico', 'Mouse óptico inalámbrico USB', 12.75, 'img/products/mouse_inalambrico.jpg', 'ACT'),
('Teclado Mecánico', 'Teclado retroiluminado con switches azules', 49.99, 'img/products/teclado_mecanico.jpg', 'ACT'),
('Botella Térmica', 'Botella de acero inoxidable de 500ml', 15.00, 'img/products/botella_termica.jpg', 'ACT'),
('Smartwatch X1', 'Reloj inteligente con monitor de ritmo cardíaco', 89.90, 'img/products/smartwatch_x1.jpg', 'ACT'),
('Gorra Negra', 'Gorra deportiva ajustable, color negro', 7.80, 'img/products/gorra_negra.jpg', 'ACT'),
('Cargador Portátil', 'Power bank 10000mAh con carga rápida', 25.60, 'img/products/power_bank.jpg', 'ACT');
