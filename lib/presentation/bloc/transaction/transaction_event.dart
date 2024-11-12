import 'package:cim/domain/entities/transaction.dart';

abstract class TransactionEvent {}

class GetTransactionsEvent extends TransactionEvent {}

class AddTransactionEvent extends TransactionEvent {
  final Transaction transaction;

  AddTransactionEvent({required this.transaction});
}
