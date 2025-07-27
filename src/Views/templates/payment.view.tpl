<div class="form-wrapper">
  <h2 class="form-title">Datos del Cliente y Pago</h2>

  <form method="POST" action="index.php?page=Checkout_Checkout" class="payment-form">
    <div class="form-grid">
      <div class="form-group">
        <label for="clientName">Nombre del Cliente:</label>
        <input type="text" id="clientName" name="clientName" placeholder="Juan Pérez" value="{{formData_clientName}}">
      </div>

      <div class="form-group">
        <label for="clientEmail">Email:</label>
        <input type="email" id="clientEmail" name="clientEmail" placeholder="ejemplo@correo.com" value="{{formData_clientEmail}}">
      </div>

      <div class="form-group">
        <label for="clientPhone">Teléfono:</label>
        <input type="text" id="clientPhone" name="clientPhone" placeholder="9999-9999" value="{{formData_clientPhone}}">
      </div>

      <div class="form-group">
        <label for="cardNumber">Número de Tarjeta:</label>
        <input type="text" id="cardNumber" name="cardNumber" maxlength="16" placeholder="1234567812345678" value="{{formData_cardNumber}}">
      </div>

      <div class="form-group">
        <label for="cardName">Nombre en la Tarjeta:</label>
        <input type="text" id="cardName" name="cardName" placeholder="Juan Pérez" value="{{formData_cardName}}">
      </div>

      <div class="form-group">
        <label for="expiry">Fecha de Expiración (MM/AA):</label>
        <input type="text" id="expiry" name="expiry" maxlength="5" placeholder="MM/AA" value="{{formData_expiry}}">
      </div>

      <div class="form-group">
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" maxlength="3" placeholder="123" value="{{formData_cvv}}">
      </div>
    </div>

    <button type="submit" class="btn-submit">Confirmar Pago</button>
    {{errorMessagesHtml}}
  </form>
</div>
