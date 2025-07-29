CREATE TABLE highlights (
    `highlightId` int(11) NOT NULL AUTO_INCREMENT,
    `productId` int(11) NOT NULL,
    `highlightStart` datetime NOT NULL,
    `highlightEnd` datetime NOT NULL,
    PRIMARY KEY (`highlightId`),
    KEY `fk_highlights_products_idx` (`productId`),
    CONSTRAINT `fk_highlights_products` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

INSERT INTO
    highlights (
        productId,
        highlightStart,
        highlightEnd
    )
VALUES (
        1,
        '2025-07-01 00:00:00',
        '2025-07-31 23:59:59'
    ),
    (
        2,
        '2025-07-10 00:00:00',
        '2025-07-20 23:59:59'
    ),
    (
        3,
        '2025-07-15 00:00:00',
        '2025-08-15 23:59:59'
    );