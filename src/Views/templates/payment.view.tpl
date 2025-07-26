<h2>Datos del Cliente y Pago</h2>

{{errorMessagesHtml}}


<form method="POST" action="index.php?page=Checkout_Checkout">
  <label>Nombre del Cliente:</label><br>
  <input type="text" placeholder="Juan Pérez" name="clientName" value="{{formData_clientName}}"><br>

  <label>Email:</label><br>
  <input type="email" placeholder="ejemplo@correo.com" name="clientEmail" value="{{formData_clientEmail}}"><br>

  <label>Teléfono:</label><br>
  <input type="text" placeholder="9999-9999" name="clientPhone" value="{{formData_clientPhone}}"><br>

  <label>Número de Tarjeta:</label><br>
  <input type="text" placeholder="1234567812345678" name="cardNumber" maxlength="16" value="{{formData_cardNumber}}"><br>

  <label>Nombre en la Tarjeta:</label><br>
  <input type="text" placeholder="Juan Pérez"  name="cardName" value="{{formData_cardName}}"><br>

  <label>Fecha de Expiración (MM/AA):</label><br>
  <input type="text" placeholder="MM/AA" name="expiry" placeholder="MM/AA" value="{{formData_expiry}}"><br>

  <label>CVV:</label><br>
  <input type="text"  placeholder="123"  name="cvv" maxlength="3" value="{{formData_cvv}}"><br><br>

  <button type="submit">Confirmar Pago</button>
</form>
