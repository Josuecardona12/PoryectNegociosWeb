<h1>Ofertas del Día</h1>
<div class="product-list">
  {{foreach productsOnSale}}
    <div class="product" data-productId="{{productId}}">
      <img src="{{productImgUrl}}" alt="{{productName}}">
      <h2>{{productName}}</h2>
      <p>{{productDescription}}</p>
      <span class="price">L {{productPrice}}</span>
      <form action="index.php?page=Cart" method="POST">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="{{productId}}">
        <button type="submit" class="add-to-cart">Agregar al Carrito</button>
      </form>
    </div>
  {{endfor productsOnSale}}
</div>

<h1>Destacados</h1>
<div class="product-list">
  {{foreach productsHighlighted}}
    <div class="product" data-productId="{{productId}}">
      <img src="{{productImgUrl}}" alt="{{productName}}">
      <h2>{{productName}}</h2>
      <p>{{productDescription}}</p>
      <span class="price">L {{productPrice}}</span>
      <form action="index.php?page=Cart" method="POST">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="{{productId}}">
        <button type="submit" class="add-to-cart">Agregar al Carrito</button>
      </form>
    </div>
  {{endfor productsHighlighted}}
</div>

<h1>Novedades</h1>
<div class="product-list">
  {{foreach productsNew}}
    <div class="product" data-productId="{{productId}}">
      <img src="{{productImgUrl}}" alt="{{productName}}">
      <h2>{{productName}}</h2>
      <p>{{productDescription}}</p>
      <span class="price">L {{productPrice}}</span>
      <form action="index.php?page=Cart" method="POST">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="{{productId}}">
        <button type="submit" class="add-to-cart">Agregar al Carrito</button>
      </form>
    </div>
  {{endfor productsNew}}
</div>
