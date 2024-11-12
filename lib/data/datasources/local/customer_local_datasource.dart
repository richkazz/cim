import 'dart:convert';
import 'package:cim/data/models/customer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CustomerLocalDataSource {
  Future<List<CustomerModel>> getCustomers();
  Future<void> addCustomer(CustomerModel customer);
  Future<void> updateCustomer(CustomerModel customer);
}

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final SharedPreferences sharedPreferences;

  CustomerLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CustomerModel>> getCustomers() async {
    final jsonString = sharedPreferences.getString('customers');
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => CustomerModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addCustomer(CustomerModel customer) async {
    final customers = await getCustomers();
    customers.add(customer);
    final jsonString =
        json.encode(customers.map((customer) => customer.toJson()).toList());
    sharedPreferences.setString('customers', jsonString);
  }

  @override
  Future<void> updateCustomer(CustomerModel customer) async {
    final customers = await getCustomers();
    final index = customers
        .indexWhere((existingCustomer) => existingCustomer.id == customer.id);
    if (index != -1) {
      customers[index] = customer;
      final jsonString =
          json.encode(customers.map((customer) => customer.toJson()).toList());
      sharedPreferences.setString('customers', jsonString);
    }
  }
}
