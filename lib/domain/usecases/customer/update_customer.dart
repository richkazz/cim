import 'package:cim/domain/entities/customer.dart';
import 'package:cim/domain/repositories/customer_repository.dart';

class UpdateCustomer {
  final CustomerRepository repository;

  UpdateCustomer(this.repository);

  Future<void> call(Customer customer) async {
    return await repository.updateCustomer(customer);
  }
}
