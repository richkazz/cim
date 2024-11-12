import 'package:cim/core/constants/app_colors.dart';
import 'package:cim/presentation/pages/customer/add_customer_page.dart';
import 'package:cim/presentation/pages/home/widgets/customer_list_item.dart';
import 'package:cim/presentation/pages/home/widgets/filter_tabs.dart';
import 'package:cim/presentation/pages/inventory/inventory_page.dart';
import 'package:cim/presentation/pages/transaction/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/presentation/bloc/customer/customer_bloc.dart';
import 'package:cim/presentation/bloc/customer/customer_event.dart';
import 'package:cim/presentation/bloc/customer/customer_state.dart';
import 'package:cim/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer & Inventory Management'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Inventory Management'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InventoryPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Transaction Management'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionPage()));
              },
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (_) => sl<CustomerBloc>()..add(GetCustomersEvent()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Customers',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (query) {
                  // Dispatch a search event or filter customers in the BLoC
                },
              ),
            ),
            const FilterTabs(),
            Expanded(
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CustomerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CustomersLoaded) {
                    return ListView.builder(
                      itemCount: state.customers.length,
                      itemBuilder: (context, index) {
                        return CustomerListItem(
                            customer: state.customers[index]);
                      },
                    );
                  } else if (state is CustomerError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('No customers found'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddCustomerPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
