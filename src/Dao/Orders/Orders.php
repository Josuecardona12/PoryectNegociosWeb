<?php

namespace Dao\Orders;

use Dao\Table;

class Orders extends Table
{
    public static function createOrder($sessionId, $clientData, $cartItems, $total)
    {
        // Guardar orden principal
        $sql = "INSERT INTO orders (sessionId, clientName, clientEmail, clientPhone, totalAmount, status, createdAt) 
                VALUES (:sessionId, :clientName, :clientEmail, :clientPhone, :totalAmount, 'pending', NOW())";

        $params = [
            ":sessionId" => $sessionId,
            ":clientName" => $clientData["clientName"],
            ":clientEmail" => $clientData["clientEmail"],
            ":clientPhone" => $clientData["clientPhone"],
            ":totalAmount" => $total
        ];

        self::executeNonQuery($sql, $params);
        $orderId = self::getLastInsertId();

        if (!$orderId) {
            return false;
        }

        // Guardar detalle de orden
        foreach ($cartItems as $item) {
            $sql = "INSERT INTO order_items (orderId, productId, quantity, price) 
                    VALUES (:orderId, :productId, :quantity, :price)";
            $params = [
                ":orderId" => $orderId,
                ":productId" => $item["productId"],
                ":quantity" => $item["quantity"],
                ":price" => $item["price"]
            ];
            self::executeNonQuery($sql, $params);
        }

        return $orderId;
    }
    public static function getAllOrders(): array
    {
        return self::obtenerRegistros("SELECT * FROM orders ORDER BY createdAt DESC", []);
    }

    public static function getOrderItems(int $orderId): array
    {
        return self::obtenerRegistros(
            "SELECT oi.*, p.productName, p.productImgUrl 
         FROM order_items oi
         INNER JOIN products p ON oi.productId = p.productId
         WHERE oi.orderId = :orderId",
            [":orderId" => $orderId]
        );
    }
}
