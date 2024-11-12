import 'package:cim/domain/entities/customer.dart';
import 'package:cim/domain/repositories/customer_repository.dart';

class AddCustomer {
  final CustomerRepository repository;

  AddCustomer(this.repository);

  Future<void> call(Customer customer) async {
    return await repository.addCustomer(customer);
  }
}
