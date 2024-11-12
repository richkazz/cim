class Customer {
  final int id;
  final String name;
  final String phoneNumber;
  final double balance;

  Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.balance,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'balance': balance,
    };
  }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      balance: json['balance'],
    );
  }
}
