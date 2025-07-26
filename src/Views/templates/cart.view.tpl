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
  <div class="actions">
    <div class="actions" style="margin-top: 15px;">
    <a href="index.php?page=HomeController" class="btn-back-to-cart" style="margin-right: 15px; padding: 8px 12px; background:#ccc; border:none; border-radius:4px; text-decoration:none; color:#000;">
      ← Volver al Carrito
    </a>
    <form action="index.php?page=Checkout_Checkout" method="POST" style="display:inline-block;">
      <button type="submit" class="payment-button">Pagar</button>
    </form>
  </div>
</div>