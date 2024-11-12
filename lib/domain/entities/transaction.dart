class Transaction {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double totalAmount;
  final String date;

  Transaction({
    required this.id,
    required this.customerId,
    required this.productIds,
    required this.totalAmount,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customerId': customerId,
      'productIds': productIds,
      'totalAmount': totalAmount,
      'date': date,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      customerId: json['customerId'],
      productIds: List<int>.from(json['productIds']),
      totalAmount: json['totalAmount'],
      date: json['date'],
    );
  }
}
