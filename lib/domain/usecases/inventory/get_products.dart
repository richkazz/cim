import 'package:cim/domain/entities/inventory.dart';
import 'package:cim/domain/repositories/inventory_repository.dart';

class GetProducts {
  final InventoryRepository repository;

  GetProducts(this.repository);

  Future<List<Inventory>> call() async {
    return await repository.getProducts();
  }
}
