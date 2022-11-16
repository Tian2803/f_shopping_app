import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;

    for (Product product in entries) {
      newTotal = newTotal + product.price * product.quantity;
    }

    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    Product product = entries.firstWhere((element) => id == element.id);
    int index = entries.indexOf(product);
    product.quantity += 1;
    entries[index] = product;
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    Product product = entries.firstWhere((element) => id == element.id);
    int index = entries.indexOf(product);
    if (product.quantity > 0) {
      product.quantity -= 1;
      entries[index] = product;
    }
    calcularTotal();
  }
}
