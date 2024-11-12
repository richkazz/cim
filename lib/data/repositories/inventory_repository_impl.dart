import 'package:cim/data/datasources/local/inventory_local_datasource.dart';
import 'package:cim/data/models/inventory_model.dart';
import 'package:cim/domain/entities/inventory.dart';
import 'package:cim/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryLocalDataSource localDataSource;

  InventoryRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Inventory>> getProducts() async {
    final productModels = await localDataSource.getProducts();
    return productModels
        .map((model) => Inventory(
              id: model.id,
              name: model.name,
              type: model.type,
              price: model.price,
              quantity: model.quantity,
            ))
        .toList();
  }

  @override
  Future<void> addProduct(Inventory product) async {
    final productModel = InventoryModel(
      id: product.id,
      name: product.name,
      type: product.type,
      price: product.price,
      quantity: product.quantity,
    );
    await localDataSource.addProduct(productModel);
  }

  @override
  Future<void> updateProduct(Inventory product) async {
    final productModel = InventoryModel(
      id: product.id,
      name: product.name,
      type: product.type,
      price: product.price,
      quantity: product.quantity,
    );
    await localDataSource.updateProduct(productModel);
  }
}
