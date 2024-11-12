class CustomerModel {
  final int id;
  final String name;
  final String phoneNumber;
  final double balance;

  CustomerModel({
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

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      balance: json['balance'],
    );
  }
}
