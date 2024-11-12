class TransactionModel {
  final int id;
  final int customerId;
  final List<int> productIds;
  final double totalAmount;
  final String date;

  TransactionModel({
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

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      customerId: json['customerId'],
      productIds: List<int>.from(json['productIds']),
      totalAmount: json['totalAmount'],
      date: json['date'],
    );
  }
}
