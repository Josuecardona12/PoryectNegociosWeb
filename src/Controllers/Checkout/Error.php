<?php

namespace Controllers\Checkout;

use Views\Renderer;

class Error extends \Controllers\PublicController
{
    public function run(): void
    {
        Renderer::render("errorc", []);
    }
}
