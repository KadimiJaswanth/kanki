import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AthleteProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Athlete Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Action for notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header: Image, Name, Sport
              _buildProfileHeader(),

              SizedBox(height: 20),
              // Personal Info Section with Card widget
              _buildSectionWithCard("Personal Information", _buildPersonalInfo(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Performance Stats", _buildPerformanceStats(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Injury Status", _buildInjuryStatus(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Goals & Progress", _buildGoalsProgress(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Achievements", _buildAchievements(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Athlete Stats Progress", _buildProgressIndicator(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Social Media", _buildSocialMediaLinks(), context),

              SizedBox(height: 20),
              // Add Achievement/Goal Button
              ElevatedButton(
                onPressed: () {
                  _showAddItemDialog(context);
                },
                child: Text("Add Achievement/Goal"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Header with Picture, Name, and Sport
  Widget _buildProfileHeader() {
    return Row(
      children: [
        // Replace with a placeholder image or use NetworkImage if you want to load from the web
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image URL
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              "Sport: Football",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  // Section with Card widget
  Widget _buildSectionWithCard(String title, Widget child, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(title),
            child,
          ],
        ),
      ),
    );
  }

  // Header for each section
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
      ),
    );
  }

  // Personal Information Section
  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.calendar_today, "Age: 25"),
        _buildInfoRow(Icons.height, "Height: 6'1\""),
        _buildInfoRow(Icons.accessibility, "Weight: 75kg"),
        _buildInfoRow(Icons.location_on, "Location: Mumbai, India"),
        _buildEditableButton(),
      ],
    );
  }

  // Editable Button (For editing profile)
  Widget _buildEditableButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Action to edit profile
        },
        child: Text("Edit Profile"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        ),
      ),
    );
  }

  // Helper method for creating info rows with Icons
  Widget _buildInfoRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueAccent),
          SizedBox(width: 8),
          Expanded( // Wrap in Expanded to avoid overflow
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  // Performance Stats Section
  Widget _buildPerformanceStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.sports_soccer, "Recent Score: 3 goals"),
        _buildInfoRow(Icons.emoji_events, "Best Performance: 5 goals in a match"),
        _buildInfoRow(Icons.access_time, "Last Match: 2 days ago"),
      ],
    );
  }

  // Injury Status Section with toggle
  Widget _buildInjuryStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.healing, "Current Injury: Ankle Sprain"),
        _buildInfoRow(Icons.access_time, "Recovery Status: 60%"),
        _buildInfoRow(Icons.medical_services, "Physiotherapy: 2 sessions per week"),
        _buildToggleInjuryStatus(),
      ],
    );
  }

  // Toggle Injury Status Button
  Widget _buildToggleInjuryStatus() {
    return Row(
      children: [
        Text("Toggle Injury Status: "),
        Switch(
          value: true, // Update this with the actual injury status logic
          onChanged: (value) {
            // Handle the switch toggle
          },
        ),
      ],
    );
  }

  // Goals and Progress Section
  Widget _buildGoalsProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.flag, "Next Goal: Win National Championship"),
        _buildInfoRow(Icons.trending_up, "Training Progress: 80%"),
        _buildInfoRow(Icons.star, "Career Milestone: 100th match played"),
      ],
    );
  }

  // Achievements Section
  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.emoji_events, "1st Place National Championship 2023"),
        _buildInfoRow(Icons.star, "Top Scorer: 2022 League"),
      ],
    );
  }

  // Athlete Stats Progress Section
  Widget _buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Training Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.8, // Replace with dynamic value (e.g., 80% progress)
          color: Colors.green,
          backgroundColor: Colors.grey[200],
        ),
        SizedBox(height: 8),
        Text("80% completed", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  // Social Media Section
  Widget _buildSocialMediaLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.facebook), "Facebook", "https://facebook.com/kadimi_rishi9"),
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.instagram), "Instagram", "https://instagram.com/kadimi_rishi9"),
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.twitter), "Twitter", "https://twitter.com/athlete"),
      ],
    );
  }

  // Helper method for social media links
  Widget _buildSocialMediaRow(Widget icon, String platform, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          icon,
          SizedBox(width: 8),
          Expanded( // Wrap in Expanded to prevent overflow
            child: Text(
              platform,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          TextButton(
            onPressed: () {
              // Action to open the link
            },
            child: Text("Open"),
          ),
        ],
      ),
    );
  }

  // Show dialog to add achievement or goal
  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add New Achievement/Goal"),
        content: TextField(
          decoration: InputDecoration(hintText: "Enter new achievement/goal"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add new item logic
              Navigator.pop(context);
            },
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
