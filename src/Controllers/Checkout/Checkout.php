<?php

namespace Controllers\Checkout;

use Dao\Cart\Cart as CartDao;
use Dao\Orders\Orders as OrdersDao;
use Views\Renderer;
use Utilities\Site as Site;
class Checkout extends \Controllers\PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/check.css");
        $sessionId = session_id();

        // Obtener ítems del carrito
        $cartItems = CartDao::getCartItems($sessionId);
        $total = 0;
        foreach ($cartItems as &$item) {
            $item["quantity"] = (int)$item["quantity"];
            $item["price"] = (float)$item["price"];
            $item["subtotal"] = number_format($item["quantity"] * $item["price"], 2);
            $total += $item["quantity"] * $item["price"];
        }
        unset($item);

        // Datos base para la vista
        $viewData = [
            "cartItems" => $cartItems,
            "cartTotal" => number_format($total, 2),
            "errorMessagesHtml" => "", // Inicializa vacío para la primera carga
            "formData" => []
        ];

        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            // Recolectar y limpiar datos del formulario
            $formData = [
                "clientName" => trim($_POST["clientName"] ?? ""),
                "clientEmail" => trim($_POST["clientEmail"] ?? ""),
                "clientPhone" => trim($_POST["clientPhone"] ?? ""),
                "cardNumber" => trim($_POST["cardNumber"] ?? ""),
                "cardName" => trim($_POST["cardName"] ?? ""),
                "expiry" => trim($_POST["expiry"] ?? ""),
                "cvv" => trim($_POST["cvv"] ?? "")
            ];

            $viewData["formData"] = $formData;
            $errors = [];

            // Validaciones
            if (empty($formData["clientName"])) {
                $errors[] = "El nombre del cliente es obligatorio.";
            }
            if (empty($formData["clientEmail"]) || !filter_var($formData["clientEmail"], FILTER_VALIDATE_EMAIL)) {
                $errors[] = "El email es inválido.";
            }
            if (empty($formData["clientPhone"])) {
                $errors[] = "El teléfono es obligatorio.";
            }
            if (empty($formData["cardNumber"]) || !preg_match('/^\d{16}$/', $formData["cardNumber"])) {
                $errors[] = "Número de tarjeta inválido.";
            }
            if (empty($formData["cardName"])) {
                $errors[] = "El nombre en la tarjeta es requerido.";
            }
            if (empty($formData["expiry"]) || !preg_match('/^(0[1-9]|1[0-2])\/\d{2}$/', $formData["expiry"])) {
                $errors[] = "Fecha de expiración inválida.";
            }
            if (empty($formData["cvv"]) || !preg_match('/^\d{3}$/', $formData["cvv"])) {
                $errors[] = "CVV inválido.";
            }

            if (empty($cartItems)) {
                $errors[] = "El carrito está vacío.";
            }

            if (empty($errors)) {
                $orderId = OrdersDao::createOrder($sessionId, $formData, $cartItems, $total);
                if ($orderId) {
                    CartDao::clearCart($sessionId);
                    header("Location: index.php?page=Checkout_Accept");
                    exit;
                } else {
                    header("Location: index.php?page=Checkout_Error");
                    exit;
                }
            } else {
                // Crear el bloque HTML con errores para mostrar en la vista
                $errorMessages = "<div style='background-color:#f8d7da;color:#721c24;padding:10px;border:1px solid #f5c6cb;border-radius:5px;margin-bottom:10px;'>";
                foreach ($errors as $error) {
                    $errorMessages .= "⚠️ " . htmlspecialchars($error) . "<br>";
                }
                $errorMessages .= "</div>";
                $viewData["errorMessagesHtml"] = $errorMessages;
                
            }
        }

        Renderer::render("payment", $viewData);
    }
}
