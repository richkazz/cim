class Inventory {
  final int id;
  final String name;
  final String type;
  final double price;
  final int quantity;

  Inventory({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
