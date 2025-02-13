import 'package:flutter/material.dart';
import 'package:kanki/screens/ProfileScreen.dart';
import 'package:kanki/screens/TrainingScreen.dart';
import 'package:kanki/screens/HealthScreen.dart';
import 'package:kanki/screens/PerformanceScreen.dart';
import 'package:kanki/screens/CareerScreen.dart';
import 'package:kanki/screens/FinanceScreen.dart';
import 'package:kanki/screens/navigation_drawer.dart'; // Import the navigation drawer
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  HomePage({required this.isDarkMode, required this.onThemeChanged});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userName = "Guest";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString("userName") ?? "Guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rishii",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E88E5), // Bluish color for the app bar title
          ),
        ),
        backgroundColor: Colors.black, // Set AppBar background to black
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white), // White icon for the search button
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: Colors.white, // White icon for the theme toggle button
            ),
            onPressed: widget.onThemeChanged,
          ),
        ],
      ),
      drawer: CustomNavigationDrawer(userName: _userName), // Added Navigation Drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInteractiveCard("Athlete Profile Overview", Icons.person, ProfileScreen(), Colors.blue),
              _buildInteractiveCard("Training & Schedule", Icons.fitness_center, TrainingScreen(), Colors.green),
              _buildInteractiveCard("Health Monitoring", Icons.health_and_safety, HealthScreen(), Colors.red),
              _buildInteractiveCard("Performance Tracking", Icons.bar_chart, PerformanceScreen(), Colors.purple),
              _buildInteractiveCard("Career Planning", Icons.timeline, CareerScreen(), Colors.orange),
              _buildInteractiveCard("Financial Management", Icons.attach_money, FinanceScreen(), Colors.teal),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInteractiveCard(String title, IconData icon, Widget targetScreen, Color iconColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 80, color: iconColor), // Colored Icon
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : Colors.blueGrey[800],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Tap to explore more details",
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white70 : Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
