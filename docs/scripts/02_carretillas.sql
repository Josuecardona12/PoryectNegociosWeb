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
