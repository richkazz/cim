import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/domain/usecases/inventory/add_product.dart';
import 'package:cim/domain/usecases/inventory/get_products.dart';
import 'package:cim/domain/usecases/inventory/update_product.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final GetProducts getProducts;
  final AddProduct addProduct;
  final UpdateProduct updateProduct;

  InventoryBloc({
    required this.getProducts,
    required this.addProduct,
    required this.updateProduct,
  }) : super(InventoryInitial()) {
    on<GetProductsEvent>((event, emit) async {
      if (isClosed) return;
      emit(InventoryLoading());
      try {
        final products = await getProducts();
        if (isClosed) return;
        emit(ProductsLoaded(products: products));
      } catch (e) {
        emit(InventoryError(message: 'Error loading products'));
      }
    });
    on<AddProductEvent>((event, emit) async {
      try {
        await addProduct(event.product);
        emit(ProductAdded());
        add(GetProductsEvent());
      } catch (e) {
        emit(InventoryError(message: 'Error adding product'));
      }
    });

    on<UpdateProductEvent>((event, emit) async {
      try {
        await updateProduct(event.product);
        emit(ProductUpdated());
        add(GetProductsEvent());
      } catch (e) {
        emit(InventoryError(message: 'Error updating product'));
      }
    });
  }
}
