import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/domain/usecases/transaction/add_transaction.dart';
import 'package:cim/domain/usecases/transaction/get_transactions.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactions getTransactions;
  final AddTransaction addTransaction;

  TransactionBloc({
    required this.getTransactions,
    required this.addTransaction,
  }) : super(TransactionInitial()) {
    on<GetTransactionsEvent>((event, emit) async {
      emit(TransactionLoading());
      try {
        final transactions = await getTransactions();
        if (isClosed) return;
        emit(TransactionsLoaded(transactions: transactions));
      } catch (e) {
        emit(TransactionError(message: 'Error loading transactions'));
      }
    });
    on<AddTransactionEvent>((event, emit) async {
      try {
        await addTransaction(event.transaction);
        emit(TransactionAdded());
        add(GetTransactionsEvent());
      } catch (e) {
        emit(TransactionError(message: 'Error adding transaction'));
      }
    });
  }
}
