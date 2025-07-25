<?php

namespace Dao\Products;

use Dao\Table;

class Products extends Table
{
  public static function getFeaturedProducts()
  {
    $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus FROM products p INNER JOIN highlights h ON p.productId = h.productId order by h.highlightStart DESC LIMIT 6";
    $params = [];
    $registros = self::obtenerRegistros($sqlstr, $params);
    return $registros;
  }

  public static function getNewProducts()
  {
    $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus FROM products p WHERE p.productStatus = 'ACT' ORDER BY p.productId DESC LIMIT 3";
    $params = [];
    $registros = self::obtenerRegistros($sqlstr, $params);
    return $registros;
  }

  public static function getDailyDeals()
  {
    $sqlstr = "SELECT p.productId, p.productName, p.productDescription, s.salePrice as productPrice, p.productImgUrl, p.productStatus FROM products p INNER JOIN sales s ON p.productId = s.productId order by s.saleStart DESC LIMIT 3";
    $params = [];
    $registros = self::obtenerRegistros($sqlstr, $params);
    return $registros;
  }
  public static function getProductById(int $productId) {
    $sqlstr = "SELECT productId, productName, productDescription, productPrice, productImgUrl, productStatus 
               FROM products 
               WHERE productId = :productId 
               LIMIT 1";
    $params = [":productId" => $productId]; // Asegúrate de definir el parámetro con el nombre correcto
    return self::obtenerUnRegistro($sqlstr, $params); // Si usas obtenerRegistros(), cambiaría el nombre
}

}
