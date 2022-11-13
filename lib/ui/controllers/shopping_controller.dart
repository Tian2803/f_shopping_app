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
    newTotal = (entries[0].quantity * entries[0].price) +
        (entries[1].quantity * entries[1].price);

    total.value = newTotal;
    print(total.value);
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    if (id != entries.firstWhere((id) => true)) {
      entries.indexOf(id);
      entries[id].quantity += 1; 
    }
    entries[id].quantity;
    print(entries[id].quantity);
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    if (entries[id].quantity > 0) {
      if (id != entries.firstWhere((id) => true)) {
        entries.indexOf(id);
        entries[id].quantity -= 1;
      }
      entries[id].quantity;
    }else{
      entries[id].quantity = 0;
    }

    print(entries[id].quantity);
    calcularTotal();
  }
}
