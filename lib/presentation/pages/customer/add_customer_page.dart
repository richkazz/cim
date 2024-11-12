import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/domain/entities/customer.dart';
import 'package:cim/presentation/bloc/customer/customer_bloc.dart';
import 'package:cim/presentation/bloc/customer/customer_event.dart';
import 'package:cim/injection_container.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: BlocProvider(
        create: (_) => sl<CustomerBloc>(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the customer name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the customer phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  onSubmit: (val) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final newCustomer = Customer(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: _name,
                        phoneNumber: _phone,
                        balance: 0.0, // Initially, the balance is set to 0.0
                      );

                      val
                          .read<CustomerBloc>()
                          .add(AddCustomerEvent(customer: newCustomer));

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
      child: const Text('Add Customer'),
    );
  }
}
