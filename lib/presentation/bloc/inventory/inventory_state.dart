import 'package:cim/domain/entities/inventory.dart';

abstract class InventoryState {}

class InventoryInitial extends InventoryState {}

class InventoryLoading extends InventoryState {}

class ProductsLoaded extends InventoryState {
  final List<Inventory> products;

  ProductsLoaded({required this.products});
}

class ProductAdded extends InventoryState {}

class ProductUpdated extends InventoryState {}

class InventoryError extends InventoryState {
  final String message;

  InventoryError({required this.message});
}
