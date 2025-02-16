import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoachProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coach Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
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
              // Profile Header: Image, Name, Position
              _buildProfileHeader(),

              SizedBox(height: 20),
              // Personal Info Section with Card widget
              _buildSectionWithCard("Personal Information", _buildPersonalInfo(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Coaching Experience", _buildCoachingExperience(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Philosophy & Approach", _buildPhilosophyApproach(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Achievements", _buildAchievements(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Coaching Stats Progress", _buildProgressIndicator(), context),

              SizedBox(height: 20),
              _buildSectionWithCard("Team Development Progress", _buildTeamDevelopmentProgress(), context), // Added progress bar for Team Development

              SizedBox(height: 20),
              _buildSectionWithCard("Upcoming Events", _buildUpcomingEvents(), context), // Added Upcoming Events section

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

  // Profile Header with Picture, Name, and Position
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
              "Coach John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              "Position: Head Coach",
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    );
  }

  // Personal Information Section
  Widget _buildPersonalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.calendar_today, "Age: 40"),
        _buildInfoRow(Icons.location_on, "Location: New York, USA"),
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
          backgroundColor: Colors.orange,
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
          Icon(icon, size: 20, color: Colors.orange),
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

  // Coaching Experience Section
  Widget _buildCoachingExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.school, "Experience: 15 years"),
        _buildInfoRow(Icons.group, "Teams Coached: 5+ teams"),
        _buildInfoRow(Icons.emoji_events, "Coaching Achievements: 3 Championships"),
      ],
    );
  }

  // Philosophy & Approach Section
  Widget _buildPhilosophyApproach() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.format_quote, "Philosophy: Player-centric development"),
        _buildInfoRow(Icons.trending_up, "Approach: Focus on tactical intelligence and physical fitness"),
      ],
    );
  }

  // Achievements Section
  Widget _buildAchievements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.emoji_events, "1st Place National Championship 2022"),
        _buildInfoRow(Icons.star, "Coach of the Year 2021"),
      ],
    );
  }

  // Coaching Stats Progress Section
  Widget _buildProgressIndicator() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Coaching Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.9, // Replace with dynamic value (e.g., 90% progress)
          color: Colors.green,
          backgroundColor: Colors.grey[200],
        ),
        SizedBox(height: 8),
        Text("90% completed", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  // Team Development Progress Section (New Progress Bar)
  Widget _buildTeamDevelopmentProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Team Development Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.75, // Replace with dynamic value (e.g., 75% progress)
          color: Colors.blue,
          backgroundColor: Colors.grey[200],
        ),
        SizedBox(height: 8),
        Text("75% completed", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  // Upcoming Events Section (New Section)
  Widget _buildUpcomingEvents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow(Icons.event, "Next Match: Feb 20, 2025"),
        _buildInfoRow(Icons.schedule, "Upcoming Event: Coaching Seminar on Feb 25, 2025"),
      ],
    );
  }

  // Social Media Section
  Widget _buildSocialMediaLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.facebook), "Facebook", "https://facebook.com/coach_john"),
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.instagram), "Instagram", "https://instagram.com/coach_john"),
        _buildSocialMediaRow(FaIcon(FontAwesomeIcons.twitter), "Twitter", "https://twitter.com/coach_john"),
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
