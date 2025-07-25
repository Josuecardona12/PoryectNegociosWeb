<?php
namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Cart\Cart as CartDao;
use Utilities\Paypal\PayPalOrder;
use Utilities\Site;

class Checkout extends PublicController
{
    public function run(): void
    {
        $viewData = [];

        // Inicia sesión para obtener el carrito por session_id()
        session_start();
        $sessionId = session_id();

        if ($this->isPostBack()) {
            $cartItems = CartDao::getCartItems($sessionId);

            if (empty($cartItems)) {
                $viewData["error"] = "No hay productos en el carrito.";
                \Views\Renderer::render("paypal/checkout", $viewData);
                return;
            }

            // Crea una orden con tus URLs de retorno
            $paypalOrder = new PayPalOrder(
                "order_" . time(),
                "http://localhost/PoryectNegociosWeb/index.php?page=Checkout_Error",
                "http://localhost/PoryectNegociosWeb/index.php?page=Checkout_Accept"
            );

            // Agrega productos del carrito
            foreach ($cartItems as $item) {
                $paypalOrder->addItem(
                    $item["productName"],
                    $item["productName"],
                    $item["productId"],
                    floatval($item["price"]),
                    0.0, // impuestos si aplica
                    intval($item["quantity"]),
                    "PHYSICAL_GOODS"
                );
            }

            // Crea la orden con PayPal
            $response = $paypalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;

            // Redirige al usuario a la página de aprobación
            Site::redirectTo($response[0]->href);
            return;
        }

        // Muestra el resumen si no es POST
        $viewData["cartItems"] = CartDao::getCartItems($sessionId);
        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
