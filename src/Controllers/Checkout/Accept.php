<?php

namespace Controllers\Checkout;

use Views\Renderer;

class Accept extends \Controllers\PublicController
{
    public function run(): void
    {
        Renderer::render("accept", []);
    }
}
