import 'dart:convert';
import 'package:cim/data/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TransactionLocalDataSource {
  Future<List<TransactionModel>> getTransactions();
  Future<void> addTransaction(TransactionModel transaction);
}

class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  final SharedPreferences sharedPreferences;

  TransactionLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final jsonString = sharedPreferences.getString('transactions');
    if (jsonString != null) {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => TransactionModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final transactions = await getTransactions();
    transactions.add(transaction);
    final jsonString = json.encode(
        transactions.map((transaction) => transaction.toJson()).toList());
    sharedPreferences.setString('transactions', jsonString);
  }
}
