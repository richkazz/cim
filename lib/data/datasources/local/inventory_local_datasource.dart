import 'dart:convert';
import 'package:cim/data/models/inventory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InventoryLocalDataSource {
  Future<List<InventoryModel>> getProducts();
  Future<void> addProduct(InventoryModel product);
  Future<void> updateProduct(InventoryModel product);
}

class InventoryLocalDataSourceImpl implements InventoryLocalDataSource {
  final SharedPreferences sharedPreferences;

  InventoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<InventoryModel>> getProducts() async {
    final jsonString = sharedPreferences.getString('inventory');
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => InventoryModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addProduct(InventoryModel product) async {
    final products = await getProducts();
    products.add(product);
    final jsonString =
        json.encode(products.map((product) => product.toJson()).toList());
    sharedPreferences.setString('inventory', jsonString);
  }

  @override
  Future<void> updateProduct(InventoryModel product) async {
    final products = await getProducts();
    final index = products
        .indexWhere((existingProduct) => existingProduct.id == product.id);
    if (index != -1) {
      products[index] = product;
      final jsonString =
          json.encode(products.map((product) => product.toJson()).toList());
      sharedPreferences.setString('inventory', jsonString);
    }
  }
}
