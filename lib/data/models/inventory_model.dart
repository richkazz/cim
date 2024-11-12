class InventoryModel {
  final int id;
  final String name;
  final String type;
  final double price;
  final int quantity;

  InventoryModel({
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

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
