import 'package:cim/domain/entities/customer.dart';
import 'package:cim/domain/repositories/customer_repository.dart';

class GetCustomers {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  Future<List<Customer>> call() async {
    return await repository.getCustomers();
  }
}
