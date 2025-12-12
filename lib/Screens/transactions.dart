import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/transaction_card.dart';
import '../providers/transaction_provider.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch transactions when screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionProvider>(context, listen: false).fetchTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.only(left: 21, top: 16, right: 21),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transactions",
                  style: TextStyle(
                    color: Color(0xFF085919),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Consumer<TransactionProvider>(
                builder: (context, provider, child) {
                  // Loading state
                  if (provider.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF085919),
                      ),
                    );
                  }

                  // Error state
                  if (provider.hasError) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.red,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Error',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              provider.error ?? 'Unknown error',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                provider.fetchTransactions();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF085919),
                                foregroundColor: Colors.white,
                              ),
                              child: Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Empty state
                  if (provider.transactions.isEmpty) {
                    return Center(
                      child: Text(
                        'No transactions found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    );
                  }

                  // Success state - show transactions
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: provider.transactions.map((transaction) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          child: TransactionCard(
                            title: transaction.title,
                            description: transaction.body,
                            amount: transaction.formattedAmount,
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

