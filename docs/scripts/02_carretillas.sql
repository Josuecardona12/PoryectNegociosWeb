CREATE TABLE cart_header (
  cartId INT AUTO_INCREMENT PRIMARY KEY,
  sessionId VARCHAR(255),
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) DEFAULT 'active' -- activo, finalizado, cancelado
);

CREATE TABLE cart_items (
  itemId INT AUTO_INCREMENT PRIMARY KEY,
  cartId INT,
  productId INT,
  quantity INT DEFAULT 1,
  price DECIMAL(10,2),
  FOREIGN KEY (cartId) REFERENCES cart_header(cartId),
  FOREIGN KEY (productId) REFERENCES products(productId)
);
CREATE TABLE orders (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    sessionId VARCHAR(255) NOT NULL,
    clientName VARCHAR(100) NOT NULL,
    clientEmail VARCHAR(100) NOT NULL,
    clientPhone VARCHAR(50) NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE order_items (
    itemId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);
