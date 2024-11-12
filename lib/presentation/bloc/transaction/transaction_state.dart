import 'package:cim/domain/entities/transaction.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionsLoaded extends TransactionState {
  final List<Transaction> transactions;

  TransactionsLoaded({required this.transactions});
}

class TransactionAdded extends TransactionState {}

class TransactionError extends TransactionState {
  final String message;

  TransactionError({required this.message});
}
