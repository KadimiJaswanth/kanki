import 'package:flutter/material.dart';
import 'package:kanki/screens/home_screen.dart';
import 'package:kanki/screens/ProfileScreen.dart';
import 'package:kanki/screens/TrainingScreen.dart';
import 'package:kanki/screens/HealthScreen.dart';
import 'package:kanki/screens/PerformanceScreen.dart';
import 'package:kanki/screens/CareerScreen.dart';
import 'package:kanki/screens/FinanceScreen.dart';

class CustomNavigationDrawer extends StatelessWidget {
  final String userName;

  const CustomNavigationDrawer({Key? key, required this.userName}) : super(key: key);

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context); // Close the drawer first
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text('guest@example.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blueAccent),
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', HomePage(isDarkMode: false, onThemeChanged: () {})),
          _buildDrawerItem(context, Icons.person, 'Profile', ProfileScreen()),
          _buildDrawerItem(context, Icons.fitness_center, 'Training', TrainingScreen()),
          _buildDrawerItem(context, Icons.health_and_safety, 'Health', HealthScreen()),
          _buildDrawerItem(context, Icons.bar_chart, 'Performance', PerformanceScreen()),
          _buildDrawerItem(context, Icons.work, 'Career', CareerScreen()),
          _buildDrawerItem(context, Icons.attach_money, 'Finance', FinanceScreen()),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget screen) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => _navigateTo(context, screen),
    );
  }
}
