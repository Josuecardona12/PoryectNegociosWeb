<?php
namespace Dao\Cart;

use Dao\Table;

class Cart extends Table
{
    public static function getCartBySession(string $sessionId)
    {
        $sql = "SELECT * FROM cart_header WHERE sessionId = :sessionId AND status = 'active' LIMIT 1";
        $params = [":sessionId" => $sessionId];
        return self::obtenerUnRegistro($sql, $params);
    }

    public static function createCart(string $sessionId)
    {
        $sql = "INSERT INTO cart_header (sessionId) VALUES (:sessionId)";
        $params = [":sessionId" => $sessionId];
        self::executeNonQuery($sql, $params);
        return self::getCartBySession($sessionId);
    }

    public static function addProductToCart(string $sessionId, int $productId, int $quantity, float $price)
    {
        $cart = self::getCartBySession($sessionId);
        if (!$cart) {
            $cart = self::createCart($sessionId);
        }

        // Verificar si el producto ya está en el carrito para actualizar cantidad
        $sql = "SELECT * FROM cart_items WHERE cartId = :cartId AND productId = :productId LIMIT 1";
        $params = [":cartId" => $cart["cartId"], ":productId" => $productId];
        $item = self::obtenerUnRegistro($sql, $params);

        if ($item) {
            // Actualizar cantidad
            $newQuantity = $item["quantity"] + $quantity;
            $sql = "UPDATE cart_items SET quantity = :quantity WHERE itemId = :itemId";
            $params = [":quantity" => $newQuantity, ":itemId" => $item["itemId"]];
            self::executeNonQuery($sql, $params);
        } else {
            // Insertar nuevo producto en carrito
            $sql = "INSERT INTO cart_items (cartId, productId, quantity, price) VALUES (:cartId, :productId, :quantity, :price)";
            $params = [
                ":cartId" => $cart["cartId"],
                ":productId" => $productId,
                ":quantity" => $quantity,
                ":price" => $price
            ];
            self::executeNonQuery($sql, $params);
        }
    }

    public static function getCartItems(string $sessionId)
    {
        $cart = self::getCartBySession($sessionId);
        if (!$cart) return [];

        $sql = "SELECT ci.*, p.productName, p.productImgUrl FROM cart_items ci INNER JOIN products p ON ci.productId = p.productId WHERE ci.cartId = :cartId";
        $params = [":cartId" => $cart["cartId"]];
        return self::obtenerRegistros($sql, $params);
    }
}
