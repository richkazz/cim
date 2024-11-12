import 'package:cim/domain/entities/inventory.dart';
import 'package:cim/domain/repositories/inventory_repository.dart';

class AddProduct {
  final InventoryRepository repository;

  AddProduct(this.repository);

  Future<void> call(Inventory product) async {
    return await repository.addProduct(product);
  }
}
