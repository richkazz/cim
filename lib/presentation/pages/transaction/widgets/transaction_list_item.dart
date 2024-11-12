import 'package:flutter/material.dart';
import 'package:cim/domain/entities/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Transaction #${transaction.id}'),
      subtitle: Text('Total: \$${transaction.totalAmount.toStringAsFixed(2)}'),
      trailing: Text(transaction.date),
      onTap: () {
        // Navigate to transaction details or edit page
      },
    );
  }
}
