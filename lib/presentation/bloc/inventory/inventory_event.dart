import 'package:cim/domain/entities/inventory.dart';

abstract class InventoryEvent {}

class GetProductsEvent extends InventoryEvent {}

class AddProductEvent extends InventoryEvent {
  final Inventory product;

  AddProductEvent({required this.product});
}

class UpdateProductEvent extends InventoryEvent {
  final Inventory product;

  UpdateProductEvent({required this.product});
}
