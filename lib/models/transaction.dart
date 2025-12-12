class Transaction {
  final int id;
  final String title;
  final String body;

  Transaction({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Get formatted amount: ₹id * 10
  String get formattedAmount {
    return '₹${(id * 10).toString()}';
  }
}

