import 'package:flutter/material.dart';
import 'home_page.dart';
import 'bot.dart';
import 'transactions.dart';
import '../widgets/bottom_nav_bar.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({Key? key}) : super(key: key);

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    Container(
      child: Center(
        child: Text(
          'Screen 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ),
    TransactionsScreen(),
  ];

  void _onNavTap(int index) {
    if (index == 1) {
      // Navigate to bot screen as a separate route
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BotScreen()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

