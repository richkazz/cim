import 'package:cim/data/repositories/inventory_repository_impl.dart';
import 'package:cim/data/repositories/transaction_repository_impl.dart';
import 'package:cim/presentation/bloc/customer/customer_bloc.dart';
import 'package:cim/presentation/bloc/inventory/inventory_bloc.dart';
import 'package:cim/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasources/local/customer_local_datasource.dart';
import 'data/datasources/local/inventory_local_datasource.dart';
import 'data/datasources/local/transaction_local_datasource.dart';
import 'data/repositories/customer_repository_impl.dart';
import 'domain/repositories/customer_repository.dart';
import 'domain/repositories/inventory_repository.dart';
import 'domain/repositories/transaction_repository.dart';
import 'domain/usecases/customer/add_customer.dart';
import 'domain/usecases/customer/get_customers.dart';
import 'domain/usecases/customer/update_customer.dart';
import 'domain/usecases/inventory/add_product.dart';
import 'domain/usecases/inventory/get_products.dart';
import 'domain/usecases/inventory/update_product.dart';
import 'domain/usecases/transaction/add_transaction.dart';
import 'domain/usecases/transaction/get_transactions.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // Data sources
  sl.registerLazySingleton<CustomerLocalDataSource>(
    () => CustomerLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );
  sl.registerLazySingleton<InventoryLocalDataSource>(
    () => InventoryLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );
  sl.registerLazySingleton<TransactionLocalDataSource>(
    () => TransactionLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );

  // Repositories
  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(
      localDataSource: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AddCustomer(sl()));
  sl.registerLazySingleton(() => GetCustomers(sl()));
  sl.registerLazySingleton(() => UpdateCustomer(sl()));
  sl.registerLazySingleton(() => AddProduct(sl()));
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => AddTransaction(sl()));
  sl.registerLazySingleton(() => GetTransactions(sl()));

  // Blocs
  sl.registerLazySingleton(
    () => CustomerBloc(
      getCustomers: sl(),
      addCustomer: sl(),
      updateCustomer: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => InventoryBloc(
      getProducts: sl(),
      addProduct: sl(),
      updateProduct: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => TransactionBloc(
      getTransactions: sl(),
      addTransaction: sl(),
    ),
  );
}
