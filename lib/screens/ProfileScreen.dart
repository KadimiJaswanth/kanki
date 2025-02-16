import 'package:flutter/material.dart';
import 'package:kanki/screens/AthleteProfileScreen.dart';
import 'package:kanki/screens/CoachProfileScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isTappedAthlete = false;
  bool _isTappedCoach = false;
  double _scaleAthlete = 1.0;
  double _scaleCoach = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Role", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Choose Your Profile Type", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildRoleCard("Athlete", Icons.sports_soccer, Colors.blue, AthleteProfileScreen(), 0),
                  _buildRoleCard("Coach", Icons.school, Colors.orange, CoachProfileScreen(), 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(String roleName, IconData icon, Color color, Widget targetScreen, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == 0) {
            _isTappedAthlete = true;
            _isTappedCoach = false;
            _scaleAthlete = 1.1;  // Slightly scale the athlete card
            _scaleCoach = 1.0;
          } else {
            _isTappedAthlete = false;
            _isTappedCoach = true;
            _scaleCoach = 1.1;  // Slightly scale the coach card
            _scaleAthlete = 1.0;
          }
        });

        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: AnimatedScale(
        scale: index == 0 ? _scaleAthlete : _scaleCoach,
        duration: Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (index == 0 && _isTappedAthlete)
                BoxShadow(
                  color: color.withOpacity(0.4),
                  spreadRadius: 6,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
              if (index == 1 && _isTappedCoach)
                BoxShadow(
                  color: color.withOpacity(0.4),
                  spreadRadius: 6,
                  blurRadius: 20,
                  offset: Offset(0, 0),
                ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 70, color: color),
                SizedBox(height: 10),
                Text(roleName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
