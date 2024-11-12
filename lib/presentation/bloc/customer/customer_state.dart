import 'package:cim/domain/entities/customer.dart';

abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomersLoaded extends CustomerState {
  final List<Customer> customers;

  CustomersLoaded({required this.customers});
}

class CustomerAdded extends CustomerState {}

class CustomerUpdated extends CustomerState {}

class CustomerError extends CustomerState {
  final String message;

  CustomerError({required this.message});
}
