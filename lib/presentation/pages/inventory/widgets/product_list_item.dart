import 'package:flutter/material.dart';
import 'package:cim/domain/entities/inventory.dart';

class ProductListItem extends StatelessWidget {
  final Inventory product;

  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('${product.type} - \$${product.price.toStringAsFixed(2)}'),
      trailing: Text('Qty: ${product.quantity}'),
      onTap: () {
        // Navigate to product details or edit page
      },
    );
  }
}
