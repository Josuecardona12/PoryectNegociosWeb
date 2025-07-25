<?php
namespace Utilities;

class ShoppingCart {
    public static function addItem($productId, $quantity = 1) {
        if (!isset($_SESSION["cart"])) {
            $_SESSION["cart"] = [];
        }
        if (isset($_SESSION["cart"][$productId])) {
            $_SESSION["cart"][$productId] += $quantity;
        } else {
            $_SESSION["cart"][$productId] = $quantity;
        }
    }

    public static function removeItem($productId) {
        if (isset($_SESSION["cart"][$productId])) {
            unset($_SESSION["cart"][$productId]);
        }
    }

    public static function clearCart() {
        $_SESSION["cart"] = [];
    }

    public static function getCart() {
        return $_SESSION["cart"] ?? [];
    }
}
