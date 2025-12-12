import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TWIGG",
                        style: TextStyle(
                          color: Color(0xFF085919),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                        ),
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          color: Color(0xFF085919),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.logout, color: Colors.black),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    SummaryCard(
                      title: "Total Balance:",
                      amount: "Rs. 50,000",
                    ),
                    SizedBox(height: 13),
                    SummaryCard(
                      title: "Monthly Expenses:",
                      amount: "Rs. 25,000",
                    ),
                    SizedBox(height: 15),
                    SummaryCard(
                      title: "Investments",
                      amount: "Rs. 1,25,000",
                    ),
                  ],
                ),
              ),
            ),
      ]
      ),
    )
    );
  }
}
