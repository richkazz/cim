import 'package:cim/presentation/bloc/customer/customer_event.dart';
import 'package:cim/presentation/bloc/customer/customer_state.dart';
import 'package:cim/presentation/bloc/inventory/inventory_event.dart';
import 'package:cim/presentation/bloc/inventory/inventory_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/domain/entities/transaction.dart';
import 'package:cim/domain/entities/customer.dart';
import 'package:cim/domain/entities/inventory.dart';
import 'package:cim/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:cim/presentation/bloc/transaction/transaction_event.dart';
import 'package:cim/presentation/bloc/customer/customer_bloc.dart';
import 'package:cim/presentation/bloc/inventory/inventory_bloc.dart';
import 'package:cim/injection_container.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  _AddTransactionPageState createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  Customer? _selectedCustomer;
  Inventory? _selectedProduct;
  int _quantity = 0;
  double _customPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => sl<CustomerBloc>()..add(GetCustomersEvent())),
          BlocProvider(
              create: (_) => sl<InventoryBloc>()..add(GetProductsEvent())),
          BlocProvider(create: (_) => sl<TransactionBloc>()),
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                BlocBuilder<CustomerBloc, CustomerState>(
                  builder: (context, state) {
                    if (state is CustomersLoaded) {
                      return DropdownButtonFormField<Customer>(
                        decoration:
                            const InputDecoration(labelText: 'Select Customer'),
                        items: state.customers.map((customer) {
                          return DropdownMenuItem(
                            value: customer,
                            child: Text(customer.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCustomer = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Please select a customer' : null,
                      );
                    } else if (state is CustomerLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Text('Error loading customers');
                    }
                  },
                ),
                BlocBuilder<InventoryBloc, InventoryState>(
                  builder: (context, state) {
                    if (state is ProductsLoaded) {
                      return DropdownButtonFormField<Inventory>(
                        decoration:
                            const InputDecoration(labelText: 'Select Product'),
                        items: state.products.map((product) {
                          return DropdownMenuItem(
                            value: product,
                            child: Text(product.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedProduct = value;
                          });
                        },
                        validator: (value) =>
                            value == null ? 'Please select a product' : null,
                      );
                    } else if (state is InventoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Text('Error loading products');
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || int.tryParse(value) == null) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _quantity = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Custom Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _customPrice = double.parse(value!);
                  },
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  onSubmit: (val) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final newTransaction = Transaction(
                        id: DateTime.now().millisecondsSinceEpoch,
                        customerId: _selectedCustomer!.id,
                        productIds: [_selectedProduct!.id],
                        totalAmount: _customPrice * _quantity,
                        date: DateTime.now().toIso8601String(),
                      );

                      val.read<TransactionBloc>().add(
                          AddTransactionEvent(transaction: newTransaction));

                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.onSubmit,
    super.key,
  });

  final ValueChanged<BuildContext> onSubmit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onSubmit(context),
      child: const Text('Add Transaction'),
    );
  }
}
