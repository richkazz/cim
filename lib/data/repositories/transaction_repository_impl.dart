import 'package:cim/data/datasources/local/transaction_local_datasource.dart';
import 'package:cim/data/models/transaction_model.dart';
import 'package:cim/domain/entities/transaction.dart';
import 'package:cim/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource localDataSource;

  TransactionRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Transaction>> getTransactions() async {
    final transactionModels = await localDataSource.getTransactions();
    return transactionModels
        .map((model) => Transaction(
              id: model.id,
              customerId: model.customerId,
              productIds: model.productIds,
              totalAmount: model.totalAmount,
              date: model.date,
            ))
        .toList();
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final transactionModel = TransactionModel(
      id: transaction.id,
      customerId: transaction.customerId,
      productIds: transaction.productIds,
      totalAmount: transaction.totalAmount,
      date: transaction.date,
    );
    await localDataSource.addTransaction(transactionModel);
  }
}
