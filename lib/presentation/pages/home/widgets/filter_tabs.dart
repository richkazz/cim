import 'package:flutter/material.dart';

class FilterTabs extends StatelessWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterTab(
              label: 'All Customers',
              onPressed: () {
                // Dispatch event to load all customers
              }),
          FilterTab(
              label: 'Paid in Full',
              onPressed: () {
                // Dispatch event to filter paid customers
              }),
          FilterTab(
              label: 'Outstanding',
              onPressed: () {
                // Dispatch event to filter customers with outstanding balances
              }),
        ],
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const FilterTab({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }
}
