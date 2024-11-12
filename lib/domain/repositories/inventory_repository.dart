import 'package:cim/domain/entities/inventory.dart';

abstract class InventoryRepository {
  Future<List<Inventory>> getProducts();
  Future<void> addProduct(Inventory product);
  Future<void> updateProduct(Inventory product);
}
