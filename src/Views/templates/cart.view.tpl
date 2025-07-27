<h1 class="page-title">Carrito de Compras</h1>

<div class="cart-container">
  <div class="product-list">
    {{foreach cartItems}}
      <div class="product-card" data-productId="{{productId}}">
        <img src="{{productImgUrl}}" alt="{{productName}}" class="product-img" />
        <h2 class="product-name">{{productName}}</h2>
        <p class="product-qty">Cantidad: {{quantity}}</p>
        <span class="price">Precio: L {{price}}</span><br />
        <span class="subtotal">Subtotal: L {{subtotal}}</span>
      </div>
    {{endfor cartItems}}
  </div>

  <div class="cart-summary">
    <h3>Total del Carrito: <span>L {{cartTotal}}</span></h3>
  </div>

  <div class="cart-actions">
    <a href="index.php?page=HomeController" class="btn-back">← Seguir Comprando</a>
    <form action="index.php?page=Checkout_Checkout" method="POST" class="payment-form">
      <button type="submit" class="btn-pay">Proceder al Pago</button>
    </form>
  </div>
</div>
