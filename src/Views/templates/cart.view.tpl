<h1>Carrito de Compras</h1>

<div class="product-list">
  {{foreach cartItems}}
    <div class="product" data-productId="{{productId}}">
      <img src="{{productImgUrl}}" alt="{{productName}}">
      <h2>{{productName}}</h2>
      <p>Cantidad: {{quantity}}</p>
      <span class="price">Precio: L {{price}}</span><br>
      <span class="subtotal">Subtotal: L {{subtotal}}</span>
    </div>
  {{endfor cartItems}}

  <div class="cart-total">
    <h3>Total del Carrito: L {{cartTotal}}</h3>
  </div>
  <div class="paypal-checkout">
  <form action="index.php?page=checkout_checkout" method="POST">
    <button type="submit" class="paypal-button">Pagar con PayPal</button>
  </form>
</div>
