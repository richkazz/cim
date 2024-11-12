import 'package:cim/presentation/pages/inventory/add_inventory_page.dart';
import 'package:cim/presentation/pages/inventory/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/presentation/bloc/inventory/inventory_bloc.dart';
import 'package:cim/presentation/bloc/inventory/inventory_event.dart';
import 'package:cim/presentation/bloc/inventory/inventory_state.dart';
import 'package:cim/injection_container.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
      ),
      body: BlocProvider(
        create: (_) => sl<InventoryBloc>()..add(GetProductsEvent()),
        child: BlocBuilder<InventoryBloc, InventoryState>(
          builder: (context, state) {
            if (state is InventoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ProductListItem(product: state.products[index]);
                },
              );
            } else if (state is InventoryError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No products found'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddInventoryPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
