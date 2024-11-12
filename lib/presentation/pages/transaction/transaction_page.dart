import 'package:cim/presentation/pages/transaction/add_transaction_page.dart';
import 'package:cim/presentation/pages/transaction/widgets/transaction_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cim/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:cim/presentation/bloc/transaction/transaction_event.dart';
import 'package:cim/presentation/bloc/transaction/transaction_state.dart';
import 'package:cim/injection_container.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Management'),
      ),
      body: BlocProvider(
        create: (_) => sl<TransactionBloc>()..add(GetTransactionsEvent()),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionsLoaded) {
              return ListView.builder(
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionListItem(
                      transaction: state.transactions[index]);
                },
              );
            } else if (state is TransactionError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No transactions found'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddTransactionPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
