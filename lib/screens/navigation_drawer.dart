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

  void _navigateTo(BuildContext context, Widget screen, {bool isHome = false}) {
    Navigator.pop(context); // Close the drawer first
    if (isHome) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(context, Icons.home, 'Home', HomePage(isDarkMode: false, onThemeChanged: () {}), isHome: true),
                _buildDrawerItem(context, Icons.person, 'Profile', ProfileScreen()),
                _buildDrawerItem(context, Icons.fitness_center, 'Training', TrainingScreen()),
                _buildDrawerItem(context, Icons.health_and_safety, 'Health', HealthScreen()),
                _buildDrawerItem(context, Icons.bar_chart, 'Performance', PerformanceScreen()),
                _buildDrawerItem(context, Icons.work, 'Career', CareerScreen()),
                _buildDrawerItem(context, Icons.attach_money, 'Finance', FinanceScreen()),
                Divider(), // Separator
                _buildLogoutButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
      accountEmail: Text('guest@example.com', style: TextStyle(color: Colors.white70)),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.person, color: Colors.blueAccent, size: 40),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue]),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget screen, {bool isHome = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: TextStyle(fontSize: 16)),
      onTap: () => _navigateTo(context, screen, isHome: isHome),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
      title: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.redAccent)),
      onTap: () {
        Navigator.pop(context); // Close drawer
        // Implement logout logic (e.g., clearing session, navigating to login screen)
      },
    );
  }
}
