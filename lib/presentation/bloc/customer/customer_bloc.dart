import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_event.dart';
import 'customer_state.dart';
import 'package:cim/domain/usecases/customer/get_customers.dart';
import 'package:cim/domain/usecases/customer/add_customer.dart';
import 'package:cim/domain/usecases/customer/update_customer.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final GetCustomers getCustomers;
  final AddCustomer addCustomer;
  final UpdateCustomer updateCustomer;

  CustomerBloc({
    required this.getCustomers,
    required this.addCustomer,
    required this.updateCustomer,
  }) : super(CustomerInitial()) {
    on<GetCustomersEvent>((event, emit) async {
      emit(CustomerLoading());
      try {
        final customers = await getCustomers();
        emit(CustomersLoaded(customers: customers));
      } catch (e) {
        emit(CustomerError(message: 'Error loading customers'));
      }
    });
    on<AddCustomerEvent>((event, emit) async {
      try {
        await addCustomer(event.customer);
        emit(CustomerAdded());
        add(GetCustomersEvent());
      } catch (e) {
        emit(CustomerError(message: 'Error adding customer'));
      }
    });
    on<UpdateCustomerEvent>((event, emit) async {
      try {
        await updateCustomer(event.customer);
        emit(CustomerUpdated());
        add(GetCustomersEvent());
      } catch (e) {
        emit(CustomerError(message: 'Error updating customer'));
      }
    });
  }
}
