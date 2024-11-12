import 'package:cim/domain/entities/customer.dart';

abstract class CustomerEvent {}

class GetCustomersEvent extends CustomerEvent {}

class AddCustomerEvent extends CustomerEvent {
  final Customer customer;

  AddCustomerEvent({required this.customer});
}

class UpdateCustomerEvent extends CustomerEvent {
  final Customer customer;

  UpdateCustomerEvent({required this.customer});
}
