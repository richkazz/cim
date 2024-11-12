import 'package:cim/data/datasources/local/customer_local_datasource.dart';
import 'package:cim/data/models/customer_model.dart';
import 'package:cim/domain/entities/customer.dart';
import 'package:cim/domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDataSource localDataSource;

  CustomerRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Customer>> getCustomers() async {
    final customerModels = await localDataSource.getCustomers();
    return customerModels
        .map((model) => Customer(
              id: model.id,
              name: model.name,
              phoneNumber: model.phoneNumber,
              balance: model.balance,
            ))
        .toList();
  }

  @override
  Future<void> addCustomer(Customer customer) async {
    final customerModel = CustomerModel(
      id: customer.id,
      name: customer.name,
      phoneNumber: customer.phoneNumber,
      balance: customer.balance,
    );
    await localDataSource.addCustomer(customerModel);
  }

  @override
  Future<void> updateCustomer(Customer customer) async {
    final customerModel = CustomerModel(
      id: customer.id,
      name: customer.name,
      phoneNumber: customer.phoneNumber,
      balance: customer.balance,
    );
    await localDataSource.updateCustomer(customerModel);
  }
}
