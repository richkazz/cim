import 'package:cim/domain/entities/inventory.dart';
import 'package:cim/domain/repositories/inventory_repository.dart';

class UpdateProduct {
  final InventoryRepository repository;

  UpdateProduct(this.repository);

  Future<void> call(Inventory product) async {
    return await repository.updateProduct(product);
  }
}
