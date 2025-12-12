import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
  bool _isLoading = false;
  String? _error;

  List<Transaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  Future<void> fetchTransactions() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _transactions = data
            .map((json) => Transaction.fromJson(json))
            .toList();
        _error = null;
      } else {
        _error = 'Failed to load transactions: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Error fetching transactions: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

