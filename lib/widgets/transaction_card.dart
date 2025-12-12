import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final String description;
  final String amount;

  const TransactionCard({
    Key? key,
    required this.title,
    required this.description,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Color(0xFFDEF3DB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            _truncateText(title,maxLength: 15),
            style: TextStyle(
              color: Color(0xFF013A0B),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 7),
          Text(
            _truncateText(description,maxLength: 60),
            style: TextStyle(
              color: Color(0xFF013A0B),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 7),
          Text(
            amount,
            style: TextStyle(
              color: Color(0xFF013A0B),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  String _truncateText(String text, {int maxLength = 20}) {
    return text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;
  }
}

