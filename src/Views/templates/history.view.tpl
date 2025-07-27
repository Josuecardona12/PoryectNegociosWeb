<h1 class="page-title">Historial de Ventas</h1>

{{foreach orders}}
  <div class="order-card" data-orderId="{{orderId}}">
    <h2>Orden #{{orderId}} - {{clientName}}</h2>
    <p>
      <strong>Email:</strong> {{clientEmail}} |
      <strong>Tel:</strong> {{clientPhone}}
    </p>
    <p>
      <strong>Total:</strong> L. {{totalAmount}} |
      <strong>Estado:</strong> <span class="status {{status}}">{{status}}</span>
    </p>
    <p><strong>Fecha:</strong> {{createdAt}}</p>

    <h3>Productos:</h3>
    <div class="items-list">
      {{foreach items}}
        <div class="item">
          <img src="{{productImgUrl}}" alt="{{productName}}" />
          <span class="item-name">{{productName}}</span>
          <span class="item-qty">Cant: {{quantity}}</span>
          <span class="item-price">Precio: L. {{price}}</span>
        </div>
      {{endfor items}}
    </div>
  </div>
{{endfor orders}}

{{if !orders}}
  <p class="no-orders-msg">No hay órdenes registradas.</p>
{{endif}}

<a href="index.php?page=HomeController" class="btn-back-to-cart">← Volver al inicio</a>
