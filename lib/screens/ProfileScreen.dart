import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _AthleteProfileScreenState createState() => _AthleteProfileScreenState();
}

class _AthleteProfileScreenState extends State<ProfileScreen> {
  String name = "Prabhas";
  String sport = "Football";
  int age = 25;
  String country = "India";
  double height = 186.0;
  double weight = 78.0;
  String profilePictureUrl = 'https://i.pinimg.com/736x/17/54/4c/17544c96bee93a1689a3c6d110dd086d.jpg';
  String bio = "A passionate footballer striving for excellence!";
  List<String> achievements = ["Gold Medal in National Championship", "MVP of Local Football League"];
  List<String> events = ["National Championship - May 2025", "Football World Cup Qualifiers - August 2025"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Athlete Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: SingleChildScrollView(  // Wrap the entire content in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Profile Picture with Gradient Background
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(profilePictureUrl),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Athlete Name and Info
              Center(
                child: Text(name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              ),
              Center(
                child: Text("Age: $age | Country: $country | Sport: $sport", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              ),
              SizedBox(height: 20),

              // Bio Section with Icon
              Text("Bio", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(bio, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ),
              ),
              SizedBox(height: 20),

              // Achievements Section
              Text("Achievements", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 3,
                child: ExpansionTile(
                  title: Text("Tap to view achievements", style: TextStyle(fontSize: 16)),
                  children: achievements.map((achievement) => ListTile(
                    leading: Icon(Icons.star, color: Colors.yellow),
                    title: Text(achievement),
                  )).toList(),
                ),
              ),
              SizedBox(height: 20),

              // Stats Section with Progress Bar
              Text("Performance Stats", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildProgressBar("Goals Scored", 75, 100),
                      SizedBox(height: 10),
                      _buildProgressBar("Matches Played", 45, 100),
                      SizedBox(height: 10),
                      _buildProgressBar("Wins", 35, 50),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Upcoming Events Section with ExpansionTile
              Text("Upcoming Events", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 3,
                child: ExpansionTile(
                  title: Text("Tap to view events", style: TextStyle(fontSize: 16)),
                  children: events.map((event) => ListTile(
                    leading: Icon(Icons.event, color: Colors.blue),
                    title: Text(event),
                  )).toList(),
                ),
              ),
              SizedBox(height: 20),

              // Edit Profile Button with Floating Action Button (FAB)
              FloatingActionButton.extended(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Edit Profile feature coming soon')));
                },
                label: Text('Edit Profile'),
                icon: Icon(Icons.edit),
                backgroundColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create progress bar
  Widget _buildProgressBar(String title, double current, double total) {
    double percentage = (current / total) * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: current / total,
          color: Colors.blueAccent,
          backgroundColor: Colors.grey[300],
        ),
        SizedBox(height: 5),
        Text("${current.toInt()}/${total.toInt()} (${percentage.toStringAsFixed(0)}%)", style: TextStyle(fontSize: 14, color: Colors.grey[600])),
      ],
    );
  }
}
