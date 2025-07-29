<?php

namespace Controllers\Orders;

use Dao\Orders\Orders as OrdersDao;
use Views\Renderer;
use Utilities\Site as Site;

class History extends \Controllers\PrivateController
{
    public function run(): void
    {
        // Agregar hoja de estilos específica para historial de órdenes
        Site::addLink("public/css/orders.css");

        $orders = OrdersDao::getAllOrders();

        foreach ($orders as &$order) {
            $order['items'] = OrdersDao::getOrderItems($order['orderId']);
        }
        unset($order);

        $viewData = [
            "orders" => $orders
        ];

        Renderer::render("history", $viewData);
    }
}
