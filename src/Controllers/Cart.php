<?php
namespace Controllers;

use Dao\Cart\Cart as CartDao;
use Dao\Products\Products as ProductsDao;
use Views\Renderer;

class Cart extends PublicController
{
    public function run(): void
    {
        $sessionId = session_id();

        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $action = $_POST["action"] ?? null;
            if ($action === "add") {
                $productId = intval($_POST["productId"] ?? 0);
                if ($productId > 0) {
                    $product = ProductsDao::getProductById($productId);
                    if ($product) {
                        CartDao::addProductToCart(
                            $sessionId,
                            $productId,
                            1,
                            $product["productPrice"]
                        );
                    }
                }
                // Redirigir para evitar reenvío al recargar la página
                header("Location: index.php?page=Cart");
                exit;
            }
        }

        // Obtener productos del carrito
        $cartItems = CartDao::getCartItems($sessionId);
        $total = 0;

        foreach ($cartItems as &$item) {
            $item["quantity"] = (int)$item["quantity"];
            $item["price"] = (float)$item["price"];
            $item["subtotal"] = number_format($item["quantity"] * $item["price"], 2);
            $total += $item["quantity"] * $item["price"];
        }
        unset($item);

        $viewData = [
            "cartItems" => $cartItems,
            "cartTotal" => number_format($total, 2)
        ];
        Renderer::render("cart", $viewData);
    }
}
