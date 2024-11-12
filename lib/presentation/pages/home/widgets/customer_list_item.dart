import 'package:flutter/material.dart';
import 'package:cim/domain/entities/customer.dart';

class CustomerListItem extends StatelessWidget {
  final Customer customer;

  const CustomerListItem({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        title: Text(
          customer.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(customer.phoneNumber),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(customer.balance == 0 ? "Paid" : "Outstanding"),
            Switch(
              value: customer.balance == 0,
              onChanged: (isPaid) {
                // Handle toggling of payment status
              },
            ),
          ],
        ),
      ),
    );
  }
}
